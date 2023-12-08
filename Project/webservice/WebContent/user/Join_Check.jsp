<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" import="org.apache.commons.lang3.RandomStringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	//시스템보안 확인용
	request.setCharacterEncoding("utf-8");
	String pw1 = request.getParameter("joinPw");//입력받은 비밀번호
	String pw2 = request.getParameter("joinPwConfirm");//입력받은 비밀번호확인
	String salt = request.getParameter("salt"); //salt값
	
	
	String f_id = request.getParameter("joinId");
	String Email = request.getParameter("joinEmail");
	String id = (f_id + "@" + Email);
	String pw = request.getParameter("joinPwReal");
	String name = request.getParameter("joinName");
	String gender = request.getParameter("joinGender");
	String birth_y = request.getParameter("joinBirthYear");
	String birth_m = request.getParameter("joinBirthMonth");
	String birth_d = request.getParameter("joinBirthDay");
	String birth = birth_y + birth_m + birth_d;
	String phone = request.getParameter("joinPhone");
	try {
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		
		//값확인
// 		out.println("id: " + id);
// 		out.println("<p>pw: " + pw);
// 		out.println("<p>name: " + name);
// 		out.println("<p>gender: " + gender);
// 		out.println("<p>birth: " + birth);
// 		out.println("<p>phone: " + phone);

		//비밀번호 전송확인
// 		System.out.println("실제로 저장되는 비밀번호: " + pw);
// 		System.out.println("회원가입 창에서 입력하여 전송된 비밀번호: " + pw1);
// 		System.out.println("전송된 솔트값: " + salt);
		if((stmt.executeUpdate(
				"INSERT INTO server.`user`(u_id, u_pw, u_nick, u_name, birth, gender, phone) VALUES('"+id+"', '"+pw+"', '"+f_id+"', '"+name+"', '"+birth+"', '"+gender+"', '"+phone+"')")) == 1){
				out.println("<script>alert('가입을 환영합니다!');</script>");
				response.sendRedirect("../Main/Main.jsp");
		} else
			response.sendRedirect("./Login.jsp");
		
		//사용객체 연결해제
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>