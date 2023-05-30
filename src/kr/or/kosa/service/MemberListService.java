package kr.or.kosa.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.MemberDto;

public class MemberListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
			MemberDao dao = new MemberDao();
			List<MemberDto> memberlist = dao.selectAllMember();
			request.setAttribute("memberlist", memberlist);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/Ex03_Memberlist.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}
	
}
