<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="../css/Find_id.css"/>
</head>
<body>
<div class=findid_page>
<%
request.setCharacterEncoding("utf-8");
%>

	<div class = "toparea">
		<img id="logoimg" src="../Img/logo_noback.png" >
	</div>

	<form method = "get" enctype="multipart/form-data">
	
		<div class = "contentarea">
			
			 <div id="titlearea">
            	<h1>비밀번호 변경하기</h1>
            </div>
				
			<div class = "namearea">
				<h2><%=request.getParameter("user_name") %> 회원님</h2>
				
			</div>
			
			<div class = "infoarea">
				<h2>비밀번호가 로 초기화되었습니다!</h2>
				
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