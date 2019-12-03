package shareOclock.message;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import configuration.Utils;

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
				String entryPage_ = request.getParameter("entry");
				int entryPage = 1;
				if (entryPage_ != null)
					entryPage = Integer.parseInt(entryPage_);
				List<MessageDTO> list = dao.viewAllMsg(entryPage);
				int totalMsgs = dao.totalMsgs();
				String pagination = dao.pagination(entryPage, totalMsgs);
				request.setAttribute("list", list);
				request.setAttribute("entry", entryPage);
				request.setAttribute("pagination", pagination);
				RequestDispatcher rd = request.getRequestDispatcher("message/msg_index.jsp");
				rd.forward(request, response);
			}
			// 메시지 진입화면 - 끝
			if (cmd.contentEquals("/search.msg")) {
				String[] options = request.getParameterValues("options");
				String searchWord = request.getParameter("search");
				if (searchWord == null) {
					searchWord = "";
				}
				String option = options[0];
				List<MessageDTO> list = dao.searchMsg(option, searchWord);
				request.setAttribute("list", list);
				
			}
			// 메시지   모두 읽기로 표시
			if (cmd.equals("/readAll.msg")) {
				String receiver = "iko";
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
				int entry = Integer.parseInt(request.getParameter("entry"));
				if (seq_ != null) {
					int seq = Integer.parseInt(seq_);
					int result = dao.read(seq);
					if (result > 0) {
						MessageDTO dto = dao.getMsgBySeq(seq);
						request.setAttribute("dto", dto);
						request.setAttribute("entry", entry);
						request.getRequestDispatcher("message/detailView.jsp").forward(request, response);
					}
				} else {
					System.out.println("에러페이지로 이동");
					// 에러 페이지로 이동
				}
			}
			// 메시지 자세히 보기  - 끝
			// 답장
			if (cmd.equals("/reply.msg")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				int entry = Integer.parseInt(request.getParameter("entry"));
				MessageDTO dto = dao.getMsgBySeq(seq);
				request.setAttribute("dto", dto);
				request.setAttribute("entry", entry);
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
					result += dao.deleteMsg(seq);
				}
				if (result != 0) {
					String entry = request.getParameter("entry");
					request.getRequestDispatcher("/view.msg?entry=" + entry).forward(request, response);
				} else {
					// 에러페이지로 이동
				}
			}
			// 메시지  삭제 - 끝
			// 메시지 보내기 
			if (cmd.contentEquals("/send.msg")) {
				String sender = (String) request.getSession().getAttribute("loginInfo");
				sender = "iko";
				String[] sendList = request.getParameterValues("sendList");
				String content = request.getParameter("tArea");
//				content = Utils.encText(content);
				MessageDTO dto;
				int result = 0;
				for (String receiver : sendList) {
					System.out.println(receiver);
					dto = new MessageDTO(sender, receiver, content);
					result += dao.insertMsg(dto);
				}
				if (result == sendList.length) {
					String entry = request.getParameter("entry");
					request.getRequestDispatcher("view.msg?entry=" + entry).forward(request, response);
				} else {
					System.out.println("fail");
				}
			}
			// 메시지 보내기 - 끝
			// 메시지 보낼 사람 탐색 및 등록 
			if (cmd.contentEquals("/findID.msg")) {
				List<String> ids = new ArrayList<String>();
				ids.add("hello"); ids.add("world");
				String id = request.getParameter("id");
				String target = null;
				for (String tmp : ids) {
					if (tmp.contentEquals(id)) {
						target = tmp;
						break;
					}
				}
				response.getWriter().append(target);
			}
			// 메시지 보낼 사람 탐색 및 등록 - 끝
			// 검색 기능 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
}
