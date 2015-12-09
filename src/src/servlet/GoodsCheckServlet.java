package src.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import src.dbHandle.GoodsHandle;
//import src.factory.GoodsDAOFactory;
import src.vo.Goods;

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
       
		String nameCheck="";
		String  quantityCheck="";
		String contentCheck="";
		String fileCheck="";
		request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        request.setAttribute("isCheck", false);
        //存储路径
        String savePath = request.getServletContext().getRealPath("/static/goods_img");
        //处理表单
        String goodsName=getForm(request, "name-goods");
        String goodsContent=getForm(request,"content-goods");
   
   String   goodsQuantitystr= getForm(request,"quantity-goods");//先判断再转换成int防止直接抛出异常
    Integer	goodsQuantity=null;
   
    	// ;
      	//处理文件
      	Part part=request.getPart("file");


          //给文件取名,使用ID取名
          //ToDo
         // String fileName = "todo_rename.jpg";
          if(goodsName!=null&&(!goodsName.equals(""))){
        
          	 if((goodsQuantitystr!=null&&!goodsQuantitystr.equals(""))){
          		
          		    if(goodsContent!=null&&(!goodsContent.equals(""))){
                      	 if(part.getSize()!=0){
                      		 goodsQuantity= Integer.parseInt(getForm(request,"quantity-goods"));
                      		  Goods good=new Goods();
                      		  good.setName(goodsName);
                      		  good.setContent(goodsContent);
                      		  good.setNum(goodsQuantity);
                      		 
                      		request.setAttribute("isCheck", true);
                      		boolean flag =false;
                  
			  int maxid=0;
			  FileOutputStream fos=null;
			try {
				GoodsHandle goodsHandle=new GoodsHandle();
				maxid = goodsHandle.getMaxId();
			     good.setId(maxid+1);
			     
			   int id= good.getId(); 
			     

                 byte[] bt=new byte[(int)part.getSize()];
                 int len;
                 
             String    imagePathName1= savePath+"\\"+id+".jpg";
           //  System.out.println(imagePathName1);
   String   imagePathName=  imagePathName1.replace('\\','/');
  // System.out.println(imagePathName);
             good.setImage("/static/goods_img/"+id+".jpg");
             fos=new FileOutputStream(imagePathName);
             
             
             part.getInputStream().read(bt);
             fos.write(bt);
          goodsHandle.doCreateGoods(good);
             
               
              System.out.println("yes");
			     
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(fos!=null){
				fos.close();
				}
			}
				
               
                      		    //把文件写到指定路径
                      		 
//                      	        part.write(savePath+File.separator+fileName);
//                      	        if(true/*suc*/){
//                      	        	/*jump1*/
//                      	        }else{
//                      	        	request.setAttribute("info", "error");
//                      	        	/*jump2*/
//                      	        }
//                      	     
                         	
                         	
                         } else{
                      		 
                      		fileCheck="需要上传物品图片";
                      		request.setAttribute("fileCheck", fileCheck);
                          	request.getRequestDispatcher("user/personal.jsp?tab=push").forward(request, response);
                      	 }
                      }else{
                     	 
                     	 contentCheck="物品简介不能为空";
                     	request.setAttribute("contentCheck", contentCheck);
                  	request.getRequestDispatcher("user/personal.jsp?tab=push").forward(request, response);
                      }
           
          	 }else{
          		 quantityCheck="物品数量不能为空且要大于0";}
          	 
          	 
          	 request.setAttribute("quantityCheck", quantityCheck);
           	request.getRequestDispatcher("user/personal.jsp?tab=push").forward(request, response);
          {
          	
          	
          }
          
     
          } else{
          	nameCheck="物品名称不能为空";
        	
          	
          	request.setAttribute("nameCheck", nameCheck);
          	request.getRequestDispatcher("user/personal.jsp?tab=push").forward(request, response);
        	 }

    	 //todo,更多信息
      
       
    
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    this.doGet(request, response);
	}
}
