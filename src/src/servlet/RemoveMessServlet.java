package src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.dbHandle.MessHandle;
import src.tools.LoginVerify;
import src.vo.User;

//删除一条消息
@WebServlet("/RemoveMessServlet")
public class RemoveMessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RemoveMessServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    if(request.getParameter("messid")==null || request.getParameter("messid").length()==0){
	        response.getWriter().print("false");
	        return;
	    }
	    Integer messId = Integer.parseInt(request.getParameter("messid"));
	    if (LoginVerify.isLogin(request)) {
	        User user = (User)request.getSession().getAttribute("loginUser");
	        int userId = user.getId();
	        MessHandle messHandle=new MessHandle();
	        try {
                if(messHandle.removeOneMess(messId, userId));
                response.getWriter().print("success");
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().print("false");
            }finally {
            	messHandle.close();
			}
	    }else{
	        response.getWriter().print("false");
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
