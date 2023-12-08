function aes128Encode(secretKey, Iv, data){

    		// [aes 인코딩 수행 실시 : cbc 모드]
    		const cipher = CryptoJS.AES.encrypt(data, CryptoJS.enc.Utf8.parse(secretKey), {
    			iv: CryptoJS.enc.Utf8.parse(Iv), // [Enter IV (Optional) 지정 방식]
    			padding: CryptoJS.pad.Pkcs7,
    			mode: CryptoJS.mode.CBC // [cbc 모드 선택]
    		});

    		// [인코딩 된 데이터 확인 실시]
    		aes128EncodeData = cipher.toString();
    		console.log("");
    		console.log("[aes128Encode] : [encode]");
    		console.log("[data] : " + aes128EncodeData);  		
    		console.log("");
    	};