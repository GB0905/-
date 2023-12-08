<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
    <%@ include file ="./Admin_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/Admin.css"/>
	<link rel="stylesheet" href="../css/div_type.css?after">
</head>
<body>

<article>

	<div class="area_line"></div>

	<div class="main">
	<div class="area_line"></div>
	<p>게시물 관리</p>
	 <div id="searchtable-area">
		<form action="./AdminPost.jsp" method="post" id="searchtalbe-form">
			<input name="_searchWord"id ="searchtable" type="text" maxlength="100" placeholder="관리자 닉네임을 검색하세요"  />
			<button id="searchtablebtn">검색</button>
		</form>
<!-- 			<select name="post" class="postselect"> -->
<!-- 			    <option selected>게시물</option> -->
<!--     			<option value="등록">등록</option> -->
<!--     			<option value="삭제">삭제</option> -->
<!-- 			</select> -->
	</div>
	
    <table class="admintb">
        
        <tr>
            <th width=8%>번호</th>
            <th width=40%>제목</th>
            <th width=10%>카테고리</th>
            <th width=10%>작성자</th>
            <th width=12%>작성일</th>
            <th width=10%>조회수</th>
            <th width=10%>관리</th>
        </tr>
        </table>
      <table class="admintb" id ="RecipeList">
      <form aciton="" id="setRows">
				<input type="hidden" name="rowPerPage" value="20">
			</form>
        <%	
        	request.setCharacterEncoding("utf-8");
        	String s_word = request.getParameter("_searchWord");
        	String state = "0";
        	String text = "";
        	String url = "";
        	try {
			Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
			Statement stmt = conn.createStatement();
			ResultSet rs;
			if(s_word==null){rs = stmt.executeQuery(
					"select * from server.post order by post_state asc");
					} else{rs = stmt.executeQuery(
					"select * from server.post where post_title like '%"+s_word+"%' order by post_state asc");
					}
			int total = 0;
			while(rs.next()){
				total++;
			}
			rs.beforeFirst();
			for(int i=0; i<total;i++){
				rs.next();
				int post_code = rs.getInt("post_code");
				String post_title = rs.getString("post_title");
				String post_cookcat = rs.getString("post_cookcat");
				String u_nick = rs.getString("u_nick");
				String post_day = rs.getString("post_day");
				int views = rs.getInt("views");
				int post_state = rs.getInt("post_state");
				if(post_state==0) {
					url="./postOk.jsp";
					state="postbtn";
					text="등록";
				} else if(post_state==1) {
					url="./postDelete.jsp";
					state="deletebtn";
					text="삭제";
				}
		%>
					<tr>
           				<td width=8%><%=post_code%></td>
            			<td width=40%><a class="menulink"  href="../post/PostBoard.jsp?post_code=<%=post_code %>" 
 						onclick="window.open(this.href, '_blank', 'width=820, height=520,left=500,top=100,location=no,status=no,scrollbars=no, resizable=no, toolbars=no, menubar=no'); return false;">
 						<%=post_title %></a></td>
            		<td width=10%><%=post_cookcat %></td>
            		<td width=10%><%=u_nick %></td>
            		<td width=12%><%=post_day %></td>
            		<td width=10%><%=views %></td>
            		<td width=10%><a href="<%=url%>?post_code=<%=post_code%>"><button class=<%=state %>><%=text %></button></a></td>
            		<!--삭제 누르면 DB삭제, 테이블 행 삭제, 정말 삭제할거냐고 묻기-->
        		</tr>
					<%}
						
					rs.close();
					stmt.close();
					conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					}
					%> 
           
    </table>
    
   <div class="area_line"></div>
	
	</div>
	
	<div class="area_line"></div>
	
</article>
<%@ include file ="./Admin_footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<script src="./list_paging.js"></script>

</body>
</html>