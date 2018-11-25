<%/*
已发布的商品页，被/personal.jsp包含
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isThreadSafe="false"%>
<%@ page import="java.text.SimpleDateFormat,java.sql.*,src.dbHandle.*,src.tools.*,javax.servlet.http.HttpSession,java.util.*,src.vo.*"%>

<%
    String path = request.getContextPath();
	String servletPath=path+"/GoodsCheckServlet";
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
UserHandle userHandle=new UserHandle();
GoodsHandle goodsHandle=new GoodsHandle();
Boolean isLogined=LoginVerify.isLogin(request);
User me=(User)session.getAttribute("loginUser");
User user=null;
if(request.getAttribute("isMe")!=null){
    user=me;
}else{
    user=userHandle.findById(Integer.parseInt(request.getParameter("userid")));
}
List <Goods> list=null;
list=goodsHandle.findByUserId(user.getId());
SimpleDateFormat myFmt=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
%>
<div class="panel panel-info">
	<div class="panel-heading">
<%
	out.println("发布的物品");
%>
	</div>
	<div class="panel-body">
    <%
    if(list.size()>0){
    %>
    <div class="list-group">
    <% for(Goods good:list){ %>
    
    <div class="list-group-item">
                        <div class="row">
                            <div class="goods-img col-md-2">
                                <img class="img-rounded img-item-goods"
                                    src="<%=good.getImage()%>" />
                            </div>
                                <div class="col-md-10">
                                <div class="row detail-goods lead">
                                <span class="label label-<%=good.getStates()==2?"info":"danger" %>">
                                <%=good.getStates()==2?"出售中":"已被购买" %>
                                </span>
                                    <a href="goods/info.jsp?goodsid=<%=good.getId()%>"><%=good.getName()%></a>
                                </div>
                                <div class="row detail-goods">￥<span class="text-danger"><%=Math.round(good.getPrice()) %></span>
                                <span class="detail-goods text-muted">　发布者:<%if(user.getName()!=null){%><%=user.getName() %><%}else{%><%=user.getEmail()%><%}%> </span>
                                <span class="detail-goods text-muted">　时间：
                                <%
                                java.util.Date date=good.getCreatDate();
                                out.print(myFmt.format(date));
                                %>
                                </span>

                                </div>
                                
                            </div>
                        </div>
                    </div>  
    <%}%>               
    <%}else{%>
    还没有发布的物品
    <%}%>
    </div>
	</div>
</div>
<%
userHandle.close();
goodsHandle.close();
%>