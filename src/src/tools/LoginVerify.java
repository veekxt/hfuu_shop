package src.tools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import src.vo.*;

public class LoginVerify {
	//登录验证
	//判断是否为管理员登录
	public static boolean isAdmin(HttpServletRequest request){
		HttpSession ses=request.getSession();
		if(isLogin(request) && ((User)ses.getAttribute("loginUser")).getId()<1000){
		    return true;
		}
		return false;
	}
	//是否已经登录
	public static boolean isLogin(HttpServletRequest request){
		HttpSession ses=request.getSession();
		if(ses.getAttribute("isLogined")!=null
			&& ses.getAttribute("isLogined").equals(true) && ses.getAttribute("loginUser")!=null){
			return true;
		}
		return false;
	}
}
