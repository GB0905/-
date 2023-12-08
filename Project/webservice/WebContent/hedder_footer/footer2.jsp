<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/header_footer.css" />
</head>
<body>
<%
int t_post = 0;
int t_comm = 0;
int t_user = 0;
int t_views = 0;
try {
	Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
	Statement stmt = conn.createStatement();
	ResultSet rs= stmt.executeQuery("select u_nick from server.user");
	while(rs.next()){
		t_user++;
	}
	rs.close();
	ResultSet rs1= stmt.executeQuery("select views from server.post");
	while(rs1.next()){
		t_views += rs1.getInt("views");
		t_post++;
	}
	rs1.close();
	ResultSet rs2= stmt.executeQuery("select comm_num from server.comment");
	while(rs2.next()){
		t_comm++;
	}
	rs2.close();
	stmt.close();
	conn.close();
} catch(Exception e){
	e.printStackTrace();
}
%>
<footer>
	
	<div class="footer2">
	<div class="foot2container">
	<ul class="btm_stats">
            <li><span class="btm_stats_1"></span>총 회원<b><%=t_user %>명</b></li>
            <li><span class="btm_stats_2"></span>총 요리후기<b><%=t_comm %>개</b></li>
            <li><span class="btm_stats_3"></span>총 레시피<b><%=t_post %>개</b></li>
            <li><span class="btm_stats_4"></span>총 레시피 조회<b><%=t_views %>회</b></li>
     </ul>
	</div>
</div>
 	
</footer>
</body>
</html>