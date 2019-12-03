package configuration;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Utils {

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
		str = str.replace("<", "&lt;");
		str = str.replace("<div>", "").replace("</div>", "<br>");
		return str;
	}
	public static String formedDate(Timestamp date) {
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      return sdf.format(date);
	   }
}
