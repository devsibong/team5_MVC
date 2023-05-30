package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.MemberDto;

public class MemberJoinService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request , HttpServletResponse response) {
		MemberDto member = new MemberDto();
		member.setId(request.getParameter("id")); 
		member.setPwd(request.getParameter("pwd")); 
		member.setName(request.getParameter("mname")); 
		member.setAge(Integer.parseInt(request.getParameter("age"))); 
		member.setGender( request.getParameter("gender")); 
		member.setEmail(request.getParameter("email")); 
		member.setIp(request.getRemoteAddr()); 
		
		MemberDao dao = new MemberDao();
		int result = dao.insertMember(member);
		
		String msg="";
		String url="";
		if(result>0) {
			msg="등록 성공";
			url="Login.member"; //요청 서블릿 주소
		}else {
			msg="등록 실패";
			url="Ex02_JDBC_Main.jsp";
		}
		
		request.setAttribute("member_msg", msg);
		request.setAttribute("member_url", url);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");
		
		return forward;
	}

}
