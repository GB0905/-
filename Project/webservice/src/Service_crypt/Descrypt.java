package Service_crypt;
import java.nio.charset.Charset;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;

public class Descrypt {
	
	public static void Aes_KeyGenerator (HttpSession session){
		//키생성
		try {
		KeyGenerator kg = KeyGenerator.getInstance("AES");
		SecretKey key = kg.generateKey();
		SecretKeySpec keySpec = new SecretKeySpec(key.getEncoded(), "AES");
		session.setAttribute("SecretKeySpec", keySpec);
		SecureRandom random = new SecureRandom();
		byte[] ivData = new byte[16]; // 128bit
		random.nextBytes(ivData);
		IvParameterSpec ivSpec = new IvParameterSpec(ivData);
		session.setAttribute("ivSpec", ivSpec);

		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public byte[] Aes_ENCRYPT (String msg, HttpSession session){
		
		try {
		//암호화
		SecretKeySpec keySpec = (SecretKeySpec) session.getAttribute("SecretKeySpec");
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		IvParameterSpec ivSpec = (IvParameterSpec) session.getAttribute("ivSpec");
		cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec);
		String plaintext = msg;
		byte[] ciphertext = cipher.doFinal(plaintext.getBytes());
		return ciphertext;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String Aes_DECRYPT (HttpSession session, byte[] ciphertext){
		
		try {
		
		//복호화
		SecretKeySpec keySpec = (SecretKeySpec) session.getAttribute("SecretKeySpec");
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		IvParameterSpec ivSpec = (IvParameterSpec) session.getAttribute("ivSpec");
		cipher.init(Cipher.DECRYPT_MODE, keySpec, ivSpec);
		byte[] cleartext = cipher.doFinal(ciphertext);
		String msg = new String(cleartext);
		System.out.println(msg);
		return msg;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
