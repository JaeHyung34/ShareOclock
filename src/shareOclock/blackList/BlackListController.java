package shareOclock.blackList;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("*.black")
public class BlackListController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length());
		System.out.println(cmd);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			if (cmd.contentEquals("/black.black")) {
				
				BlackListDAO dao = BlackListDAO.getInstance();
				List<BlackListDTO> list = dao.searchAllView();
				request.setAttribute("list", list);
				request.getRequestDispatcher("blackmember/black.jsp").forward(request, response);
			} else if (cmd.contentEquals("/Newblack.black")) {
				BlackListDAO dao = BlackListDAO.getInstance();
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				String reason = request.getParameter("reason");
				int result = dao.insert(name, reason,email);
				if(result > 0) {
					response.sendRedirect("admin/admin.jsp");
				}
			}else if(cmd.contentEquals("/delete.black")) {
				String[] list = request.getParameterValues("blackCheck");
				System.out.println(list[0]);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
