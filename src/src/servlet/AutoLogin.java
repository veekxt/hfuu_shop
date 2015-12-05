package src.servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AutoLogin
 */
@WebFilter("/AutoLogin")
public class AutoLogin implements Filter {

    public AutoLogin() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request ;
		HttpSession ses = req.getSession() ;
		Cookie[] cookies = req.getCookies();
		String emailCookie=null;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if("LOGIN_EMAIL".equals(cookie.getName())){
					emailCookie=cookie.getValue();
					ses.setAttribute("Email",emailCookie);
					ses.setAttribute("isLogin", true);
				}
			}
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
}
