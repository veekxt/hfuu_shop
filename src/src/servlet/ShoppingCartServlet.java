package src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.dbHandle.GoodsHandle;
import src.dbHandle.ShopCartHandle;
import src.tools.LoginVerify;
import src.vo.Goods;
import src.vo.User;

/**
 * 添加一个物品到购物车
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
			ShopCartHandle shopCartHandle = new ShopCartHandle();
			GoodsHandle goodsHandle = new GoodsHandle();
			Goods goods=null;
			try {
                goods=goodsHandle.findById(goodsId);
            } catch (Exception e1) {
                e1.printStackTrace();
            }finally {
            	goodsHandle.close();
			}
			try {
				if(goods!=null && goods.getStates()==2 && shopCartHandle.doSaveShoppingCart(0, goodsId, userId)){
					response.getWriter().print("success");
				}
				else{
					response.getWriter().print("error");
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.getWriter().print("error");
			}finally {
				shopCartHandle.close();
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
