package kr.or.kosa.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class MemberManageServiceAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		SessionService sessionService = new SessionService();
		if (sessionService.checkAdmin(request)) {
			MemberDao memberDao = new MemberDao();
			List<Member> memberList = memberDao.getMemberList();
			request.setAttribute("memberList", memberList);
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/Ex03_Memberlist.jsp");
		} else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/main.do");
		}
		return forward;
	}
}
