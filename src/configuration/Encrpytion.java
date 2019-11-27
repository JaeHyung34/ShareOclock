package configuration;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Encrpytion {

	public static String encrpyt(String str) {
		String sha ="";
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(str.getBytes("utf8"));
			sha= String.format("%0128x", new BigInteger(1,digest.digest()));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sha;
	}
}
