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
import shareOclock.member.MemberDAO;
import shareOclock.member.MemberDTO;


@WebServlet("*.admin")
public class AdminController extends HttpServlet {

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
			if(cmd.contentEquals("/admin.admin")) {
				response.sendRedirect("admin/admin.jsp");
				
			// member 리스트 조회
			}else if(cmd.contentEquals("/memberList.admin")) {
				MemberDAO dao = MemberDAO.getInstance();
				
				List<MemberDTO> list = dao.searchAllMemberView();
				request.setAttribute("list", list);
				
				request.getRequestDispatcher("generalmember/memberList.jsp").forward(request, response);

				// member 회원 상세 정보
			} else if (cmd.contentEquals("/detailmember.admin")) {
				System.out.println("email");
				MemberDAO dao = MemberDAO.getInstance();
				String email = request.getParameter("mb_email");
				System.out.println(email);
				MemberDTO dto = dao.searchByEmailMemberView(email);
				System.out.println(dto.getMb_email());
				String mb_email = dto.getMb_email();
				String mb_name = dto.getMb_name();
				String mb_nickname = dto.getMb_nickname();
				String mb_group = dto.getMb_group();
				String mb_phone = dto.getMb_phone();
				JsonObject obj = new JsonObject();
				obj.addProperty("mb_email", mb_email);
				obj.addProperty("mb_name", mb_name);
				obj.addProperty("mb_nickname", mb_nickname);
				obj.addProperty("mb_group", mb_group);
				obj.addProperty("mb_phone", mb_phone);
				Gson gson = new Gson();
				String result = gson.toJson(obj);
				response.getWriter().append(result);
				
				// 블랙 버튼 클릭 시 이메일로 이름 가져오기
			}else if(cmd.contentEquals("/addBlackmember.admin")) {
				String email = request.getParameter("mb_email");
				System.out.println(email);
				MemberDAO dao = MemberDAO.getInstance();
				String name = dao.addBlckmemberFromGeneralmember(email);
				System.out.println(name);
				JsonObject obj = new JsonObject();
				obj.addProperty("mb_email", email);
				obj.addProperty("mb_name", name);
				Gson gson = new Gson();
				String result = gson.toJson(obj);
				response.getWriter().append(result);				
			
				
				
				// 회원 삭제
			}else if (cmd.contentEquals("/delete.admin")) {
				String email = request.getParameter("email");
				System.out.println("선택한 아이디 "+ email);
				MemberDAO dao = MemberDAO.getInstance();
				int result = dao.deleteGeneralMember(email);

				//				String[] list = request.getParameterValues("generalCheck");
				//				BlackList_DAO dao = BlackList_DAO.getInstance();
				//				int result = 1;
				//				for (String email : list) {
				//					System.out.println(email);
				//					int delResult = dao.deleteGeneralMember(email);
				//					result += delResult;
				//				}
				if (result > 0) {

					response.sendRedirect(request.getContextPath() + "/memberList.admin");
				}
			}
		} catch (Exception e) {
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
