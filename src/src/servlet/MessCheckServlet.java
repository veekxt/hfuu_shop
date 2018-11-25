package src.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.tools.*;
import src.vo.*;
import src.dbHandle.*;
/**
 * Servlet implementation class MessCheckServlet
 */
@WebServlet("/MessCheckServlet")
public class MessCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MessCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO
	    //用户已登录&&对方存在&&消息正文不为空==》写入数据库
	    if(!LoginVerify.isLogin(request)){
	        response.sendRedirect("user/login.jsp?login-info="+java.net.URLEncoder.encode("你应该先登录","UTF-8"));
	        return;
	    }
	    UserHandle userHandle=new UserHandle();
	    MessHandle messHandle=new MessHandle();
	    String toEmail = request.getParameter("InputEmailToSend").split(" ")[0];
	    String toMess = request.getParameter("InputMess");
	    User fromUser=((User)request.getSession().getAttribute("loginUser"));;
	    User toUser=null;
	    Mess mess=new Mess();
	    if(toEmail!=null){
	        try {
                toUser=userHandle.findByEmail(toEmail);
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
				userHandle.close();
			}
	    }
	    
	    if(toUser!=null && toMess!=null && !toMess.equals("")){
	        mess.setMessFromId(fromUser.getId());
	        mess.setMessText(toMess);
	        mess.setMessToId(toUser.getId());
	        mess.setSendDate(new Date());
	        try {
                messHandle.doCreate(mess);
                response.sendRedirect("user/personal.jsp?tab=mess&userid="+fromUser.getId()+"&handle=write"+"&info="+java.net.URLEncoder.encode("消息已发送","UTF-8"));
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
				messHandle.close();
			}
	    }
	    else{
	        response.sendRedirect("user/personal.jsp?tab=mess&userid="+fromUser.getId()+"&handle=write"+"&info="+java.net.URLEncoder.encode("发送失败，检查你的输入","UTF-8"));
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
