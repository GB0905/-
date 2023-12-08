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
	<p>댓글 관리</p>
	 <div id="searchtable-area">
		<form id="searchtalbe-form" action="./AdminComment.jsp" method="post">
			<input name="_searchWord"id ="searchtable" type="text" maxlength="100" placeholder="내용을 검색하세요."  />
			<button id="searchtablebtn">검색</button>
		</form>
	</div>
	
    <table class="admintb">
        
        <tr>
            <th width=8% style="height:60px;">게시물 번호</th>
            <th width=50% style="height:60px;">내용</th>
            <th width=10% style="height:60px;">작성자</th>
            <th width=12% style="height:60px;">작성일</th>
            <th width=10% style="height:60px;">신고수</th>
            <th width=10% style="height:60px;">관리</th>
        </tr>
        </table>
        <table class="admintb" id ="RecipeList">
        <form aciton="" id="setRows">
				<input type="hidden" name="rowPerPage" value="20">
			</form>
        <%
        	ResultSet rs;
        	request.setCharacterEncoding("utf-8");
        	String s_word = request.getParameter("_searchWord");
			try {
				Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
				Statement stmt = conn.createStatement();
				if(s_word==null){rs = stmt.executeQuery(
					"SELECT * FROM server.comment order by comm_report desc");
					} else{rs = stmt.executeQuery(
					"SELECT * FROM server.comment where coment like '%"+s_word+"%'order by comm_report desc");
					}
				int total = 0;
					while(rs.next()){
						total++;}
					rs.beforeFirst();
					%>
					<%
		for(int i=0; i<total;i++){
			%><tr><%
			rs.next();
			%>
            <td width=8%><%=rs.getInt("comm_num") %></td>
            <td width=50%><a class="menulink"  href="../post/PostBoard.jsp?post_code=<%=rs.getString("post_code") %>" 
 					onclick="window.open(this.href, '게시판', 'width=820, height=520,left=500,top=100,location=no,status=no,scrollbars=no, resizable=no, toolbars=no, menubar=no'); return false;"><%=rs.getString("coment") %></a></td>
           <td width=10%><%=rs.getString("u_nick") %></td>
            <td width=12%><%=rs.getString("comm_day") %></td>
            <td width=10%><%=rs.getString("comm_report") %></td>
            <td width=10%><button class="deletebtn" onclick="location.href='./deleteCommentAdmin.jsp?comm_num=<%=rs.getInt("comm_num")%>'">삭제</button></td>
            <!--삭제 누르면 DB삭제, 테이블 행 삭제, 정말 삭제할거냐고 묻기-->
        </tr>
        <%}
		rs.close();
		stmt.close();
		conn.close();
		}catch(Exception e){
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