package src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.dbHandle.UserHandle;
import src.tools.MD5;
import src.vo.User;
//注册验证
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("input_email");
		String pwd = request.getParameter("input_password1");
		String pwd2 = request.getParameter("input_password2");
		String name= (request.getParameter("name")==null && request.getParameter("name").length()!=0)?"某用户":request.getParameter("name");
		User user = new User();
		boolean isRegister = false;
		String isPwdSame="";
		String isPwd="";
		String isEmail="";
		UserHandle userHandle= new UserHandle();
		try {
			if (email.matches("^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")
					&& ((userHandle.findByEmail(email)) == null)) {
				if (pwd.matches("[A-Za-z0-9_]{6,}")) {
					if (pwd2.equals(pwd)) {
						pwd = MD5.getMD5(MD5.getMD5(pwd));
						user.setEmail(email);
						user.setPwd(pwd);
						user.setName(name);
						if (userHandle.doCreate(user)) {
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
				isEmail="邮箱格式错误或已经存在";
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
		}finally {
			userHandle.close();
		}
	}

}
