package src.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.factory.DAOFactory;
import src.tools.MD5;
import src.vo.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputEmail=request.getParameter("inputEmail");
		String inputPassword=request.getParameter("inputPassword");
		String autoLogin=request.getParameter("auto_login");
			try {
				if(DAOFactory.getIUserDAOInstance().findByEmail(inputEmail)!=null){
				
				User user=	DAOFactory.getIUserDAOInstance().findByEmail(inputEmail);
                String pass=	MD5.getMD5(MD5.getMD5(inputPassword));
					if(user.getPwd().equals(pass)){
				  
				    if(autoLogin!=null &&autoLogin.equals("on")){
				    	Cookie cookieE=new Cookie("LOGIN_EMAIL",inputEmail);
				    	cookieE.setMaxAge(60*60*24*7);
				    	response.addCookie(cookieE);
				    }
					HttpSession session=request.getSession();
				     session.setAttribute("Email",user.getEmail());
					session.setAttribute("isLogin",true);
						request.getRequestDispatcher("/index.jsp").forward(request, response);
					}else{
						request.setAttribute("isLoginOk", "false");
						request.getRequestDispatcher("/user/login.jsp").forward(request, response);
					}
				}
				else{
					request.setAttribute("isLoginOk", "false");
					request.getRequestDispatcher("/user/login.jsp").forward(request, response);
				}
			} catch (Exception e) {
			
				e.printStackTrace();
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
