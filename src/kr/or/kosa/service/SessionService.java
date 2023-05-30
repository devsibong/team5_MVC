package kr.or.kosa.service;
import javax.servlet.http.HttpServletRequest;

public class SessionService {
	public boolean checkAdmin(HttpServletRequest request) {
		boolean result = request.getSession().getAttribute("userid").equals("admin") ? true : false;
		return result;
	}
}
