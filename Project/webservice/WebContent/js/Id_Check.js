/**
 * 
 */
	/*에러메세지 초기화*/
	function display_none() {
		document.getElementById("emptyID").style.display = "none";
		document.getElementById("errorID1").style.display = "none";
		document.getElementById("errorID2").style.display = "none";
		document.getElementById("emptyPW").style.display = "none";
		document.getElementById("emptyPWC").style.display = "none";
		document.getElementById("emptyName").style.display = "none";
		document.getElementById("emptyNum").style.display = "none";
		document.getElementById("emptyEmail").style.display = "none";
		document.getElementById("errorEmail").style.display = "none";
		document.getElementById("emptyGender").style.display = "none";
		document.getElementById("emptyBirth").style.display = "none";
		document.getElementById("errorPWC").style.display = "none";
		
	}
	
	/* 아이디 */
	function Id_Check() {
		/*값 가져오기*/
		var frm = document.getElementById("frm");
		var Id = document.getElementById("joinId");
		
		/*정규식*/
		let reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		let hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		
		if (!Id.value) {
			document.getElementById("emptyID").style.display = "block";
			return;
			
		}
		if(Id.value.length < 4 || Id.value.length > 16){
			document.getElementById("errorID1").style.display = "block";
			return;
		}
		
		
		if(hangleCheck.test(Id.value)){
			document.getElementById("errorID2").style.display = "block";
			return;
		}
	}
	
	/*이메일*/
	function Email_Check() {
		
		/*값 가져오기*/
		var frm = document.getElementById("frm");
		var Email = document.getElementById("joinEmail");
		

		if (!Email.value) {
			document.getElementById("emptyEmail").style.display = "block";

			return;
		}
		
		
	}