package shareOclock.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.member")
public class MemberController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqURI = request.getRequestURI();
		String Path = request.getContextPath();
		String realpath = reqURI.substring(Path.length());
		System.out.println(realpath);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		if(realpath.contentEquals("/login.member")) {
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
			Member_DTO result = null;
			try {
				result = Member_DAO.getInstance().getLogin(email, pw);
				System.out.println(result.getMb_email());
				System.out.println(result.getMb_nickname());
				
//				if(result) {
//					request.getSession().setAttribute("id", email);
//				}
			}catch(Exception e) {
				System.out.print("DB 오류");
				e.printStackTrace();
			}
			
		}else if(realpath.contentEquals("/member/loginCheck.member")) {
			String id = request.getParameter("id");
			System.out.println("id" + id);
			try {
				//boolean result = Member_DAO.getInstance().idCheck(id);
//				System.out.println("result" + result);
//				if(!result) {
//					request.setAttribute("result", 1);
//					request.getRequestDispatcher("loginCheck.jsp").forward(request, response);
//				}else {
//					request.setAttribute("result", 0);
//					request.getRequestDispatcher("loginCheck.jsp").forward(request, response);
//				}
			} catch (Exception e) {
				System.out.print("id check ?삤瑜?!! ::::: ");
				e.printStackTrace();
			}
			
		}else if(realpath.contentEquals("/memberRemove.member")) {
			String id = (String) request.getSession().getAttribute("id");
			int result = 0 ;
			try {
				//result = Member_DAO.getInstance().remove(id);
				if(result > 0) {
					request.getSession().invalidate();
					response.sendRedirect("index.jsp");
				}
			}catch(Exception e) {
				System.out.print("DB 오류");
				e.printStackTrace();
			}
			
		}else if(realpath.contentEquals("/myInfo.member")) {	
		    String id = (String) request.getSession().getAttribute("id");
			Member_DTO dto = null;
			try {
				//dto = Member_DAO.getInstance().selectInfo(id);		
				request.setAttribute("dto", dto);
			} catch (Exception e) {
				e.printStackTrace();
			}					
			request.getRequestDispatcher("member/myInfo.jsp").forward(request, response);
			
		}else if(realpath.contentEquals("/memberModifyView.member")) {	
		    String id = (String) request.getSession().getAttribute("id");
			Member_DTO dto = null;
			try {
				//dto = Member_DAO.getInstance().selectInfo(id);		
				request.setAttribute("dto", dto);
			} catch (Exception e) {
				e.printStackTrace();
			}					
			request.getRequestDispatcher("member/memberModify.jsp").forward(request, response);
		
		}else if(realpath.contentEquals("/memberModify.member")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String zipcode = request.getParameter("zipcode");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			//Member_DTO dto = new Member_DTO(id, pw, name, phone, email, zipcode, address1, address2);
			int result = 0;
			try {
			//	result = Member_DAO.getInstance().modify(dto);
			}catch(Exception e) {
				System.out.print("DB 오류다");
				e.printStackTrace();
			}
			if(result > 0) {
				response.sendRedirect("index.jsp");
			}
		}else if(realpath.contentEquals("/member/signup.member")) {

			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String zipcode = request.getParameter("zipcode");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");

			//Member_DTO dto = new Member_DTO(id, pw, name, phone, email, zipcode, address1, address2);
			int result = 0;
			try {
				//result = Member_DAO.getInstance().insert(dto);
			} catch (Exception e) {	
				System.out.print("DB 오류다");
				e.printStackTrace();
			}
			if(result>0) {
				request.setAttribute("name", name);
				request.getRequestDispatcher("signupCheck.jsp").forward(request, response);

			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
