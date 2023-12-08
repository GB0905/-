<%@page import="javax.crypto.Cipher"%>
<%@page import="java.security.PrivateKey"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%!
//복호화 클래스 선언
private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
    Cipher cipher = Cipher.getInstance("RSA");
    byte[] encryptedBytes = hexToByteArray(securedValue);
    cipher.init(Cipher.DECRYPT_MODE, privateKey);
    byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
    String decryptedValue = new String(decryptedBytes, "utf-8"); 
    return decryptedValue;
}

/**
 * 16진 문자열을 byte 배열로 변환한다.
 */
public static byte[] hexToByteArray(String hex) {
    if (hex == null || hex.length() % 2 != 0) {
        return new byte[]{};
    }

    byte[] bytes = new byte[hex.length() / 2];
    for (int i = 0; i < hex.length(); i += 2) {
        byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
        bytes[(int) Math.floor(i / 2)] = value;
    }
    return bytes;
}
%>

<%
//페이지이동 확인
System.out.println("페이지이동 확인 : 솔트체크로 이동");

//초기화
String realsalt = "";
String username = "";
String password = "";
String salt = "";

String NosecuredUsername = request.getParameter("LoginID");
String NosecuredPassword = request.getParameter("LoginPW");

// System.out.println("암호화 안된 로그인 ID: " + NosecuredUsername);
// System.out.println("암호화 안된 비밀번호: " + NosecuredPassword);

//암호화된 사용자ID와 비밀번호
String securedUsername = request.getParameter("securedUsername");
String securedPassword = request.getParameter("securedPassword");

//암호화 확인
// System.out.println("암호화된 로그인 ID: " + securedUsername);
// System.out.println("암호화된 비밀번호: " + securedPassword);

PrivateKey privateKey = (PrivateKey)session.getAttribute("__RSA_Private_Key__");

// 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
session.removeAttribute("__RSA_Private_Key__"); 

if (privateKey == null) {
	System.out.println("암호화 비밀키 정보를 찾을 수 없습니다.");
}

try {
    //복호화(세션에 저장된 개인키로 복호화)
    
	username = decryptRsa(privateKey, securedUsername);
    password = decryptRsa(privateKey, securedPassword);
    
    //복호화확인
//     System.out.println("복호화된 로그인 ID: " + username);
//     System.out.println("복호화된 비밀번호: " + password);
    
} catch (Exception e) {
	e.printStackTrace();
}

%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(
				"select u_pw from server.user where u_id = '" + username + "'"); //아이디 비밀번호 확인
				
		if(rs.next()){
			salt = rs.getString("u_pw");
		} else{ResultSet rs2 = stmt.executeQuery(
				"select admin_pw from server.admin where admin_id = '" + username + "'"); //아이디 비밀번호 확인
		
			if(rs2.next())
			salt = rs2.getString("admin_pw");
			
			else{
			out.println("<script>alert('비정상적인 접근입니다.');</script>");
			response.sendRedirect("./Login.jsp?_LoginResult=fail");
			rs2.close();
		}
		}
		//아이디를 통해 데이터베이스에 저장된 비밀번호에서 뒤에서 12자리(salt)를 가져옴
		realsalt = salt.substring(salt.length()-12, salt.length());
		System.out.println("솔트: " + realsalt);
		
		//복호화된 패스워드 뒤에 솔트 붙히기
		password = password + realsalt;
		System.out.println("비밀번호 + 솔트: " + password);
		//사용객체 연결해제
		
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
	<form action="./Login_Check.jsp" method="post" id="frm" onsubmit="CheckLogin();">
	
<!-- 		솔트, 복호화된 비밀번호는 전송하지않음 -->
		<input id="pw" type="hidden" name="pw" value="<%=password%>" disabled>
		<input id="salt" type="hidden" value="<%=realsalt%>" disabled>
		
		
		<input id="rpw" name="_rpw" type="hidden" value="">
		<input id="id" name="_id" type="hidden" value="<%=username%>">
	
	</form>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script type="text/javascript">

	var frm = document.getElementById("frm");
	var pw = document.getElementById("pw");
	var rpw = document.getElementById("rpw");
	var salt = document.getElementById("salt");
	
	//(솔트 + 비밀번호) 해시화 후 전달객체에 저장, 비밀번호값 ""로 초기화
	rpw.value = sha256(frm.pw.value);
	rpw.value = rpw.value + salt.value;
	pw.value = '';

	this.document.getElementById("frm").submit();

</script>
</body>
</html>