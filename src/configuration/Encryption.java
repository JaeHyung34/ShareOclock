package configuration;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Encryption {

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
	
	public static String encText(String str) {
		str = str.replace("<script", "&lt;script");
		str = str.replace("<div>", "").replace("</div>", "<br>");
		return str;
	}
}
