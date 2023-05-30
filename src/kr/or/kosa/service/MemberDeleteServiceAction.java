package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;

public class MemberDeleteServiceAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		MemberDao memberDao = new MemberDao();
		String id = request.getParameter("id");
		memberDao.deleteMember(id);
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/managemember.do");
		return forward;
	}
}
