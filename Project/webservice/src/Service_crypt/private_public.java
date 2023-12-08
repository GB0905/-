package Service_crypt;

import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import javax.crypto.Cipher;
import javax.servlet.http.HttpSession;

public class private_public {

	public String RSA(String msg, HttpSession session) {
		//키 생성(공개키, 개인키)
		try {
		KeyPairGenerator clsKeyPairGenerator = KeyPairGenerator.getInstance("RSA");
		clsKeyPairGenerator.initialize(1024);
		KeyPair clsKeyPair = clsKeyPairGenerator.genKeyPair();
		Key clsPublicKey = clsKeyPair.getPublic();
		Key clsPrivateKey = clsKeyPair.getPrivate();
		session.setAttribute("clsPublicKey", clsPublicKey);
		
		
		//암호화
		String strPinNumber = msg;
		Cipher clsCipher = Cipher.getInstance("RSA");
		clsCipher.init(Cipher.ENCRYPT_MODE, clsPublicKey);
		byte[] arrCipherData = clsCipher.doFinal(strPinNumber.getBytes());
		
		//복호화
		clsCipher.init(Cipher.DECRYPT_MODE, clsPrivateKey);
		byte[] arrData = clsCipher.doFinal(arrCipherData);
		String strResult = new String(arrData);
		return strResult;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
