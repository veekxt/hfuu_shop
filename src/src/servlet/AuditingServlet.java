package src.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.dbHandle.GoodsHandle;
import src.tools.LoginVerify;
import src.vo.*;
/**
 * Servlet implementation class AuditingServlet
 */
@WebServlet("/AuditingServlet")
public class AuditingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AuditingServlet() {
        super();
    }
    /**
     * Servlet:验证待审核物品
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(LoginVerify.isAdmin(request)){
			int isPass=Integer.parseInt(request.getParameter("hd"));
			int goodsId=Integer.parseInt(request.getParameter("goodsid"));
			boolean isSuc=false;
			GoodsHandle goodsHandle=new GoodsHandle();
			try {
				Goods goods=goodsHandle.findById(goodsId);
				if(isPass==1){
					goods.setStates(2);
					isSuc=true;
				}else if(isPass==0){
					goods.setStates(3);
					isSuc=true;
				}else{
					response.getWriter().print("error");
				}
				if(isSuc){
					goodsHandle.doUpdate(goods);
					response.getWriter().print("success");
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.getWriter().print("error");
			}finally {
				goodsHandle.close();
			}
		}else{
			response.getWriter().print("error");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
