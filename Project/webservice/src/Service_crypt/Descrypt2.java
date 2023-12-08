package Service_crypt;
import java.nio.charset.Charset;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class Descrypt2 {

	public static void main(String[] args) throws Exception {
		
		//키생성
		KeyGenerator kg = KeyGenerator.getInstance("AES");
		SecretKey key = kg.generateKey();
		SecretKeySpec keySpec = new SecretKeySpec(key.getEncoded(), "AES");
		System.out.println("비밀키: " + keySpec);
		
		//IV생성
		
		SecureRandom random = new SecureRandom();
		byte[] ivData = new byte[16]; // 128bit
		random.nextBytes(ivData);
		IvParameterSpec ivSpec = new IvParameterSpec(ivData);
		Charset charset = Charset.forName("UTF-8");
		
		//암호화
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec);
		String plaintext = "가나다라마바사";
		byte[] ciphertext = cipher.doFinal(plaintext.getBytes());
		System.out.printf("암호문: ");
		for(int i = 0; i<ciphertext.length; i++) {
			System.out.printf("%02X", ciphertext[i]);
		}
		
		System.out.println();
		
		//복호화
		cipher.init(Cipher.DECRYPT_MODE, keySpec, ivSpec);
		byte[] cleartext = cipher.doFinal(ciphertext);
		System.out.println("복호문: " + new String(cleartext, charset));
	}

}
