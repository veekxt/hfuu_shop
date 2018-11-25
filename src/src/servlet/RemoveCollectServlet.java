package src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.dbHandle.CollectHandle;
import src.tools.LoginVerify;
import src.vo.User;

/**
 * Servlet implementation class RemoveCollectServlet
 */
@WebServlet("/RemoveCollectServlet")
public class RemoveCollectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCollectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 从收藏夹移除一个物品
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer goodsId = Integer.parseInt(request.getParameter("goodsid"));
		if (LoginVerify.isLogin(request)) {
    		User loginUser = (User)request.getSession().getAttribute("loginUser");
    		int loginUserId = loginUser.getId();
    		CollectHandle collectHandle=new CollectHandle();
    		try {
    		if(collectHandle.removeOneFromCollect(goodsId, loginUserId)){
    			response.getWriter().print("success");
    		}else{
    			response.getWriter().print("false");
    		}
    		} catch (Exception e) {
    			e.printStackTrace();
    			response.getWriter().print("false");
    		}finally {
    			collectHandle.close();
			}
        }else{
        	response.getWriter().print("false");
        }   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
