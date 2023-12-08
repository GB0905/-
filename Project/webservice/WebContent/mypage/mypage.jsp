<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%@ include file ="../hedder_footer/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<title>Insert title here</title>
<%// css 파일 읽기를 위한 link%>
<link rel="stylesheet" href="../css/div_type.css?after">
<%
		if(s_id == null && a_id==null){
			out.println("<script>alert('로그인 후 사용 가능합니다.');</script>");
			out.println("<script> location.replace('../Main/Main.jsp'); </script>");
		} else if(a_id != null){
			out.println("<script>alert('관리자 정보수정은 총 책임자에게 문의 부탁드립니다.');</script>");
			out.println("<script> location.replace('../Main/Main.jsp'); </script>");
		}
	%>
</head>
<body>
<script type="text/javascript">
function resign_ask(){
	if(confirm("탈퇴하시겠습니까?")){
		button.onclick();
		return true;
	}
	else{
		return true;
	}
}
</script>
<div class='sdh_div_body'>
	<div class='sdh_body_Background'>
		<div class = 'sdh_Category_Background'>
			<div class='sdh_Category'>
				<ul>
					<li><a id="rice" class="Linked" href="../Main/list.jsp?_cat=rice" >밥류</a></li>
					<li><a id="soup" class="Linked" href="../Main/list.jsp?_cat=soup" >국물류</a></li>
					<li><a id="noodle" class="Linked" href="../Main/list.jsp?_cat=noodle" >면류</a></li>
					<li><a id="side_dish" class="Linked" href="../Main/list.jsp?_cat=side" >반찬</a></li>
					<li><a id="dessert" class="Linked" href="../Main/list.jsp?_cat=dessert" >간식</a></li>
				</ul>
			</div>
		</div>
		<%
					try {
						Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
						Statement stmt = conn.createStatement();
					
					%>
		<div class ='sdh_mypage'>
			<div class = 'sdh_mypage_nav'>
				<div class = 'sdh_tab'>
					<ul class='sdh_tabnav'>
						<li><a href="#info">회원정보</a></li>
						<li><a href="#list">내가 쓴 글</a></li>
						<li><a href="#review">내가 쓴 후기</a></li>
						<li><a href="#question">문의내역</a></li>
					</ul>
					
					<div class='sdh_tabcontent'>
						<div class='sdh_tab_content_box' id="info">
						<%
						String id;
						String nick;
						String phone;
						String birth;
						String name;
						String gender;
						ResultSet rs1;
						if(a_id==null){
							rs1 = stmt.executeQuery("select * from server.user where u_nick='"+s_id+"'");
							rs1.next();
							id = rs1.getString("u_id");
							nick = rs1.getString("u_nick");
							name = rs1.getString("u_name");
							gender = rs1.getString("gender");
							phone = rs1.getString("phone");
							birth = rs1.getString("birth");
						}
						else{
							rs1 = stmt.executeQuery("select * from server.admin where admin_nick='"+s_id+"'");
							rs1.next();
							id = rs1.getString("admin_id");
							nick = rs1.getString("admin_nick");
							name = rs1.getString("admin_name");
							gender = rs1.getString("admin_gender");
							phone = rs1.getString("admin_phone");
							birth = rs1.getString("admin_birth");
						}
						%>
							<form action="./UpdateOk.jsp" method="post">
								<table>
								<tr><td>
								E-mail
								</td><td>
								<input type="hidden" name="_E_mail" value="<%=id %>">
								<%=id %>
								</td><td>	
								</td></tr>
								<tr><td>
								이름
								</td><td>
								<%=name %>
								</td><td>	
								</td></tr>
								<tr><td>
								성별
								</td><td>
								<%=gender %>
								</td><td>
								</td></tr>
								<tr><td>
								전화번호
								</td><td>
								<input type="hidden" name="_tel" value="<%=phone %>">
								<%=phone %>
								</td><td>	
								</td></tr>
								<tr><td>
								닉네임
								</td><td>
								<input type="hidden" name="_nick" value="<%=nick %>">
								현재 닉네임:<%=nick %>
								</td><td>	
								</td></tr>
								<tr><td>
								</td><td>
								<input type="text" name="change_nick" placeholder="변경할 닉네임">
								</td><td>	
								<input type="submit" value="수정">
								</td></tr>
								<tr><td>
								생일
								</td><td>
								<%=birth %>							
								</td><td>	
								</td></tr>
								<tr><td>
								<tr><td>
								</td><td>
								</td><td>
								<a href="./userResign.jsp"><button onClick="resign_ask(); return false;">회원탈퇴</button></a><p>	
								</td></tr>
								</table>
							</form>
						</div>
						<%
						rs1.close(); 
						
						ResultSet rs2 = stmt.executeQuery("select * from server.post where u_nick='"+s_id+"'");
						int i = 0;
						while(rs2.next()){
							i++;
						}
						rs2.beforeFirst();
						int post_total = i;
						%>
						<div class='sdh_tab_content_box' id="list">
							<div class = 'sdh_list_Total_Number'>총 게시물 : <%=post_total %>개</div>
							<div class='sdh_Recipe_Background'>	
								<div class='sdh_Box_Title'>내가 쓴 글</div>
								<div class='sdh_Recipe_Box_Wrapper'>
									<table class='sdh_Recipe_Table' id="RecipeList">
										<form action="" id="setRows">
											<input type="hidden" name="rowPerPage" value="2">
										</form>
										<%for(i=0;i<((post_total/2)+1);++i)
											{%>
										<tr>
										<%for(int j=0;j<2;++j){
											if(!rs2.next()) 
												break;
											int post_code = rs2.getInt("post_code");
											String title = rs2.getString("post_title");
											String u_id = rs2.getString("u_nick");
											int view = rs2.getInt("views");
											String thumbnail = rs2.getString("thumbnail");%>
										<td>
											<div class = 'sdh_Recipe_Box'>
												<div class ='sdh_Recipe_Box_Img'><a href = "../post/PostBoard.jsp?post_code=<%=post_code%>"><img class="thumbnail" src="${cp}/example/files/<%=thumbnail%>"></a></div>
												<div class ='sdh_Recipe_Box_Title'><a href = "../post/PostBoard.jsp?post_code=<%=post_code%>"><%=title %></a></div>
												<div class ='sdh_Recipe_Box_Author'><%=u_id %></div>
												<div class ='sdh_Recipe_Box_View'>조희수 : <%=view %></div>
											</div>
										</td>
										<%} %>
										</tr>
										<%} 
										rs2.close();
										%>
									</table>
								</div>
							</div>
						</div>
						<div class='sdh_tab_content_box' id="review">
						<%
						ResultSet rs3 = stmt.executeQuery("select * from server.comment c join server.post p on c.post_code = p.post_code and c.u_nick='"+s_id+"'");
						i=0;
						while(rs3.next()){
							i++;
						}
						rs3.beforeFirst();
						int comm_total = i;
						%>
							<div class = 'sdh_list_Total_Number'>총 후기 : <%=comm_total %>개</div>
							<div class='sdh_Recipe_Background'>	
								<div class='sdh_Box_Title'>내가 쓴 후기</div>
								<div class='sdh_Recipe_Box_Wrapper'>
									<table class='sdh_Recipe_Table' id="RecipeList3">
										<form action="" id="setRows3">
											<input type="hidden" name="rowPerPage" value="5">
										</form>
										<%for(i=0;i<comm_total;++i)
											{
											rs3.next();
											%>
										<tr>
										<%for(int j=0;j<1;++j)
											{%>
										<td>
											<div class = 'sdh_Review_Box'>
												<div class ='sdh_Review_Box_Img'><a href = "../post/PostBoard.jsp?post_code=<%=rs3.getString("post_code")%>"><img class="thumbnail" src="${cp}/example/files/<%=rs3.getString("thumbnail")%>"></a></div>
												<div class ='sdh_Review_DivWapper'>
													<div class ='sdh_Review_Box_Title'><a href = "../post/PostBoard.jsp?post_code=<%=rs3.getString("post_code")%>"><%=rs3.getString("post_title") %></a></div>
													<div class ='sdh_Review_Box_Text'><%=rs3.getString("coment") %></div>
													<div class ='sdh_Review_Box_Date'><%=rs3.getString("comm_day") %></div>
													<div class ='sdh_Review_Box_Del'><label style="cursor:pointer;" onclick="location.href='./deleteComment.jsp?comm_num=<%=rs3.getInt("comm_num")%>'">삭제</label></div>
												</div>
											</div>
										</td>
										<%} %>
										</tr>
										<%} 
										rs3.close();
										%>
									</table>
								</div>
							</div>
						</div>
						<div class='sdh_tab_content_box' id="question">
						<%
						ResultSet rs4 = stmt.executeQuery("select * from server.question where u_nick = '"+s_id+"'");
						i=0;
						while(rs4.next()){
							i++;
						}
						rs4.beforeFirst();
						int ques_total = i;
						%>
							<div class = 'sdh_list_Total_Number'>총 문의내역 : <%=ques_total %>개</div>
							<div class='sdh_Recipe_Background'>	
								<div class='sdh_Box_Title'>내 문의내역</div>
								<div class='sdh_Notice_Box'>
									<font size = "2">
										<table class = 'sdh_notice'>
											<tr>
											<th width = '5%'>번호</th>
											<th width = '40%'>제목</th>
											<th width = '15%'>작성자</th>
											<th width = '20%'>작성일</th>
											<th width = '10%'>접수상태</th>
											</tr>
											<%
											String state="";
											for(i = 0; i < ques_total; ++i){
												if(!rs4.next())
													break;
												if(rs4.getInt("q_state")==1)
													state = "답변완료";
												else
													state = "답변대기";
												%>
											<tr>
											<td><%=rs4.getInt("q_num") %></td>
											<td><label style="cursor:pointer" onclick="window.open('../popup/ReceiveDoneService.jsp?_num=<%=rs4.getInt("q_num") %>','문의 답변'
						,'width=1020,height=570,left=570,top=100,location=no,status=no,scrollbars=yes');" ><%=rs4.getString("q_title") %></label></td>
											<td><%=rs4.getString("u_nick") %></td>
											<td><%=rs4.getString("q_day") %></td>
											<td><%=state %></td>
											</tr>
											<%} %>
										</table>
									</font>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class = 'sdh_mypage_right'>
					<div class = 'sdh_Recipe_Box'>
						<div class ='sdh_Recipe_Box_Img'><img src="../Img/login.png"></div>
						<div class ='sdh_Recipe_Box_Title'><%=s_id %></div>
						<div class ='sdh_Recipe_Box_Author'>총 게시물 : <%=post_total %></div>
						<div class ='sdh_Recipe_Box_View'>총 댓글 : <%=comm_total %></div>
					</div>
			</div>

		<% 
		stmt.close();
		conn.close();
					} catch(Exception e){
						e.printStackTrace();
					}
					%>
		</div>
			
		
	</div>
</div>
<!-- Script -->
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<script src="mypage_tabnav.js"></script>
<script src="list_paging3.js"></script>
<script src="list_paging.js"></script>
<br>
<%@ include file ="../hedder_footer/footer.jsp" %>
<%@ include file ="../hedder_footer/footer2.jsp" %>
</body>
</html>