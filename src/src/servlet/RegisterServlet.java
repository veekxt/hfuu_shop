package src.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.factory.DAOFactory;
import src.vo.User;

/**
 * Servlet implementation class RegisterServlet
 */

public class RegisterServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("input_email");
		String pwd=request.getParameter("input_password1");
		User user=new User();
		user.setEmail(email);
		user.setPwd(pwd);
		user.setId(1);
		boolean isRegister=false;
		try {
			if(DAOFactory.getIUserDAOInstance().doCreate(user)){
				isRegister=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("info",isRegister);
		if(isRegister){
			request.getRequestDispatcher("/user/login.jsp").forward(request,response);
		}
		else{
			request.getRequestDispatcher("/user/register.jsp").forward(request,response);
		}
	}
}
