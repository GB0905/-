<%@page import="javax.crypto.Cipher"%>
<%@page import="java.security.PrivateKey"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="../css/Find_id.css"/>
</head>
<body>
<div class=findid_page>
<%!
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
//초기화
String username = "";
String userphone = "";
String id = "";
//암호화된 사용자 이름와 전화번호
String securedusername = request.getParameter("securedusername");
String secureduserPhone = request.getParameter("secureduserPhone");

// System.out.println("암호화된 사용자 이름: " + securedusername);
// System.out.println("암호화된 사용자 전화번호: " + secureduserPhone);

PrivateKey privateKey = (PrivateKey)session.getAttribute("__RSA_Private_Key__");

// 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
session.removeAttribute("__RSA_Private_Key__"); 

if (privateKey == null) {
	System.out.println("암호화 비밀키 정보를 찾을 수 없습니다.");
}

try {
    //복호화
    
	username = decryptRsa(privateKey, securedusername);
	userphone = decryptRsa(privateKey, secureduserPhone);
	
// 	System.out.println(username);
// 	System.out.println(userphone);
    
} catch (Exception e) {
	e.printStackTrace();
}
%>
<%
	Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(
			"select u_id from server.user where u_name = '" + username + "' and phone = '" + userphone + "'"); //아이디 비밀번호 확인
			if(rs.next()){
				id = rs.getString("u_id");
			}else{
				out.println("<script>alert('일치하는 정보가 없습니다.');</script>");
				out.println("<script> location.replace('./Find_id.jsp'); </script>");
			}
				
%>

	<div class = "toparea">
		<img id="logoimg" src="../Img/logo_noback.png" >
	</div>

	<form method = "get" enctype="multipart/form-data">
	
		<div class = "contentarea">
			
			 <div id="titlearea">
            	<h1>아이디 찾기 결과</h1>
            </div>
				
			<div class = "namearea">
				<h2><%=username %> 회원님</h2>
				
			</div>
			
			<div class = "infoarea">
				<h2>등록된 아이디는 <%=id %> 입니다!</h2>
				
			</div>
	
	<div class ="btnarea">
		<button class="canclebtn" onclick="window.close();">닫기</button>
		
 	</div>
 	
 	</div>
 </form>
 <div id="bottom_line"></div>
</div>

</body>
</html>