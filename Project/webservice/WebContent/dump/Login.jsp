<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="css/Login.css" />
<title>Insert title here</title>
</head>
<body>
	<%
		String login = request.getParameter("_login");
		String id = request.getParameter("_id");
		String pw = request.getParameter("_pw");
		String errstr = "";
		if(id == null || pw == null){
			
		} else if(id.equals("")){
			errstr = "���̵� �Է��ϼ���";
		} else if(pw.equals("")){
			errstr = "��й�ȣ�� �Է��ϼ���";
		} else if(login.equals("fail"))
			errstr = "ȸ�������� ���� �ʽ��ϴ�.";
	%>
	<div class="login_page">
	<a href="Main.jsp"><img src="Img/logo_noback.png" class="absolute"></a>
	<form action="Login_Check.jsp" method="post">
		<input type="text" name="_id" placeholder="���̵�" class="id_text">
		<input type="password" name="_pw" placeholder="��й�ȣ" class="pw_text">
		<span><%=errstr %></span>
		<input type="submit" value="�α���" class="custom-btn login">
	</form>
	</div>
</body>
</html>