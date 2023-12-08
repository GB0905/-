package Service_crypt;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Digest {

	public String DigestMsg(String msg) {

		try {
			MessageDigest md5 = MessageDigest.getInstance("md5");
			md5.update(msg.getBytes());
			byte[] digest01 = md5.digest();
			
			String Hex_Value = "";
			for(int i=0; i<digest01.length; i++) {
				Hex_Value += String.format("%02x", digest01[i]); //x가 소문자면 소문자 출력, 대문자면 대문자 출력
			}    
			return Hex_Value;
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

}
