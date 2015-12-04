package src.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.factory.DAOFactory;
import src.vo.MD5;
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
	
			try {
				if(DAOFactory.getIUserDAOInstance().findByEmail(inputEmail)!=null){
				
				User user=	DAOFactory.getIUserDAOInstance().findByEmail(inputEmail);
                String pass=	MD5.getMD5(MD5.getMD5(inputPassword));
					if(user.getPwd().equals(pass)){
						
						
						request.getRequestDispatcher("/index.jsp").forward(request, response);
					}
					
				}
				else{
					
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
