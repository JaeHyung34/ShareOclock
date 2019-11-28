package shareOclock.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import configuration.Encryption;

@WebServlet("*.member")
public class MemberController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
    	String reqURI = request.getRequestURI();
		String Path = request.getContextPath();
		String realpath = reqURI.substring(Path.length());
		System.out.println("reqURI" + realpath + "realpath" + realpath);
        
		if(realpath.contentEquals("/login.member")) {
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
			Member_DTO result = null;
			try {
				result = Member_DAO.getInstance().getLogin(email, Encryption.encrpyt(pw));
				System.out.println(result);
				if(result != null) {
					request.getSession().setAttribute("logininfo", email);
					response.sendRedirect("메인화면갈거당");
				}else {
					response.sendRedirect("/Project/login.jsp");
				}
			}catch(Exception e) {
				System.out.print("DB 오류");
				e.printStackTrace();
			}
		}else if(realpath.contentEquals("/loginforget.member")) {
			
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
