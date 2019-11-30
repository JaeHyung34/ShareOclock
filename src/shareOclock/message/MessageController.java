package shareOclock.message;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import configuration.Configuration;
import configuration.Encryption;

@WebServlet("*.msg")
public class MessageController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			MessageDAO dao = new MessageDAO();
			String ctxPath = request.getContextPath();
			String requestURI = request.getRequestURI();
			String cmd = requestURI.substring(ctxPath.length());
			System.out.println(cmd);

			// 메시지 진입 화면
			if (cmd.equals("/view.msg")) {
				List<MessageDTO> list = dao.viewAllMsg();
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("message/msg_index.jsp");
				rd.forward(request, response);
			}
			// 메시지 진입화면 - 끝
			// 메시지 보내기 
			if (cmd.contentEquals("/send.msg")) {
				//String sender = request.getParameter("sender");
				String sender = "sendus";
				String receiver = request.getParameter("receiver");
				String content = request.getParameter("tArea");
				content = Encryption.encText(content);
				System.out.println(receiver + "/" + content);
				MessageDTO dto = new MessageDTO(sender, receiver, content);
				//int result = dao.insertMsg(dto);
				int result = 1;
				if (result > 0) {
					response.sendRedirect("view.msg");
				} else {
					System.out.println("fail");
				}
			}
			// 메시지 보내기 - 끝
			// 메시지   모두 읽기로 표시
			if (cmd.equals("/readAll.msg")) {
				String receiver = "hello";
				int result = dao.readAll(receiver);
				if (result > 0) {
					response.sendRedirect(request.getContextPath() + "/view.msg");
				} else {
					// 에러 페이지로 이동
				}
			}
			// 메시지   모두 읽기로 표시 - 끝
			// 메시지 자세히 보기 
			if (cmd.contentEquals("/detailView.msg")) {
				String seq_ = request.getParameter("seq");
				if (seq_ != null) {
					int seq = Integer.parseInt(seq_);
					int result = dao.read(seq);
					if (result > 0) {
						MessageDTO dto = dao.getMsgBySeq(seq);
						request.setAttribute("dto", dto);
						request.getRequestDispatcher("message/detailView.jsp").forward(request, response);
					}
				} else {
					// 에러 페이지로 이동
				}
			}
			// 메시지 자세히 보기  - 끝
			// 답장
			if (cmd.equals("/reply.msg")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				MessageDTO dto = dao.getMsgBySeq(seq);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("message/reply.jsp").forward(request, response);
			}
			// 답장 - 끝
			// 메시지  삭제 
			if (cmd.contentEquals("/checkedDelete.msg")) {
				String[] seqs = request.getParameterValues("seq");
				int result = 1;
				for (String seq_ : seqs) {
					int seq = Integer.parseInt(seq_);
					System.out.println(seq);
					//result += dao.deleteMsg(seq);
				}
				if (result != 0) {
					response.sendRedirect("view.msg");
				} else {
					// 에러페이지로 이동
				}
			}
			// 메시지  삭제 - 끝
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
