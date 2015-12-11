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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuditingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
				// TODO: handle exception
				e.printStackTrace();
				response.getWriter().print("error");
			}
		}else{
			response.getWriter().print("error");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
