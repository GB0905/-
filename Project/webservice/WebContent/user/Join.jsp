<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="org.apache.commons.lang3.RandomStringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../css/Join.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
<script type="text/javascript" src="../js/selectEmail.js"></script>
<script type="text/javascript" src="./join.js"></script>
</head>
<body>
<%
// 	회원가입페이지를 불러올때마다 임의의 난수를 불러옴(12자리)
	String salt = RandomStringUtils.random(12, true, true);
%>
<div class="page_all">
<div class="sign_page">
	<div class="top">
		<div class="top_logo">
			<a href="../Main/Main.jsp"><img src="../Img/logo_noback.png" width="100%"></a>
			<h1>회원가입</h1>
			<div class="line"></div>
		</div>
	</div>
	
	<div class="container">
		<form id="frm" name="joinForm" action="./Join_Check.jsp" method="post" onsubmit="submitLoginForm(this); return false;">
		<input type="hidden" name="joinPwReal"> <!-- 암호화된 비밀번호 -->
		<input type="hidden" name="salt" value="<%=salt%>" disabled> 
			<div class="id_pw_group">
				<div class="id_box">
					<h3><label>아이디(E-mail) 
					<select name="select_email" onChange="selectEmail(this)" id="select_email">
				 		<option value="1" selected >직접입력</option>
        				<option value="naver.com">naver.com</option>
        				<option value="gmail.com">gmail.com</option>
        				<option value="hanmail.net">hanmail.net</option>
        			
					</select></label></h3>
					<input type="text" name="joinId" id="joinId" class="id_text"> @ <input id="joinEmail" name="joinEmail" class="id_text" type="text">
					<div id="emptyID" style="display:none">
						<div class="error_msg"><strong>아이디</strong>를 입력해주세요.</div>
					</div>
					<div id="errorID1" style="display:none">
						<div class="error_msg"><strong>아이디</strong>는 영문자로 시작하는 영문자 또는 숫자 6~20자 입력해주세요.</div>
					</div>
					<div id="errorID2" style="display:none">
						<div class="error_msg"><strong>아이디</strong>는 한글을 입력할 수 없습니다.</div>
					</div>
					<div id="emptyEmail" style="display:none">
						<div class="error_msg"><strong>이메일</strong>을 입력(선택)해주세요.</div>
					</div>
				
				</div>
					
					<div class="pw_box">
						<h3><label>비밀번호</label></h3>
						<input type="password" id="joinPw" name="joinPw" class="pw_text">
						<div id="emptyPW" style="display:none">
						<div class="error_msg"><strong>비밀번호</strong>를 입력해주세요.</div>
					</div>
					<div id="errorPW1" style="display:none">
						<div class="error_msg"><strong>비밀번호</strong>는 영어/숫자/특수기호(#?!@$%^&*-)가 <br>포함되어야합니다.</div>
					</div>
					<div id="errorPW2" style="display:none">
						<div class="error_msg"><strong>비밀번호</strong>는 같은 문자를 연달아 4번 사용할 수 없습니다.</div>
					</div>
					<div id="errorPW3" style="display:none">
						<div class="error_msg"><strong>비밀번호</strong>는 아이디를 포함할 수 없습니다.</div>
					</div>
					<div id="errorPW4" style="display:none">
						<div class="error_msg"><strong>비밀번호</strong>는 한글을 사용할 수 없습니다.</div>
					</div>
					<div id="errorPW5" style="display:none">
						<div class="error_msg"><strong>비밀번호</strong>는 공백을 포함할 수 없습니다.</div>
					</div>
					
					

					</div>
					
					<div class="pwch_box">
						<h3><label>비밀번호확인</label></h3>
						<input type="password" id="joinPwConfirm" name="joinPwConfirm" class="pw_text">
						
						<div id="emptyPWC" style="display:none">
						<div class="error_msg"><strong>비밀번호</strong>를 한번더 입력해주세요.</div>
						</div>
						
						<div id="errorPWC" style="display:none">
						<div class="error_msg"><strong>비밀번호</strong>가 일치하지 않습니다.</div>
						</div>

					</div>
			</div>
			<div class="line"></div>
			<div class="user_group">
					<div class="user_name_box">
						<h3><label>이름</label></h3>
						<input type="text" id="joinName" name="joinName" class="user_name_text">
						<div id="emptyName" style="display:none">
						<div class="error_msg"><strong>이름</strong>을 입력해주세요.</div>
					</div>
					    <div id="errorName" style="display:none">
						<div class="error_msg"><strong>이름</strong>은 한글(2~5)만 입력할 수 있습니다.</div>
					</div>

					</div>
					<div class="user_gender_box">
					<h3><label>성별</label></h3>
						<select name="joinGender" id="joinGender">
							<option value="gender" selected disabled>선택하세요</option>
							<option value="남성">남성</option>
							<option value="여성">여성</option>
						</select>
						<div id="emptyGender" style="display:none">
						<div class="error_msg"><strong>성별</strong>을 선택해주세요.</div>
					</div>
						
					</div>
					
					<div class="user_birth_box">
						<h3><label>생년월일</label></h3>
						<input type="number" id="joinBirthYear" name="joinBirthYear" placeholder="년(4자)" min="1900" max="2022">
						<select id="joinBirthMonth" name="joinBirthMonth">
							<option value="0" selected>월</option>
							<option value="01">1월</option>
							<option value="02">2월</option>
							<option value="03">3월</option>
							<option value="04">4월</option>
							<option value="05">5월</option>
							<option value="06">6월</option>
							<option value="07">7월</option>
							<option value="08">8월</option>
							<option value="09">9월</option>
							<option value="10">10월</option>
							<option value="11">11월</option>
							<option value="12">12월</option>
						</select>
						<input type="number" id="joinBirthDay" name="joinBirthDay" placeholder="일(01)" min="01" max="31">
						<div id="emptyBirth" style="display:none">
						<div class="error_msg"><strong>생년월일</strong>을 입력해주세요.</div>
					</div>
					<div id="errorBirth1" style="display:none">
						<div class="error_msg">윤달이 아닌 2월은 28일이 최대입니다.</div>
					</div>
					<div id="errorBirth2" style="display:none">
						<div class="error_msg">해당 달은 30일이 최대입니다.</div>
					</div>
					<div id="errorBirth3" style="display:none">
						<div class="error_msg">31일이 최대입니다.</div>
					</div>
					<div id="errorBirth4" style="display:none">
						<div class="error_msg">윤달인 2월은 29일이 최대입니다.</div>
					</div>
					<div id="errorBirth5" style="display:none">
						<div class="error_msg">일의 형식은 최소 두자리(1일->01)입니다.</div>
					</div>

					</div>
					<div class="user_tel_box">
						<h3><label>휴대전화</label></h3>
						<input type="text" id="joinPhone" name="joinPhone" oninput="autoHyphen2(this)" maxlength="13" class="user_name_text">
						<div id="emptyNum" style="display:none">
						<div class="error_msg"><strong>휴대전화번호</strong>를 입력해주세요.</div>
					</div>
						<div id="errorNum" style="display:none">
						<div class="error_msg"><strong>휴대전화번호</strong>다시 입력해주세요.</div>
					</div>
	
					</div>
			</div>
				
				<div class="regist_btn">
						<button id="join_btn" class="btn"><span>Sign Up</span></button>
					</div>
		</form>
	</div>
</div>
</div>
<%@ include file="../hedder_footer/footer.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

</body>
</html>