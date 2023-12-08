<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="crypt" class="Service_crypt.Descrypt"></jsp:useBean>
<%
//페이지 이동확인
System.out.println("페이지이동 확인 : 로그인체크로 이동");

//전달된 아이디와 해시화 + 솔트 비밀번호
	String id = request.getParameter("_id");
	String pw = request.getParameter("_rpw");

// 	System.out.println("전송된 해시화된 비밀번호: "+pw);
	
	try {
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(
				"select * from user where u_id = '" + id + "' and u_pw = '" + pw + "'"); //사용자 아이디 비밀번호 확인
		
// 		해시화된 비밀번호와 ID가 일치하는 레코드가 있을 시 세션에 id 저장 후 메인으로 이동
		if(rs.next()){
			session.setAttribute("sessionID", rs.getString("u_nick"));
			response.sendRedirect("../Main/Main.jsp");
		} else{ResultSet rs2 = stmt.executeQuery( 
				"select * from admin where admin_id = '" + id + "' and admin_pw = '" + pw + "'"); //관리자 아이디 비밀번호 확인
		
			if(rs2.next()){
			session.setAttribute("adminID", id);
			response.sendRedirect("../Main/Main.jsp");
		} else	//실패시 로그인화면으로 fail값과 함께 이동
			response.sendRedirect("./Login.jsp?_LoginResult=fail");
			rs2.close();
		}
		//사용객체 연결해제
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
</body>
</html>