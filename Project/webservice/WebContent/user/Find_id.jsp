<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.security.*"%>
<%@page import="java.security.spec.RSAPublicKeySpec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="../css/Find_id.css"/>
<script type="text/javascript" src="./rsa.js"></script>
<script type="text/javascript" src="./jsbn.js"></script>
<script type="text/javascript" src="./prng4.js"></script>
<script type="text/javascript" src="./rng.js"></script>
<script type="text/javascript" src="../js/phone.js"></script>
</head>
<body>
<%
	//rsa 공개키, 개인키 생성
	KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
	generator.initialize(2048);
	
	KeyPair keyPair = generator.genKeyPair();
	KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	
	PublicKey publicKey = keyPair.getPublic();
	PrivateKey privateKey = keyPair.getPrivate();
	
	//세션에 개인키 저장
	session.setAttribute("__RSA_Private_Key__", privateKey);
	
	RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
	
	//변수에 공개키저장(request객체로 사용가능)
	String publicKeyModulus = publicSpec.getModulus().toString(16);
	String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

%> 
<div class=findid_page>

	<div class = "toparea">
		<img id="logoimg" src="../Img/logo_noback.png" >
	</div>

	<form id="frm" name="FindID" action="./Find_id_result.jsp" method ="post" >
	
			<div class = "contentarea">
			
			 <div id="titlearea">
            	<h1>아이디 찾기</h1>
            </div>
				
			<div class = "namearea">
				<p>이름</p>
				<input type="text" id="_LoginID" name="_user_name" class = "nametext" placeholder = "가입한 이름" required>
			</div>
			
			<div class = "phonearea">
				<p>전화번호</p>
				<input type="text" id="_LoginPW" oninput="autoHyphen2(this)" name="_user_phone" maxlength="13" class = "phonetext" placeholder = "휴대폰번호를 '-'없이 입력" required>
			</div>

			<input type="hidden" name="securedusername" id="securedusername" value="" />
	    	<input type="hidden" name="secureduserPhone" id="secureduserPhone" value="" />
	
	<div class ="btnarea">
		<button class="enterbtn" type="submit" onclick="validateRSA(); return false;">찾기</button>
		<button class="canclebtn" onclick="window.close();">닫기</button>
		
 	</div>
 	
 	</div>
 </form>
 <div id="bottom_line"></div>
</div>
<script type="text/javascript">
function validateRSA() {
	
	var userName = document.getElementById("_LoginID").value;
	var userPhone = document.getElementById("_LoginPW").value;
			
		try {
			    
			var rsaPublicKeyModulus = "<%=publicKeyModulus%>";
		    var rsaPublicKeyExponent = "<%=publicKeyExponent%>";
			    
		    var rsa = new RSAKey();
		    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
		
		    // 사용자ID, 비밀번호를 RSA로 암호화
		    var securedUsername = rsa.encrypt(userName);
		    var securedPassword = rsa.encrypt(userPhone);
			
		    var frm = document.getElementById("frm");
		    frm.securedusername.value = securedUsername;
		    frm.secureduserPhone.value = securedPassword;
		    frm.submit();
			    
		} catch(e) {
		    alert(e);
		}
}
</script>
</body>
</html>