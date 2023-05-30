package kr.or.kosa.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class MemberSearchServiceAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		MemberDao memberDao = new MemberDao();
		List<Member> memberList = memberDao.searchMembersByName(request.getParameter("search"));
		request.setAttribute("memberList", memberList);
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/Ex03_MemberSearch.jsp");
		return forward;
	}
}
