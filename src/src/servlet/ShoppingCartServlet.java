package src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.dbHandle.ShopHandle;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ShoppingCartServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    int userId=	Integer.parseInt(request.getParameter("userId"));
  
    int goodsId=Integer.parseInt(request.getParameter("goodsId"));
   int goodsNum=(Integer) request.getSession().getAttribute("goodsNum");
   goodsNum=goodsNum+1;
   ShopHandle shopHandle=new ShopHandle();
   request.getSession().setAttribute("goodsNum",goodsNum);
   try {
	shopHandle.doSaveShoppingCart(goodsNum, goodsId, userId);
	// request.getSession().setAttribute("goodsNum",goodsNum);
	response.getWriter().print("success");
	
} catch (Exception e) {
	
	e.printStackTrace();
	response.getWriter().print("false");
}
	
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
