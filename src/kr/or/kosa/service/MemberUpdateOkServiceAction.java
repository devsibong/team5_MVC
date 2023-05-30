package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class MemberUpdateOkServiceAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		MemberDao memberDao = new MemberDao();
		String id = request.getParameter("id");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        Member member = Member.builder()
        				.id(id)
        				.pwd(memberDao.getMember(id).getPwd())
        				.name(name)
        				.age(age)
        				.gender(gender)
        				.email(email)
        				.build();
        memberDao.updateMember(member);
        forward = new ActionForward();
        forward.setRedirect(false);
		forward.setPath("/managemember.do");
		return forward;
	}
}
