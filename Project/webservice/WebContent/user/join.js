/**
 * 
 */

const autoHyphen2 = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
	
	var loginFormSubmitted = false;
	
	function submitLoginForm(form) {
		
		/*에러메세지 초기화*/
		document.getElementById("emptyID").style.display = "none";
		document.getElementById("errorID1").style.display = "none";
		document.getElementById("errorID2").style.display = "none";
		document.getElementById("emptyPW").style.display = "none";
		document.getElementById("errorPW1").style.display = "none";
		document.getElementById("errorPW2").style.display = "none";
		document.getElementById("errorPW3").style.display = "none";
		document.getElementById("errorPW4").style.display = "none";
		document.getElementById("errorPW5").style.display = "none";
		document.getElementById("emptyPWC").style.display = "none";
		document.getElementById("emptyName").style.display = "none";
		document.getElementById("errorName").style.display = "none";
		document.getElementById("emptyNum").style.display = "none";
		document.getElementById("errorNum").style.display = "none";
		document.getElementById("emptyEmail").style.display = "none";
		document.getElementById("emptyGender").style.display = "none";
		document.getElementById("emptyBirth").style.display = "none";
		document.getElementById("errorBirth1").style.display = "none";
		document.getElementById("errorBirth2").style.display = "none";
		document.getElementById("errorBirth3").style.display = "none";
		document.getElementById("errorBirth4").style.display = "none";
		document.getElementById("errorPWC").style.display = "none";
		
		/*값 가져오기*/
		var Id = document.getElementById("joinId");
		var Email = document.getElementById("joinEmail");
		var Pw = document.getElementById("joinPw");
		var PwConfirm = document.getElementById("joinPwConfirm");
		var Name = document.getElementById("joinName");
		var Gender = document.getElementById("joinGender");
		var BirthYear = document.getElementById("joinBirthYear");
		var BirthMonth = document.getElementById("joinBirthMonth");
		var BirthDay = document.getElementById("joinBirthDay");
		var Phone = document.getElementById("joinPhone");
		
		/*정규식*/
		var reg_id = /^[a-z]+[a-z0-9]{5,19}$/g;
		let reg_pw = /(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{6,24}/;
		let hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		let reg_name = /^[가-힣]{2,5}$/;
		var	reg_tel = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		var reg_day = /^((0?[1-9])|([1-2][0-9])|30|31{2})$/;
		
		
		if (false) {
			alert("로그인 진행 중 입니다.");
			return;
		}
		/* 아이디 */
		if (!Id.value) {
			form.joinId.focus();
			document.getElementById("emptyID").style.display = "block";
			return;
			
		}
		//아이디는 4 이상 16이하이다.
		if(Id.value.length < 4 || Id.value.length > 16){
			document.getElementById("errorID1").style.display = "block";
			form.joinId.focus();
			return;
		}
		
		//아이디에 한글이 있으면 안된다.
		if(hangleCheck.test(Id.value)){
			document.getElementById("errorID2").style.display = "block";
			form.joinId.focus();
			return;
		}	
		
		/* 이메일 */
		if (!form.joinEmail.value) {
			form.joinEmail.focus();
			document.getElementById("emptyEmail").style.display = "block";

			
			return;
		}
		
		/* 비밀번호 */
		if (!Pw.value) {
			document.getElementById("emptyPW").style.display = "block";

			return;
		}
		
		if(!reg_pw.test(Pw.value)){
			document.getElementById("errorPW1").style.display = "block";
			return;
		}
		
		//같은 문자를 4번 사용할 수 없다.
		if(/(\w)\1\1\1/.test(Pw.value)){
			document.getElementById("errorPW2").style.display = "block";
			return;
		}
		
		//비밀번호 안에 아이디가 있을 때
		if(Pw.value.search(Id.value) != -1){
			document.getElementById("errorPW3").style.display = "block";
			return;
		}
		
		//비밀번호에 한글이 있으면 안된다.
		if(hangleCheck.test(Pw.value)){
			document.getElementById("errorPW4").style.display = "block";
			return;
		}
		
		//비밀번호에 공백을 포함할 수 없다.
		if(Pw.value.search(/\s/) != -1){
			document.getElementById("errorPW5").style.display = "block";
			return;
		}
		
		/* 패스워드와 패스워드확인 일치 확인 */
		if (Pw.value != PwConfirm.value ) {
			document.getElementById("errorPWC").style.display = "block";

			return;
		}
		
		
		
		/* 이름 */
		if (form.joinName.value.length == 0) {
			form.joinName.focus();
			document.getElementById("emptyName").style.display = "block";
			
			return;
		}
		
		if (!reg_name.test(Name.value)) {
			form.joinName.focus();
			document.getElementById("errorName").style.display = "block";
			
			return;
		}
		
		/* 성별 */
		if (form.joinGender.value == "gender") {
			form.joinGender.focus();
			document.getElementById("emptyGender").style.display = "block";
			
			return;
		}
		
		/* 생년월일 */
		
		if (BirthYear.value.length == 0 || BirthMonth.value == "0" || BirthDay.value.length == 0) {
			form.joinBirthYear.focus();
			document.getElementById("emptyBirth").style.display = "block";
			
			return;
		}
		
		if (BirthDay.value.length == 1) {
			BirthDay.value = "0" + BirthDay.value;
		}
		
		if (BirthYear.value%4 == 0 && BirthMonth.value == 02 && BirthDay.value > 29){
			document.getElementById("errorBirth4").style.display = "block";
			
			return;
		}
		
		if (BirthMonth.value == 02 && BirthDay.value > 28 && BirthYear.value%4 != 0){
			document.getElementById("errorBirth1").style.display = "block";
			
			return;
		}
		
		if (BirthMonth.value > "07"){
			if ((BirthMonth.value%2 == 1) && BirthDay.value > 30){
			document.getElementById("errorBirth2").style.display = "block";
			return;
			}
		}else if(BirthDay.value > 31){
			document.getElementById("errorBirth3").style.display = "block";
			return;
		}
		
		
		if (BirthMonth.value < "08"){
			if ((BirthMonth.value%2 == 1) && BirthDay.value > 31){
			document.getElementById("errorBirth3").style.display = "block";
			return;
			}
		}else if(BirthDay.value > 30){
			document.getElementById("errorBirth2").style.display = "block";
			return;
		}

		/* 전화번호 */
		form.joinPhone.value = form.joinPhone.value.trim();
		if (form.joinPhone.value.length == 0) {
			form.joinPhone.focus();
			document.getElementById("emptyNum").style.display = "block";
			
			return;
		}
		if (!reg_tel.test(Phone.value)) {
			form.joinName.focus();
			document.getElementById("errorNum").style.display = "block";
			
			return;
		}
		
		//실제 입력받은 암호의 데이터 joinPw
		//페이지에서 생성한 임의의 난수 salt
		//실제로 전달될 변수명 joinPwReal

		//joinPw 뒤에 salt 추가 후 sha256으로 해시화된 값을 joinPwReal에 저장
		form.joinPwReal.value = sha256(form.joinPw.value + form.salt.value);
		//joinPwReal 뒤에 salt 추가 후 다시 joinPwReal에 저장
		form.joinPwReal.value = (form.joinPwReal.value + form.salt.value)
		//joinPw 데이터 초기화
		form.joinPw.value = '';
		//비밀번호 확인의 값도 같이 초기화
		form.joinPwConfirm.value = form.joinPw.value;
		
		joinFormSubmitted = true;
		form.submit();
		return;
		
	}