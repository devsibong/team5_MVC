package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.service.IsLoginService;
import kr.or.kosa.service.MemberJoinService;
import kr.or.kosa.service.MemberListService;
import kr.or.kosa.service.MemberLoginService;

// FrontMemberController


@WebServlet("*.member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberController() {
		super();
	}
	
	
	private void doProcess(HttpServletRequest request ,HttpServletResponse response) throws IOException, ServletException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String urlcommand = requestURI.substring(contextPath.length());
		
		Action action = null;
		ActionForward forward = null;
		if(urlcommand.equals("/Join.member")) {
			forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/Ex02_JDBC_JoinForm.jsp");

		}else if(urlcommand.equals("/JoinOk.member")) {
			action = new MemberJoinService();
			forward = action.execute(request, response);

		}else if(urlcommand.equals("/Login.member")) {
			forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/Ex02_JDBC_Login.jsp");
			
		}else if(urlcommand.equals("/LoginOk.member")) {
			action = new MemberLoginService();
			forward = action.execute(request, response);
			
		}else if(urlcommand.equals("/Logout.member")) {
			HttpSession session = request.getSession();
			forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/Ex02_JDBC_Login.jsp");
    		session.invalidate();
		}else if(urlcommand.equals("/List.member")) {
			action = new MemberListService();
			System.out.println(request.getAttribute("memberlist"));
			forward = action.execute(request, response);
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doProcess(request, response);
	}
	
}
