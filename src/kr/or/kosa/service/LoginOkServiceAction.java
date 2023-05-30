package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;

public class LoginOkServiceAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		MemberDao memberDao = new MemberDao();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		boolean isMember = memberDao.login(id, pwd);
		if (isMember) {
			forward = new ActionForward();
			HttpSession session = request.getSession();
			session.setAttribute("userid", id);
			forward.setRedirect(false);
			forward.setPath("/Ex02_JDBC_Main.jsp");
		} else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/Ex02_JDBC_Login.jsp");
		}
		return forward;
	}
}
