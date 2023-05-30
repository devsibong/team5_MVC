package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;

public class SessionServiceAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		String userid = null;
		userid = (String) request.getSession().getAttribute("userid");
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/Ex02_JDBC_Main.jsp");
		return forward;
	}
}
