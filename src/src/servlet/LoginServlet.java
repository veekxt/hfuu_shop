package src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.tools.MD5;
import src.vo.User;
import src.dbHandle.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String inputEmail = request.getParameter("inputEmail");
		String inputPassword = request.getParameter("inputPassword");
		String autoLogin = request.getParameter("auto_login");
		UserDbHandle userDbHandle = new UserDbHandle();
		String EmailOrUserName="";
		try {
			// if(DAOFactory.getIUserDAOInstance().findByEmail(inputEmail)!=null){
			if (userDbHandle.findByEmail(inputEmail) != null) {
				User user = userDbHandle.findByEmail(inputEmail);
				String pass = MD5.getMD5(MD5.getMD5(inputPassword));
				/*
				 * 日后修复标记：这里仅用了email作为cookie并用于验证，极不安全
				 */
				if (user.getPwd().equals(pass)) {

					if (autoLogin != null && autoLogin.equals("on")) {
						Cookie cookieE = new Cookie("LOGIN_EMAIL", inputEmail);
						cookieE.setMaxAge(60 * 60 * 24 * 7);
						response.addCookie(cookieE);
					}
					HttpSession session = request.getSession();
					if(user.getName()!=null && !user.getName().equals("")){
						EmailOrUserName=user.getName();
					}else{
						EmailOrUserName=user.getEmail();
					}
					session.setAttribute("EmailOrUserName", EmailOrUserName);
					session.setAttribute("isLogined", true);
					request.getRequestDispatcher("/index.jsp").forward(request,
							response);
				} else {
					request.setAttribute("isLoginOk", "false");
					request.getRequestDispatcher("/user/login.jsp").forward(
							request, response);
				}
			} else {
				request.setAttribute("isLoginOk", "false");
				request.getRequestDispatcher("/user/login.jsp").forward(
						request, response);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
