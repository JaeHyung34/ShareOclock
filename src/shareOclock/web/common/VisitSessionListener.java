package shareOclock.web.common;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import shareOclock.admin.ProjectCount_DAO;
import shareOclock.admin.VisitCount_DAO;

// 방문자 / 프로젝트 현황

@WebListener
public class VisitSessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {

		// 세션이 새로 생성되면 execute() 실행한다.
		if (sessionEve.getSession().isNew()) {
			execute(sessionEve);
		}
	}

	private void execute(HttpSessionEvent sessionEve) {

		VisitCount_DAO visitCountDAO = VisitCount_DAO.getInstance();
		ProjectCount_DAO projectCountDAO = ProjectCount_DAO.getInstance();
		
		//프로젝트 카운트
		int pro_totalCount = 0;
		
		//방문자 카운트
		int todayCount = 0;
		int totalCount = 0;

		// 전체 방문자 수 +1
		try {

			visitCountDAO.setVisitTotalCount();

			// 오늘 방문자 수
			todayCount = visitCountDAO.getVisitTodayCount();
			// 전체 방문자 수
			totalCount = visitCountDAO.getVisitTotalCount();

			HttpSession session = sessionEve.getSession();

			// 세션 속성에 담아준다.
			session.setAttribute("totalCount", totalCount); // 전체 방문자 수
			session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
			
			// 생성된 프로젝트 수
			pro_totalCount = projectCountDAO.SelectProjectCount();
			System.out.println(pro_totalCount);
			HttpSession pro_session = sessionEve.getSession();
			pro_session.setAttribute("pro_totalCount", pro_totalCount); // 전체 프로젝트 수

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("서버가 중지되었습니다.");
	}
}