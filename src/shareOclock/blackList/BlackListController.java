package shareOclock.blackList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("*.black")
public class BlackListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length());
		System.out.println(cmd);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html charset=UTF-8");
		try {
			// 블랙 리스트 조회
			if (cmd.contentEquals("/blackmember.black")) {

				BlackList_DAO dao = BlackList_DAO.getInstance();
				List<BlackList_DTO> list = dao.searchAllBlackView();
				
				request.setAttribute("list", list);
				request.getRequestDispatcher("blackmember/blackList.jsp").forward(request, response);

				// 블랙 회원 추가
			} else if (cmd.contentEquals("/Newblack.black")) {
				BlackList_DAO dao = BlackList_DAO.getInstance();
				String email = request.getParameter("member-email");
				String name = request.getParameter("member-name");
				String reason = request.getParameter("member-reason");
				int result = dao.insert(name, reason, email);
				if (result > 0) {
					response.sendRedirect(request.getContextPath() + "/blackmember.black");
				}

			}else if(cmd.contentEquals("/modify.black")) {	
				String email = request.getParameter("black-email");
				String name = request.getParameter("black-name");
				String reason = request.getParameter("black-reason");
				BlackList_DAO dao = BlackList_DAO.getInstance();
				int result = dao.modifyByEmailAndName(email, name, reason);
				if(result > 0) {
					response.sendRedirect(request.getContextPath()+"/blackmember.black");
				}
				// 블랙 회원 삭제
			} else if (cmd.contentEquals("/delete.black")) {
				String[] list = request.getParameterValues("blackCheck");
				BlackList_DAO dao = BlackList_DAO.getInstance();
				int result = 1;
				for (String email : list) {
					System.out.println(email);
					int delResult = dao.delete(email);
					result += delResult;
				}
				if (result > 0) {

					response.sendRedirect(request.getContextPath() + "/blackmember.black");
				}

				// blackList 회원 상세 정보
			} else if (cmd.contentEquals("/detail.black")) {
				BlackList_DAO dao = BlackList_DAO.getInstance();
				String email = request.getParameter("email");
				BlackList_DTO dto = dao.searchByEmailView(email);
				String bl_email = dto.getBl_email();
				String bl_name = dto.getBl_name();
				String bl_reason = dto.getBl_reason();
				JsonObject obj = new JsonObject();
				obj.addProperty("bl_email", bl_email);
				obj.addProperty("bl_name", bl_name);
				obj.addProperty("bl_reason", bl_reason);
				Gson gson = new Gson();
				String result = gson.toJson(obj);
				response.getWriter().append(result);
			}
		}catch(

				Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
