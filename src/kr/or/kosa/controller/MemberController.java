package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.service.JoinOkServiceAction;
import kr.or.kosa.service.LoginOkServiceAction;
import kr.or.kosa.service.LogoutServiceAction;
import kr.or.kosa.service.MemberDeleteServiceAction;
import kr.or.kosa.service.MemberDetailServiceAction;
import kr.or.kosa.service.MemberManageServiceAction;
import kr.or.kosa.service.MemberSearchServiceAction;
import kr.or.kosa.service.MemberUpdateOkServiceAction;
import kr.or.kosa.service.MemberUpdateServiceAction;
import kr.or.kosa.service.SessionServiceAction;


@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MemberController() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestUri = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestUri.substring(contextPath.length());
    	Action action=null;
    	ActionForward forward=null;
    	
    	if(urlcommand.equals("/main.do")) {
    		action = new SessionServiceAction();
    		forward = action.execute(request, response);
    	}else if(urlcommand.equals("/join.do")) {
    		//get
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/Ex02_JDBC_JoinForm.jsp");
    	}else if(urlcommand.equals("/joinok.do")) {
    		//post
    		action = new JoinOkServiceAction();
    		forward = action.execute(request, response);
    	}else if(urlcommand.equals("/login.do")) {
    		//get
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/Ex02_JDBC_Login.jsp");
    	}else if(urlcommand.equals("/loginok.do")) {
    		//post
    		action = new LoginOkServiceAction();
    		forward = action.execute(request, response);
    	}else if(urlcommand.equals("/logout.do")) {
    		//post
    		action = new LogoutServiceAction();
    		forward = action.execute(request, response);
    	}else if(urlcommand.equals("/managemember.do")) {
    		//post
    		action = new MemberManageServiceAction();
    		forward = action.execute(request, response);
    	}else if(urlcommand.equals("/memberdetail.do")) {
    		//post
    		action = new MemberDetailServiceAction();
    		forward = action.execute(request, response);
    	}else if(urlcommand.equals("/deletemember.do")) {
    		//post
    		action = new MemberDeleteServiceAction();
    		forward = action.execute(request, response);
    	}else if(urlcommand.equals("/updatemember.do")) {
    		//post
    		action = new MemberUpdateServiceAction();
    		forward = action.execute(request, response);
    	}else if(urlcommand.equals("/updatememberok.do")) {
    		//post
    		action = new MemberUpdateOkServiceAction();
    		forward = action.execute(request, response);
    	}else if(urlcommand.equals("/searchmember.do")) {
    		//post
    		action = new MemberSearchServiceAction();
    		forward = action.execute(request, response);
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true location.href="" 새로운 페이지 받겠다
    			response.sendRedirect(forward.getPath());
    		}else {
    			//false (forward) >> view 페이지 >> 저장 자원 출력 

    	    	RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    	    	dis.forward(request, response);
    		}
    	}
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
