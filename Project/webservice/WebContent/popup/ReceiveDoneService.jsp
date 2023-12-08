<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<title>문의답변 완료</title>
	<link rel="stylesheet" type="text/css" href="../css/ReceiveDoneService.css" />
</head>
<body>
<%
	String q_num = request.getParameter("_num");
	try {
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(
			"SELECT * FROM server.question where q_num="+q_num+"");
		if(rs.next()){
			int num = rs.getInt("q_num");
			String title = rs.getString("q_title");
			String id = rs.getString("u_nick");
			String q_content = rs.getString("q_content");
			String q_comment = rs.getString("q_comment");
			if(q_comment==null)
				q_comment="";
			%>
		
<div class="top_line"></div>
 <div id="Receive_service_write">
        
            <div id="Toparea">
            <h2>1:1 문의 답변</h2>
            <p><%=id %> 회원님께서 문의하신 내용의 답변입니다.
            </div>
            <div class="top_line2"></div>
            <div class="top_line2"></div>
                <form method="get"  >
                
                <div class="tablearea">
               
                <table>
                              
  				<tr>
    			<th>제목</th>
    			<td><%=title %></td>
  				</tr>
  				<tr>

    			<th>내용</th>
    			<td >	
				<textarea id="content_td" readonly><%=q_content %></textarea>
				</td>
  				</tr>
  				<tr>
  				
  				<th>답변</th>
   				<td>
   				<textarea id="scontent" readonly><%=q_comment %></textarea>
   				</td>
 				</tr>
 				
				</table>
                
                    <div id="bottom_line"></div>
                    
                    <div class="Bottomarea">   	
                   		
					</div>  
                
                 </div>
                </form>
                <% 
                }
                rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
            </div>

</body>
</html>