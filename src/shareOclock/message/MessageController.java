package shareOclock.message;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.msg")
public class MessageController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String ctxPath = request.getContextPath();
			String requestURI = request.getRequestURI();
			String cmd = requestURI.substring(ctxPath.length());

			// 메시지 진입 화면
			if (cmd.equals("/view.msg")) {
				List<MessageDTO> list = MessageDAO.getInstance().viewAllMsg();
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("message/msg_index.jsp");
				rd.forward(request, response);
			}
			// 메시지 진입화면 - 끝
			// 메시지 보내기 
			if (cmd.contentEquals("/send.msg")) {
				String sender = request.getParameter("sender");
				String receiver = request.getParameter("receiver");
				String content = request.getParameter("content");
				System.out.println("ok");
				MessageDTO dto = new MessageDTO(sender, receiver, content);
				System.out.println("ok");
				int result = MessageDAO.getInstance().insertMsg(dto);
				System.out.println(result);
				if (result > 0) {
					System.out.println("success");
				} else {
					System.out.println("fail");
				}
			}
			// 메시지 보내기 - 끝
			// 메시지 자세히 보기 
			// 메시지 자세히 보기  - 끝
			// 메시지  삭제 
			// 메시지  삭제 - 끝
			// 메시지   모두 읽기로 표시
			// 메시지   모두 읽기로 표시 - 끝
			// 운영자에게 신고
			// 운영자에게 신고 - 끝
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
