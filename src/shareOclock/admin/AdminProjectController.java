package shareOclock.admin;

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

import shareOclock.blackList.BlackList_DAO;
import shareOclock.blackList.BlackList_DTO;
import shareOclock.project.ProjectDAO;
import shareOclock.project.ProjectDTO;

@WebServlet("*.adProject")
public class AdminProjectController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length());
		System.out.println(cmd);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html charset=UTF-8");
		
		try {
			if(cmd.contentEquals("/adminProject.adProject")) {
				ProjectDAO dao = ProjectDAO.getInstance();				
				List<ProjectDTO>list = dao.searchAllProjectView();
				request.setAttribute("list", list);
				request.getRequestDispatcher("adminProject/project.jsp").forward(request, response);
				
			}else if(cmd.contentEquals("/detail.adProject")) {
				int pro_seq = Integer.parseInt(request.getParameter("pro_seq"));
				ProjectDAO dao = ProjectDAO.getInstance();
				ProjectDTO dto = dao.searchByProSeqProjectView(pro_seq);
				int seq = dto.getPro_seq();
				String title = dto.getPro_title();
				String contents = dto.getPro_contents();
				String startDate = dto.getPro_startDate();
				String endDate = dto.getPro_endDate();
				JsonObject obj = new JsonObject();
				obj.addProperty("seq", seq);
				obj.addProperty("title", title);
				obj.addProperty("contents", contents);
				obj.addProperty("startDate", startDate);
				obj.addProperty("endDate", endDate);
				Gson gson = new Gson();
				String result = gson.toJson(obj);
				response.getWriter().append(result);
				
			}else if(cmd.contentEquals("/delete.adProject")) {
				String[] list = request.getParameterValues("ProjectCheck");
				ProjectDAO dao = ProjectDAO.getInstance();
				int result = 1;
				for (String pro_seq : list) {
					System.out.println(pro_seq);
					int delResult = dao.deleteProject(pro_seq);
					result += delResult;
				}
				if (result > 0) {

					response.sendRedirect(request.getContextPath() + "/adminProject.adProject");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("error.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
