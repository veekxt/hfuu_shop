package src.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.factory.DAOFactory;
import src.vo.MD5;
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
		String pwd2=request.getParameter("input_password2");
		User user=new User();
		
		
	try{
			if(email.matches("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$")&&((DAOFactory.getIUserDAOInstance().findByEmail(email))==null)){
				if(pwd.matches("[A-Za-z0-9]{6,}")){
					if(pwd2.equals(pwd)){
					
				
			pwd=MD5.getMD5(MD5.getMD5(pwd));
			user.setEmail(email);
			user.setPwd(pwd);
			user.setId(1);
			boolean isRegister=false;
		
				if(DAOFactory.getIUserDAOInstance().doCreate(user)){
					isRegister=true;
				}
		
			request.setAttribute("info",isRegister);
			if(isRegister){
				request.getRequestDispatcher("/user/login.jsp").forward(request,response);
			}
			else{
				request.getRequestDispatcher("/user/register.jsp").forward(request,response);
			}
			}else{System.out.println("3");//pwd1!=pw2
				request.getRequestDispatcher("/user/register.jsp").forward(request,response);
			}
				}
				else{
					System.out.println("2");//pwd不符合格式
					request.getRequestDispatcher("/user/register.jsp").forward(request,response);
				}
}else{
			System.out.println("1");//email不符合格式
			request.getRequestDispatcher("/user/register.jsp").forward(request,response);
			
}
		
	}catch(Exception e){
		e.printStackTrace();
	}}
	
}
