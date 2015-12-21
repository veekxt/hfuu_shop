package src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.dbHandle.ShopCartHandle;
import src.tools.LoginVerify;
import src.vo.User;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShoppingCartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		if (LoginVerify.isLogin(request)) {
			User user = (User) request.getSession().getAttribute("loginUser");

			int userId = user.getId();
			int goodsId = Integer.parseInt(request.getParameter("goodsId"));
			int goodsNum = (Integer) request.getSession().getAttribute(
					"goodsNum");
			goodsNum = goodsNum + 1;
			ShopCartHandle shopCartHandle = new ShopCartHandle();
			request.getSession().setAttribute("goodsNum", goodsNum);
			try {
				if(shopCartHandle.doSaveShoppingCart(goodsNum, goodsId, userId)){
					response.getWriter().print("success");
				}
				else{
					response.getWriter().print("error");
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.getWriter().print("error");
			}
		} else {
			response.getWriter().print("unLogin");
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
