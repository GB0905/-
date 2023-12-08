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
<script type="text/javascript">
function delete_ask(){
	if(confirm("삭제하시겠습니까?")){
		button.onclick();
		return true;
	}
	else{
		alert("취소하셨습니다.");
		window.close();
		return true;
	}
}
	
</script>
<article>

	<div class="area_line"></div>

	<div class="main">
	<div class="area_line"></div>
	<p>공지 관리</p>
	 <div id="searchtable-area">
		<form id="searchtalbe-form" action="./Admin.jsp">
			<input id ="searchtable" name ="_searchWord" type="text" maxlength="100" placeholder="제목을 입력하세요"  />
			<button id="searchtablebtn">검색</button>
		</form>
	</div>
	
    <table class="admintb">
        
        <tr>
            <th width=10%>번호</th>
            <th width=50%>제목</th>
            <th width=15%>작성일</th>
            <th width=15%>조회수</th>
            <th width=10%>관리</th>
        </tr>
      </table>
      <table class="admintb" id ="RecipeList">
      <form aciton="" id="setRows">
				<input type="hidden" name="rowPerPage" value="7">
			</form>
        <%
	try {
		request.setCharacterEncoding("utf-8");
		String s_word = request.getParameter("_searchWord");
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		ResultSet rs;
		if(s_word==null){rs = stmt.executeQuery(
				"SELECT * FROM server.notice order by noti_num asc");
				} else{rs = stmt.executeQuery(
				"SELECT * FROM server.notice where noti_title like '%"+s_word+"%'order by noti_num asc");
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
			int noti_num = rs.getInt("noti_num");
			String noti_title = rs.getString("noti_title");
			String noti_day = rs.getString("noti_day");
			String noti_view = rs.getString("noti_views");
		%>
					
					<td width=10%><%=noti_num %></td>
					<td width=50%><a class="menulink" href=""
					onclick="window.open('../popup/Notice.jsp?noti_num=<%=noti_num %>', '공지사항', 'width=820, height=520,left=500,top=100,location=no,status=no,scrollbars=no, resizable=no, toolbars=no, menubar=no');"><%=noti_title %></a></td>
					<td width=15%><%=noti_day %></td>
					<td width=15%><%=noti_view %></td>
					<td width=10%><a href="../popup/Notice_Delete.jsp?noti_num='<%=noti_num %>'"><button class="deletebtn" onClick="delete_ask(); return false;">삭제</button></a></td>
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