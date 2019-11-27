package shareOclock.member;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class Exam01 {

	public static void main(String[] args) {

//		String token = "AAAANiWBRt4jAmt0f8eeJBSdDDw0hA9JCfqUjQ6EDzH8KfdXU--1rwp_pynazx5tkP6WYXRWRMZ6DFMo4zfPZO0Ubb0";
//		String header = "Bearer " + token; 
//		try {
//			String apiURL = "https://openapi.naver.com/v1/nid/me";
//			URL url = new URL(apiURL);
//			HttpURLConnection con = (HttpURLConnection)url.openConnection();
//			con.setRequestMethod("GET");
//			con.setRequestProperty("Authorization", header);
//			int responseCode = con.getResponseCode();
//			BufferedReader br;
//			if(responseCode==200) {
//				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//			} else { 
//				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
//			}
//			String inputLine;
//			StringBuffer response = new StringBuffer();
//			while ((inputLine = br.readLine()) != null) {
//				response.append(inputLine);
//			}
//			br.close();
//			System.out.println(response.toString());
//		} catch (Exception e) {
//			System.out.println(e);
//		}
		String stri = "{\"access_token\":\"AAAANiHUv4-51AsvJ1TsXKle4jdOEbbNnQHVpk7_RA8YIs72sNRcOWhGHOtq6PtihHbWoQPksHKnbJWFke1I2JUb7aw\",\"refresh_token\":\"1QGOgrFQzfz5OAe7ULdrBoAL7jgYH5NDRzAfJ8sFfgeZF6O7Fmais64RSDWK8RdZffwLvjN1is4oGTmkis7dwCvCkuisZFEzcmyQTVTs7UMoaN7fSledRkdRhtgs64BD3PT2\",\"token_type\":\"bearer\",\"expires_in\":\"3600\"}";
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(stri);
		String name = element.getAsJsonObject().get("access_token").getAsString();
		System.out.println("찍힘"+name);
		}
}
