package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;

public class MemberLoginService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberDao dao = new MemberDao();
		int result = dao.selectUserByIdPwd(id, pwd);
		
		String msg = "";
		String url = "";
		ActionForward forward = new ActionForward();

		if(result == 1) {
			msg="로그인 성공";
			url="Main.member";
			HttpSession session = request.getSession();
			session.setAttribute("userid", id);
			forward.setRedirect(false);
			forward.setPath("/Ex02_JDBC_Main.jsp");
		}else if(result == -1) {
			msg="비밀번호 불일치";
			url="Login.member";
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
		}else if (result == 0) {
			msg="등록된 회원정보가 없습니다.";
			url="Login.member";
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
		}
		
		request.setAttribute("member_msg", msg);
		request.setAttribute("member_url", url);
		
		return forward;
	}
	
}
