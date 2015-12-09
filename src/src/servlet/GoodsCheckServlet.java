package src.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class GoodsCheckServlet
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/GoodsCheckServlet")
public class GoodsCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    //使用part获取表单域
    public String getForm(HttpServletRequest req,String formName) throws IllegalStateException, IOException, ServletException{
    	Part part = req.getPart(formName);
    	byte[] tmp=new byte[(int) part.getSize()];
    	part.getInputStream().read(tmp);
    	return new String(tmp);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //存储路径
        String savePath = request.getServletContext().getRealPath("/static/goods_img");
        //处理表单
        String goodsName=getForm(request, "name-goods");
        int goodsQuantity=Integer.parseInt(getForm(request,"quantity-goods"));
    	//todo,更多信息
    	//处理文件
    	Part part=request.getPart("file");
        //给文件取名,使用ID取名
        //ToDo
        String fileName = "todo_rename.jpg";
        //把文件写到指定路径
        part.write(savePath+File.separator+fileName);
        if(true/*suc*/){
        	/*jump1*/
        }else{
        	request.setAttribute("info", "error");
        	/*jump2*/
        }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    this.doGet(request, response);
	}
}
