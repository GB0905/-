/**
 * 
 */
	var loginFormSubmitted = false;
	
	function submitLoginForm(form) {
		document.getElementById("emptyID").style.display = "none";
		document.getElementById("emptyPW").style.display = "none";
		document.getElementById("error").style.display = "none";
		if (loginFormSubmitted) {
			alert('로그인중 입니다.');
			return;
		}
		/* 아이디와 비밀번호가 공란인지 체크 */
		form.LoginID.value = form.LoginID.value.trim();
		if (form.LoginID.value.length == 0) {
			document.getElementById("emptyID").style.display = "block";
			form.LoginID.focus();
			
			return;
		}
		
		form.LoginPW.value = form.LoginPW.value.trim();
		if (form.LoginPW.value.length == 0) {
			document.getElementById("emptyPW").style.display = "block";
			form.LoginPW.focus();
			
			return;
		}
		
		/* 패스워드 함호화 */
		form.LoginPwReal.value = sha256(form.LoginPW.value);
		form.LoginPW.value = '';

		form.submit();
		loginFormSubmitted = true;
	}