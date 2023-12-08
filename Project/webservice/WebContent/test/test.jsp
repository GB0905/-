<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="./test.js"></script>
</head>
<body>
	<div class="box">
  <div>
    
  <h2>첫번째 코드 <span>- ^(\d{2,3})(\d{3,4})(\d{4})$</span></h2>
  <input type="text" oninput="autoHyphen(this)" maxlength="13" placeholder="전화번호를 입력해보세요!" autofocus>
  </div>
  <div>
    
    <h2>두번째 코드 <span>- ^(\d{0,3})(\d{0,4})(\d{0,4})$</span></h2>
  <input type="text" oninput="autoHyphen2(this)" maxlength="13" placeholder="전화번호를 입력해보세요!">
  </div>
</div>
	
</body>
</html>