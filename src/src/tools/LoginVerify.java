package src.tools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import src.vo.*;

public class LoginVerify {
	//登录验证方法
	public static boolean isAdmin(HttpServletRequest request){
		HttpSession ses=request.getSession();
		if(isLogin(request) && ((User)ses.getAttribute("loginUser")).getId()<1000){
		    return true;
		}
		return false;
	}
	
	public static boolean isLogin(HttpServletRequest request){
		HttpSession ses=request.getSession();
		if(ses.getAttribute("isLogined")!=null
			&& ses.getAttribute("isLogined").equals(true) && ses.getAttribute("loginUser")!=null){
			return true;
		}
		return false;
	}
}
