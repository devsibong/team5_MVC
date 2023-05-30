package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class JoinOkServiceAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		MemberDao memberDao = new MemberDao();
		String id = request.getParameter("id"); 
		String pwd = request.getParameter("pwd"); 
		String name = request.getParameter("mname"); 
		int age = Integer.parseInt(request.getParameter("age")); 
		String gender = request.getParameter("gender"); 
		String email = request.getParameter("email");
		String ip = request.getRemoteAddr();
		Member member = Member.builder()
						.id(id)
						.pwd(pwd)
						.name(name)
						.age(age)
						.gender(gender)
						.email(email)
						.ip(ip)
						.build();
		System.out.println(memberDao.insertMember(member)+"개의 행이 추가됨");
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/Ex02_JDBC_Main.jsp");
		return forward;
	}
}
