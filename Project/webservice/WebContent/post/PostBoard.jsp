<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file ="../hedder_footer/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<link href="../css/PostBoard.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/div_type.css?after">
</head>
<body>
<script type="text/javascript">
function delete_ask(area){
	var s_id = '<%=(String) session.getAttribute("sessionID")%>';
	if(s_id == null){
		alert("로그인 후 이용 가능한 서비스 입니다.");
		area.blur();
	}
}
새로고침 방지
function noRefresh()
{
    /* CTRL + N키 막음. */
    if ((event.keyCode == 78) && (event.ctrlKey == true))
    {
        event.keyCode = 0;
        return false;
    }
    /* F5 번키 막음. */
    if(event.keyCode == 116)
    {
        event.keyCode = 0;
        return false;
    }
}

document.onkeydown = noRefresh ;
	
</script>
<%
	int i = 0;
	int veiws = 0;
	int state = 0;
	String post_code = request.getParameter("post_code");
	try {
	Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("select * from server.post where post_code="+post_code+"");
	if(rs.next()){
		String title = rs.getString("post_title");
		String comment = rs.getString("post_comment");
		String thumbnail = rs.getString("thumbnail");
		state = rs.getInt("post_state");
		int time = rs.getInt("post_cooktime");
		veiws = rs.getInt("views");
		String c_time = "";
			if(time == 10)
				c_time = "10분 내외";
			if(time == 20)
				c_time = "20분 내외";
			if(time == 30)
				c_time = "30분 내외";
			if(time == 40)
				c_time = "40분 내외";
			if(time == 50)
				c_time = "50분 내외";
			if(time == 60)
				c_time = "60분 내외";
		String cat = rs.getString("post_cookcat");
		if(cat.equals("rice"))
			cat="밥류";
		if(cat.equals("soup"))
			cat="국물류";
		if(cat.equals("noodle"))
			cat="면류";
		if(cat.equals("side"))
			cat="반찬류";
		if(cat.equals("dessert"))
			cat="디저트류";
		String dif = rs.getString("post_cookdiff");
		if(dif.equals("1"))
			dif="하";
		if(dif.equals("2"))
			dif="중";
		if(dif.equals("3"))
			dif="상";
		String day = rs.getString("post_day");
		String nick = rs.getString("u_nick");
		
	%>
	
	<div class="mother">
	
	<div class="between"
					style="width: 1200px; height: 20px; background-color: #f1f1f2;">
					</div>
		<div class="recipe">

			<div class="postBoard_view">

				<div class="post_view">
					<div class="mainThumb">
						<img src="${cp}/example/files/<%=thumbnail%>"
							style="border-radius: 10px; width: 400px; height: 400px;">
					</div>
				</div>
				<!-- post_view -->

				<div class="catBox">
					<div class="menuIcon">
						<img class="menuView2Pic_1" src="${cp}/Img/menu.png">
					</div>
					<div class="timeIcon">
						<img class="menuView2Pic_2" src="${cp}/Img/time.png">
					</div>
					<div class="levelIcon">
						<img class="menuView2Pic_3" src="${cp}/Img/level.png">
					</div>
				</div>

				<div class="catBox2">
					<div class="menuView">
						<span class="menuWrite"><%=cat %></span>
					</div>
					<div class="timeView">
						<span class="timeWrite"><%=c_time %></span>
					</div>
					<div class="levelView">
						<span class="levelWrite"><%=dif %></span>
					</div>
				</div>

				<div class="view_summary">
					<textarea class="sum_tit" readonly><%=title %></textarea>
				</div>
				<div class="view_summary2">
					<textarea class="sum_tit2" readonly><%=comment %></textarea>
				</div>
				<div class="profile">
					<a href="" class="userInfo_pic"> <img class="info-pic"
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpqj8274FcGWcbm7E0mUjDwSpAwjhpC9RlEQ&usqp=CAU">
					</a><span>Posted by/<%=nick %></span>
				</div>
				<div class="between1"
					style="width: 85%; height: 4px; background-color: #f1f1f2; margin-left: 100px;"></div>

				<%
				i=0;
				ResultSet rs5 = stmt.executeQuery("select comm_num from server.comment where post_code="+post_code+" order by comm_num asc");
				while(rs5.next()){
					i++; 
				 }
				rs5.close();
				int good=0;
				ResultSet rs6 = stmt.executeQuery("select * from server.good where post_code="+post_code+"");
				while(rs6.next()){
					good++; 
				 }
				rs6.close();
				%>
				<div class="catBox3">
                    <div class="gcView">
                        <button class="goodBtn" id="good" onClick="location.href='./goodPost.jsp?post_code=<%=post_code%>'"><img class="goodViewPic" src="${cp}/Img/good.png"></button>
                    </div>
                    <div class="timeView2">
                        <button class="commentBtn" id="comments"><img class="comViewPic" src="${cp}/Img/Comment.png"></button>
                    </div>
                </div>
<%-- 				<%ResultSet rs2 = stmt.executeQuery("select * from server.good"); %> --%>
				<div class="catBox2_1">
					<div class="gcView">
						<span class="goodNum"><%=good %></span>
					</div>
					<div class="timeView2">
						<span class="comNum"><%=i %></span>
					</div>
				</div>

				<div class="between"
					style="width: 1200px; height: 20px; background-color: #f1f1f2;">
				</div>
				<div class="post_view2">
					<div class="guide">
						<span class="guide-tit" style="font-size: 20px;"><b><h3>재료</h3></b>
						</span>
					</div>
					<div class="material_cont">
						<input type="text" value="재료/양념" class="form-control" readonly>
					</div>
					<div class="materialBox2">
						<ul id="divMaterialArea_1" class="ui-sortable">
						<%
						ResultSet rs2 = stmt.executeQuery("select * from stuff where post_code="+post_code+"");
						while(rs2.next()){
							String st_name = rs2.getString("stuf_name");
							String st_amount = rs2.getString("stuf_amount");
						
						%>
							<li id="liMaterial_1_1">
								<input type="text" class="form_control1" value="<%=st_name %>" readonly> 
								<input type="text" class="form_control2" value="<%=st_amount %>" readonly>
							</li>
						<%}
						rs2.close();
						%>
						</ul>
					</div>
				
				</div>
				<div class="between"
					style="width: 1200px; height: 20px; background-color: #f1f1f2;">
				</div>

				<div class="post_view3">
					<div class="guide2">
						<span class="guide-tit" style="font-size: 20px;"><b><h3>조리순서</h3></b>
						</span>
					</div>
					<% ResultSet rs3 = stmt.executeQuery("select * from progress_pic where post_code="+post_code+"");
					i=1;
						while(rs3.next()){
							
							String pic_name = rs3.getString("pic_name");
							String pic_content = rs3.getString("pic_content");
							%>
					<div id="stepDiv1" class="view_step1">
						<div class="StepNum"><%=i %></div>
						<div class="StepCon">
							<textarea class="step-control"
								readonly><%=pic_content %></textarea>
						</div>
						<div class="StepPhoto">
							<input type="file" name="file1" id="file1" style="display: none">
							<img class="stepViewPic" src="${cp}/example/files/<%=pic_name %>" id="stepViewPic">
						</div>
					</div>
					<% 
					i++;}
					rs3.close();
					%>

				</div>
				<div class="between"
					style="width: 1200px; height: 20px; background-color: #f1f1f2;">
				</div>
				<%
				i=0;
				ResultSet rs4 = stmt.executeQuery("select * from server.comment where post_code="+post_code+" order by comm_num asc");
				while(rs4.next()){
					i++; 
				 }
				
				rs4.beforeFirst();
				
				%>
				<div class="post_view4">
					<div class="guide">
						<div class="reply_tit" style="font-size: 20px;">
							<h3>
								요리후기 <span id="guide-tit" style="font-size: 20px;"><b><%=i %>
								</b> </span>
							</h3>
						</div>
					</div>
					<table class="admintb" id ="RecipeList">
      <form aciton="" id="setRows">
				<input type="hidden" name="rowPerPage" value="8">
			</form>
					<%
					int total=0;
					while(rs4.next()){
						total++;
					}
					rs4.beforeFirst();
					for(i=0; i<total;i++){
						rs4.next();
						int comm_num = rs4.getInt("comm_num");
						String commnet = rs4.getString("coment");
						String comm_day = rs4.getString("comm_day");
						String comm_nick = rs4.getString("u_nick");
					%>
					<tr>
					<td>
					<div class="view_step2">
						<div class="media_left">
							<a href=""><img class="mediaPro" src="${cp}/Img/login.png"></a>
						</div>
						<div class="media_body">
							<h4 class="media_heading">
								<b class="info_name"><%= comm_nick%> </b><span class="comment_time"
									id="comment_time"><%= comm_day %> |</span> <a
									href="./commentReport.jsp?comm_num=<%=comm_num%>&post_code=<%=post_code%>">신고</a>
							</h4>
							<p class="comment_contents"><%=commnet %></p>
						</div>
					</div>
					</td>
					</tr>
					<% }
					rs4.close();
					%>
					</table>
					<div class="main_writeBox"></div>
					
					
					<div class="main_comment">
						<form action="comment_save.jsp" method="post">
						<textarea onfocus="delete_ask(this);" name="comment" class="main_commentBox" placeholder="간단한 후기와 댓글을 남겨주세요.(100자 이내)" maxlength="100"></textarea>
						<input type="hidden" name="u_nick" value="<%=s_id%>">
						<input type="hidden" name="post_code" value="<%=post_code%>">
						<button class="main_commentUp" type="submit">등록</button>
						</form>

					</div>
					
					<%}
	rs.close();
	if(state==1){
	stmt.executeUpdate("Update server.post set views = "+(veiws+1)+" where post_code="+post_code+"");
	}
	stmt.close();
	conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>

				</div>

			</div>
		</div>

	<div class="between"
					style="width: 1200px; height: 20px; background-color: #f1f1f2;">
					</div>
	</div>
<%@ include file ="../hedder_footer/footer.jsp" %>
<%@ include file ="../hedder_footer/footer2.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<script src="./list_paging.js"></script>

</body>
</html>