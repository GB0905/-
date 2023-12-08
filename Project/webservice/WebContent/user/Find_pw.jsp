<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="../css/Find_id.css"/>
</head>
<body>
<div class=findid_page>

	<div class = "toparea">
		<img id="logoimg" src="../Img/logo_noback.png" >
	</div>

	<form name="FindID" action="./Find_pw_result.jsp" method = "post">
	
			<div class = "contentarea">
			
			 <div id="titlearea">
            	<h1>비밀번호 찾기</h1>
            </div>
				
			<div class = "namearea">
				<p>이름</p>
				<input type="text" name="user_name" class = "nametext" placeholder = "가입한 이름" required>
			</div>
			
			<div class = "phonearea">
				<p>전화번호</p>
				<input type="text" name="user_phone" class = "phonetext" placeholder = "휴대폰번호를 '-'없이 입력" required>
			</div>
			
			<div class = "infoarea">
				<p>아이디</p>
				<input type="text" name="user_id" class = "idtext" placeholder = "가입한 아이디" required>
			</div>
			
	<div class ="btnarea">
		<button class="enterbtn" type="submit">찾기</button>
		<button class="canclebtn" onclick="window.close();">닫기</button>
		
 	</div>
 	
 	</div>
 </form>
 <div id="bottom_line"></div>
</div>

</body>
</html>