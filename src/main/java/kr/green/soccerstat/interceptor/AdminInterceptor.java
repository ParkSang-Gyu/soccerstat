package kr.green.soccerstat.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.green.soccerstat.vo.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null || !user.getAuthority().equals("ADMIN")) {
			System.out.println("test");
			response.sendRedirect(request.getContextPath()+"/");
		}
		return true;
	}
}
