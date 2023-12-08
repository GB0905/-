<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.security.*"%>
<%@page import="java.security.spec.RSAPublicKeySpec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/Login.css" />
<link rel="stylesheet" type="text/css" href="../css/footer.css" />
<script type="text/javascript" src="./rsa.js"></script>
<script type="text/javascript" src="./jsbn.js"></script>
<script type="text/javascript" src="./prng4.js"></script>
<script type="text/javascript" src="./rng.js"></script>
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
	
	//변수에 공개키저장(request객체로 암호화시 사용가능)
	String publicKeyModulus = publicSpec.getModulus().toString(16);
	String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

%> 
<%
 	String login = request.getParameter("_LoginResult");
 	if(login==null) login="none";
 	if(login.equals("fail")) login="block";
%>
<div class="page_all">
	<div class="login_page">
		<div class="top">
			<div class="top_logo">
				<a href="../Main/Main.jsp"><img src="../Img/logo_noback.png" width="100%"></a>
			</div>
		</div>
		<div class="login">
		<form action="./Login_SoltCheck.jsp" id="frm" method="post">
<!-- 		실제로 정보를 전달 할 객체 -->
		<input type="hidden" name="securedUsername" id="securedUsername" value="" />
	    <input type="hidden" name="securedPassword" id="securedPassword" value="" />
			<div class="id_box">
				<div class="id_text">
<!-- 				아이디 정보를 입력받을 객체 -->
					<input type="text" id="_LoginID" name="LoginID" placeholder="E-mail">
				</div>
			</div>
			<div class="pw_box">
<!-- 				비밀번호 정보를 입력받을 객체 -->
				<div class="pw_text">
					<input type="password" id="_LoginPW" name="LoginPW" placeholder="Password">
				</div>
				<div id="emptyID" class="error_msg" style="display:none">
					<div class="IdEmpty"><label style="width:auto; margin-left:60px;"><Strong>아이디</Strong>를 입력하세요.</label></div>
				</div>
				<div id="emptyPW" class="error_msg" style="display:none">
					<div class="PwEmpty"><label style="width:auto; margin-left:60px;"><Strong>비밀번호</Strong>를 입력하세요.</label></div>
				</div>
				<div id="error" class="error_msg" style="display:<%=login%>">
					<div class="error_msg"><label style="width:auto; margin-left:60px;"><Strong>회원정보</Strong>가 맞지않습니다.</label></div>
				</div>
			</div>
			<div class="submit_others">
				<div class="submit_btn">
					<button id="login_btn" class="btn-hover color-5"  onClick="validateRSA(); return false;">SUBMIT</button>
				</div>
			</div>
			</form>
			<ul>
				<li class="find_list_first"><a href="./Find_id.jsp"
onclick="window.open(this.href, '_blank', 'width=520, height=401,location=no,status=no,scrollbars=no, resizable=no, toolbars=no, menubar=no'); return false;">아이디 찾기</a></li>
				<li class="find_list_remain"><a href="./Find_pw.jsp"
onclick="window.open(this.href, '_blank', 'width=520, height=471,location=no,status=no,scrollbars=no, resizable=no, toolbars=no, menubar=no'); return false;">비밀번호 찾기</a></li>
				<li class="find_list_remain"><a href="./Join.jsp">회원가입</a></li>
			
			</ul>
		</div>
		<div class="bottom">
			
		</div>
	</div>
	</div>
<script type="text/javascript">
function validateRSA() {
	
	document.getElementById("emptyID").style.display = "none";
	document.getElementById("emptyPW").style.display = "none";
	document.getElementById("error").style.display = "none";
	
	
	/* 아이디와 비밀번호가 공란인지 체크 */
	userID = document.getElementById("_LoginID").value;
	password = document.getElementById("_LoginPW").value;
	
	userID = userID.trim();
	if (userID.length == 0) {
		document.getElementById("emptyID").style.display = "block";
		document.getElementById("_LoginID").focus();
		
		flag = true;
		return;
	}
		
	
	password = password.trim();
	if (password.length == 0) {
		document.getElementById("emptyPW").style.display = "block";
		password = document.getElementById("_LoginPW").focus();
		
		return;
	}
			
		try {
			//입력받은 아이디와 비밀번호 가져오기
			var userID = document.getElementById("_LoginID").value;
			var password = document.getElementById("_LoginPW").value;
			
			//request객체에 저장된 공개키 값 저장
			var rsaPublicKeyModulus = "<%=publicKeyModulus%>";
		    var rsaPublicKeyExponent = "<%=publicKeyExponent%>";
			    
			//공개키 설정
		    var rsa = new RSAKey();
		    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
		
		    // 사용자ID, 비밀번호를 RSA로 암호화
		    var securedUsername = rsa.encrypt(userID);
		    var securedPassword = rsa.encrypt(password);
			
		    var frm = document.getElementById("frm");
			//입력받은 값 초기화
		    frm.LoginID.value = "";
		    frm.LoginPW.value = "";
			//암호화된 값 전달할 객체에 저장
		    frm.securedUsername.value = securedUsername;
		    frm.securedPassword.value = securedPassword;
		    frm.submit();
			    
		} catch(e) {
		    alert(e);
		}
}
</script>
<%@ include file ="../hedder_footer/footer.jsp" %>
</body>
</html>