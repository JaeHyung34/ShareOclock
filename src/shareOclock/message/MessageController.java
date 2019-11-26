package shareOclock.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.msg")
public class MessageController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String sender = request.getParameter("sender");
			String receiver = request.getParameter("receiver");
			String content = request.getParameter("content");
				System.out.println("ok");
			MessageDTO dto = new MessageDTO(sender, receiver, content);
				System.out.println("ok");
			int result = MessageDAO.getInstance().insertMsg(dto);
//			int result = new MessageDAO.insertMsg(dto);
				System.out.println(result);
			if (result > 0) {
				System.out.println("success");
			} else {
				System.out.println("fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
