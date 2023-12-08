<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<title>문의답변 하기</title>
	<link rel="stylesheet" type="text/css" href="../css/ReceiveServiceWrite.css" />
</head>
<body>

<%
	String q_num = request.getParameter("_num");
	try {
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(
			"SELECT q_num, q_title, q_content, q_comment, u_nick FROM server.question where q_num="+q_num+"");
		if(rs.next()){
			int num = rs.getInt("q_num");
			String title = rs.getString("q_title");
			String id = rs.getString("u_nick");
			String q_content = rs.getString("q_content");
			String q_comment = rs.getString("q_comment");
			%>
		
			<div class="top_line"></div>
 			<div id="Receive_service_write">
        
            <div id="Toparea">
            	<h2>1:1 문의 답변</h2>
            	<p><%=id %> 회원님께서 문의하신 내용의 답변입니다.
            </div>
            <div class="top_line2"></div>
                <form action="./ServiceCommentSave.jsp" method="post"  >
                
                	<div class="tablearea">
               
                	<table>
                              
  						<tr>
    						<th>제목</th>
    						<td><%=title %></td>
  						</tr>
  							
  						<tr>
    						<th>내용</th>
    						<td>	
								<textarea id="content_td" readonly><%=q_content %></textarea>
							</td>
  						</tr>
  						
  						<tr>			
  							<th>답변</th>
   								<td><textarea name="_Rcontent" id="scontent" required></textarea></td>
 						</tr>
 				
					</table>
					
                    <div id="bottom_line"></div>
                    <div class="Bottomarea">
 							<input type="hidden" name="_num" value="<%=num %>">
                        	<button id="write_btn" type="submit">답변하기</button>
                   		
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