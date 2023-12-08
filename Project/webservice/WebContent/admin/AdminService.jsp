<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
    <%@ include file ="../admin/Admin_header.jsp" %>
    
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
	<!------------------------------------------------>
	<div class="main">
	<div class="area_line"></div>
	<p>문의내역</p>
	    <div id="searchtable-area">
		<form id="searchtalbe-form" action="./AdminService.jsp" method="post">
			<input name="_searchWord"id ="searchtable" type="text" maxlength="100" placeholder="제목을 입력하세요"  />
			<button id="searchtablebtn">검색</button>
			
		</form>
	</div>
    <table class="admintb">
        <tr>
            <th width=8%>번호</th>
            <th width=50%>제목</th>
            <th width=10%>작성자</th>
            <th width=10%>답변</th>
            <th width=13%>날짜</th>
            <th width=10%>상태</th>
        </tr>
        </table>
      <table class="admintb" id ="RecipeList">
      <form aciton="" id="setRows">
				<input type="hidden" name="rowPerPage" value="7">
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
					"SELECT q_num, q_title, q_day, q_state, u_nick, admin_id FROM server.question order by q_num asc");
					} else{rs = stmt.executeQuery(
					"SELECT q_num, q_title, q_day, q_state, u_nick, admin_id FROM server.question where q_title like '%"+s_word+"%' order by q_num asc");
					}%>
					<%
					int total=0;
					while(rs.next()){
						total++;
					}
					rs.beforeFirst();
					for(int i=0; i<total;i++){
						rs.next();
						int num = rs.getInt("q_num") + 1;
						String title = rs.getString("q_title");
						String day = rs.getString("q_day");
						int flag = rs.getInt("q_state");
						String id = rs.getString("u_nick");
						String admin_id = rs.getString("admin_id");
						if(admin_id==null)
							admin_id="";
						
						//변수로 사용
						String state = "";
						String btn = "";
						String service_link = "";
						if (flag==0){
							btn="anwserbtn";
							state="신규";
							service_link="../popup/ReceiveServiceWrite.jsp";
						}
						else{
							state="완료";
							btn="anwserdonebtn";
							service_link="../popup/ReceiveDoneService.jsp";
						}
					%>
					<tr>
						<td width=8%><%=num %></td>
            			<td width=50%><%=title %></td>
        			    <td width=10%><%=id %></td>
    			        <td width=10%><%=admin_id %></td>
    			        <td width=13%><%=day %></td>
    			        <td width=10%><button class="<%=btn %>" onclick="window.open('<%=service_link %>?_num=<%=num-1 %>','문의 답변'
						,'width=1020,height=570,left=570,top=100,location=no,status=no,scrollbars=yes');" ><%=state %></button></td>
					</tr>
					<%}%>
				<%
				//사용객체 연결해제
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

<%@ include file ="../admin/Admin_footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<script src="./list_paging.js"></script>

</body>
</html>