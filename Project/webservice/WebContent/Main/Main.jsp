<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file ="../hedder_footer/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<%// css 파일 읽기를 위한 link%>
<link rel="stylesheet" href="../css/div_type.css?after">
<script>

</script>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



<div class='sdh_div_body'>
	<div class='sdh_body_Background'>
		<div class = 'sdh_Category_Background'>
			<div class='sdh_Category'>
				<ul>
					<li><a id="rice" class="Linked" href="./list.jsp?_cat=rice" >밥류</a></li>
					<li><a id="soup" class="Linked" href="./list.jsp?_cat=soup" >국물류</a></li>
					<li><a id="noodle" class="Linked" href="./list.jsp?_cat=noodle" >면류</a></li>
					<li><a id="side_dish" class="Linked" href="./list.jsp?_cat=side" >반찬</a></li>
					<li><a id="dessert" class="Linked" href="./list.jsp?_cat=dessert" >간식</a></li>
				</ul>
			</div>
		</div>
		<div class='sdh_Notice_Background'>
			<div class='sdh_Notice_Box'>
<%// 공지  %>
<%// 폰트 사이즈 조절 필요, table 맨 첫 tr은 목차형식. 그 뒤 tr 부터 a href 넘겨서 공지 띄우면 될듯합니다. %>
				<font size = "2">
					<table class = 'sdh_notice'>
					<%// 번호 / 제목 / 작성자 / 작성일 / 조회수 순서. 공지 숫자따라서 길이 자동조정됩니다. %>
					<tr>
						<th width = '5%'>번호</th>
						<th width = '40%'>제목</th>
						<th width = '15%'>작성자</th>
						<th width = '20%'>작성일</th>
						<th width = '10%'>조회수</th>
						</tr>
					<%
	try {
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		ResultSet rs1 = stmt.executeQuery("select * from server.notice order by noti_num desc");
		while(rs1.next()){
			int noti_num = rs1.getInt("noti_num");
			if (noti_num>6)
				break;
			String noti_title = rs1.getString("noti_title");
			String admin_id = rs1.getString("admin_id");
			String noti_day = rs1.getString("noti_day");
			String noti_view = rs1.getString("noti_views");
		%>
						<tr>
						<td><%=noti_num + 1 %></td>
						<td><a href=""
						onclick="window.open('../popup/Notice.jsp?noti_num=<%=noti_num %>', '공지사항', 'width=820, height=520,left=500,top=100,location=no,status=no,scrollbars=no, resizable=no, toolbars=no, menubar=no');"><%=noti_title %></a></td>
						<td><%=admin_id %></td>
						<td><%=noti_day %></td>
						<td><%=noti_view %></td>
						</tr>
						<%}
						
						rs1.close();
						stmt.close();
						conn.close();
						} catch(Exception e) {
							e.printStackTrace();
						}
						%>
					</table>
				</font>
			</div>
		</div>
<%// 베스트 레시피  %>
	<div class='sdh_Recipe_Background'>	
			<div class='sdh_Box_Title'>
			<a href=""><font color="#74b243">베스트</font> 레시피</a>
			</div>	
			<div class='sdh_Recipe_Box_Wrapper'>
				<table class='sdh_Recipe_Table'>
<%
					try {
						Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery(
				"select * from server.post where post_state=1 order by views desc");
						for(int i=0; i<2; i++){
						%>
						<tr><%
						for(int j=0; j<4; j++){
						rs.next();
						int post_code = rs.getInt("post_code");
						String title = rs.getString("post_title");
						String u_id = rs.getString("u_nick");
						int view = rs.getInt("views");
						String thumbnail = rs.getString("thumbnail");
						
						%>
						<td>
							<div class ='sdh_Recipe_Box'>
							<div class ='sdh_Recipe_Box_Img'><a href = '../post/PostBoard.jsp?post_code=<%=post_code%>'><img class="thumbnail" src='${cp}/example/files/<%=thumbnail%>'></a></div>
							<div class ='sdh_Recipe_Box_Title'><a href = '../post/PostBoard.jsp?post_code=<%=post_code%>'><%=title%></a></div>
							<div class ='sdh_Recipe_Box_Author'><%=u_id%></div>
							<div class ='sdh_Recipe_Box_View'><%=view%></div>
							</div>
						</td>
						<%}
						%>
						</tr>
					<% }
						//사용객체 연결해제
						rs.close();
						stmt.close();
						conn.close();
						} catch(Exception e) {
							e.printStackTrace();
							}
				%>
		
					
				</table>
			</div>
		</div>
		
<%// 최신 레시피  %>
		<div class='sdh_Recipe_Background'>	
			<div class='sdh_Box_Title'>
			<a href=""><font color="#74b243">최신</font> 레시피</a>
			</div>	
			<div class='sdh_Recipe_Box_Wrapper'>
				<table class='sdh_Recipe_Table'>
				<%
					try {
						Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery(
				"select * from server.post where post_state=1 order by post_day desc, post_code desc");
						for(int i=0; i<2; i++){
						%>
						<tr><%
						for(int j=0; j<4; j++){
						rs.next();
						int post_code = rs.getInt("post_code");
						String title = rs.getString("post_title");
						String u_id = rs.getString("u_nick");
						String day = rs.getString("post_day");
						String thumbnail = rs.getString("thumbnail");
						
						%>
						<td>
							<div class ='sdh_Recipe_Box'>
							<div class ='sdh_Recipe_Box_Img'><a href = '../post/PostBoard.jsp?post_code=<%=post_code%>'><img class="thumbnail" src='${cp}/example/files/<%=thumbnail%>'></a></div>
							<div class ='sdh_Recipe_Box_Title'><a href = '../post/PostBoard.jsp?post_code=<%=post_code%>'><%=title%></a></div>
							<div class ='sdh_Recipe_Box_Author'><%=u_id%></div>
							<div class ='sdh_Recipe_Box_View'><%=day%></div>
							</div>
						</td>
						<%}
						%>
						</tr>
					<% }
						//사용객체 연결해제
						rs.close();
						stmt.close();
						conn.close();
						} catch(Exception e) {
							e.printStackTrace();
							}
				%>
				</table>
			</div>
		</div>
	</div>
</div>

<%@ include file ="../hedder_footer/footer.jsp" %>
<%@ include file ="../hedder_footer/footer2.jsp" %>

</body>
</html>