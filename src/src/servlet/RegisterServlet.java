package src.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.dao.proxy.UserDAOProxy;
import src.factory.DAOFactory;
import src.tools.MD5;
import src.vo.User;

/**
 * Servlet implementation class RegisterServlet
 */

public class RegisterServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("input_email");
		String pwd = request.getParameter("input_password1");
		String pwd2 = request.getParameter("input_password2");
		User user = new User();
		boolean isRegister = false;
		String isPwdSame="";
		String isPwd="";
		String isEmail="";
		try {
			if (email.matches("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$")
					&& ((DAOFactory.getIUserDAOInstance().findByEmail(email)) == null)) {
				if (pwd.matches("[A-Za-z0-9]{6,}")) {
					if (pwd2.equals(pwd)) {
						pwd = MD5.getMD5(MD5.getMD5(pwd));
						user.setEmail(email);
						user.setPwd(pwd);
						if (DAOFactory.getIUserDAOInstance().doCreate(user)) {
							isRegister = true;
						}
						request.setAttribute("isRegister", isRegister);
						if (isRegister) {
							request.getRequestDispatcher("/user/login.jsp")
									.forward(request, response);
						} else {
							request.getRequestDispatcher("/user/register.jsp")
									.forward(request, response);
						}
					} else {
						isPwdSame="两次密码不相同";
					}
				} else {
					isPwd="密码格式错误";
				}
			} else {
				isEmail="邮箱格式错误";
			}
			if(isRegister == true){
				request.setAttribute("isRegister",isRegister);
				request.getRequestDispatcher("/user/login.jsp").forward(
						request, response);
			}else{
				request.setAttribute("isRegister",false);
				request.setAttribute("isPwdSame",isPwdSame);
				request.setAttribute("isPwd",isPwd);
				request.setAttribute("isEmail",isEmail);
				request.getRequestDispatcher("/user/register.jsp").forward(
						request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
