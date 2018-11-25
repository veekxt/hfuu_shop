package src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import src.dbHandle.*;
import src.tools.*;
import src.vo.*;

@WebServlet("/OrderCheckServlet")
public class OrderCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderCheckServlet() {
        super();
    }
   //订单验证
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String messageToSeller = request.getParameter("message-to-seller");
        Boolean isLogined = LoginVerify.isLogin(request);
        Integer userId = Integer.parseInt(request.getParameter("userid"));
        Integer goodsId = Integer.parseInt(request.getParameter("goodsid"));
        OrderHandle orderHandle=new OrderHandle();
        Order order=new Order();
        //获取来源url，只保留第一个参数goodsid
        String fromURL[] = request.getHeader("Referer").split("&");
        if(isLogined!=null && isLogined==true && userId!=null && goodsId!=null){
            try {
                order.setGoodsId(goodsId);
                order.setUserId(userId);
                order.setMessage(messageToSeller);
                order.setDate(new Date());
                if(orderHandle.doCreate(order)){
                    response.sendRedirect(fromURL[0]+"&info="+java.net.URLEncoder.encode("购买成功，消息已发送至卖家","UTF-8"));
                    return;
                }
            } catch (Exception e) {
                response.sendRedirect(fromURL[0]+"&info="+java.net.URLEncoder.encode("购买失败","UTF-8"));
                e.printStackTrace();
                return;
            }finally {
            	orderHandle.close();
			}
        }
        else{
            response.sendRedirect(fromURL[0]+"&info="+java.net.URLEncoder.encode("购买失败","UTF-8"));
            return;
        }
    }
	   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);
	}
}
