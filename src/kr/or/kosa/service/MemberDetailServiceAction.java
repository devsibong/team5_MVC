package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class MemberDetailServiceAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		SessionService sessionService = new SessionService();
		if (sessionService.checkAdmin(request)) {
			MemberDao memberDao = new MemberDao();
			String id = request.getParameter("id");
	        Member member = memberDao.getMember(id);
	        request.setAttribute("member", member);
	        forward = new ActionForward();
	        forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/Ex03_MemberDetail.jsp");
		} else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/main.do");
		}
		return forward;
	}
}
