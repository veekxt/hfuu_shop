package src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import src.dbHandle.*;
import src.tools.*;
import src.vo.*;

@WebServlet("/OrderCheckServlet")
public class OrderCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderCheckServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String messageToSeller = request.getParameter("message-to-seller");
		Boolean isLogined = LoginVerify.isLogin(request);
		Integer userId = Integer.parseInt(request.getParameter("userid"));
		String  goodsIdList = request.getParameter("goodsid");
		List<String> list=new ArrayList();
		if(goodsIdList.endsWith(",")){
			String goodsIdList1 =goodsIdList.substring(0, goodsIdList.length()-1);
		    String[] goodsId=      goodsIdList1.split(",");
		for(String goodsid:goodsId){
			list.add(goodsid);
			
		}
		}else{
			list.add(goodsIdList);
			
		}
		    
		    	
	
		
		//获取来源url，只保留第一个参数goodsid
		OrderHandle orderHandle=new OrderHandle();
		String fromURL = (String) request.getHeader("Referer");//.split("&")
		
		if(isLogined!=null && isLogined==true && userId!=null && goodsIdList !=null){
		  boolean flag=true;
			String errorGoodsName="";
			for(String goodsid:list){
		
		  int goodsId= Integer.parseInt(goodsid);
				Order order=new Order();
		        order.setGoodsId(goodsId);
		        order.setUserId(userId);
		        order.setMessage(messageToSeller);
		        order.setDate(new Date());
		        GoodsHandle goodsHandle=new GoodsHandle();
		        try {
		    		
                if(orderHandle.doCreate(order)){
                	goodsHandle.findById(goodsId).setStates(4);
                	
                }else{
                	
                }
		        } catch (Exception e) {
		        	e.printStackTrace();
		        	flag=false;
               
	            }
		  }
			if(flag){
				
				response.sendRedirect(fromURL +"&info="+java.net.URLEncoder.encode("购买成功","UTF-8"));
				
				
			}else{
				
				response.sendRedirect(fromURL +"&info="+java.net.URLEncoder.encode(errorGoodsName+"购买失败","UTF-8"));	
				
			}
            
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);
	}

}
