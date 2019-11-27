package shareOclock.member;

import java.io.IOException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import java.net.URLEncoder;
import java.net.URL;
import java.net.HttpURLConnection;
import java.io.BufferedReader;
import java.io.InputStreamReader ;

@WebServlet("*.login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqURI = request.getRequestURI();
		String Path = request.getContextPath();
		String realpath = reqURI.substring(Path.length());
		System.out.println(realpath);

		if(realpath.contentEquals("/naver.login")) {
		    String clientId = "lx_KvvNWm6q8tm8wfE0E";//애플리케이션 클라이언트 아이디값";
		    String redirectURI = URLEncoder.encode("http://192.168.60.7/Project/callback.login", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
			request.getSession().setAttribute("state", state);
			response.sendRedirect(apiURL);
		}else if(realpath.contentEquals("/callback.login")) {
			String clientId = "lx_KvvNWm6q8tm8wfE0E";//애플리케이션 클라이언트 아이디값";
		    String clientSecret = "ihAmfvwBdR";//애플리케이션 클라이언트 시크릿값";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("http://localhost:8080/ProjectManager/callback.jsp", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
		    System.out.println("apiURL="+apiURL);
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		    	JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(res.toString());
				String token = element.getAsJsonObject().get("access_token").getAsString();
				String header = "Bearer " + token; 
				try {
					apiURL = "https://openapi.naver.com/v1/nid/me";
					url = new URL(apiURL);
					con = (HttpURLConnection)url.openConnection();
					con.setRequestMethod("GET");
					con.setRequestProperty("Authorization", header);
					responseCode = con.getResponseCode();
					BufferedReader br2;
					if(responseCode==200) {
						br2 = new BufferedReader(new InputStreamReader(con.getInputStream()));
					} else { 
						br2 = new BufferedReader(new InputStreamReader(con.getErrorStream()));
					}
					StringBuffer responseBuffer = new StringBuffer();
					while ((inputLine = br2.readLine()) != null) {
						responseBuffer.append(inputLine);
					}
					br2.close();
					System.out.println(responseBuffer);
				} catch (Exception e) {
					e.printStackTrace();
				}

		      }
		      
		      
		    } catch (Exception e) {
				e.printStackTrace();
		    }
		}else if(realpath.contentEquals("/emailCheck.login")) {
		
			String email = request.getParameter("email");
			System.out.println(email);
			boolean result = false;
			try {
				result = Member_DAO.getInstance().emailCheck(email);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(result) {
				//mail server 설정
				String host = "smtp.naver.com";   // 해당 이름으로 smpt 서버 만들것
				String user = "lov3112"; 			//자신의 네이버 계정
				String password = "1q2w3e4R";//자신의 네이버 패스워드
				//메일 받을 주소
				String to_email = email;
				//SMTP 서버 정보를 설정한다.
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", 465);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");

				//인증 번호 생성기
				StringBuffer temp =new StringBuffer();
				Random rnd = new Random();
				for(int i=0;i<10;i++){
					int rIndex = rnd.nextInt(3);
					switch (rIndex) {
					case 0:
						// a-z
						temp.append((char) ((int) (rnd.nextInt(26)) + 97));
						break;
					case 1:
						// A-Z
						temp.append((char) ((int) (rnd.nextInt(26)) + 65));
						break;
					case 2:
						// 0-9
						temp.append((rnd.nextInt(10)));
						break;
					}
				}
				String AuthenticationKey = temp.toString();

				try {
					int modify = Member_DAO.getInstance().modifyPw(email, AuthenticationKey);
					if(modify > 0) {
						Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {
								return new PasswordAuthentication(user,password);
							}
						});
						//email 전송
						MimeMessage msg = new MimeMessage(session);
						msg.setFrom(new InternetAddress(user, "ShareOclock"));
						msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
						//메일 제목
						msg.setSubject("안녕하세요 Share O'Clock 인증 메일입니다.");
						//메일 내용
						msg.setText("인증 번호는 :"+temp);
						Transport.send(msg);
						System.out.println("이메일 전송");
						System.out.println(AuthenticationKey);

					}
				}catch (Exception e) {
					e.printStackTrace();
				}
			}else {

			}
			Gson gson = new Gson();
			String resultJSON = gson.toJson(result);
			response.getWriter().append(resultJSON);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
