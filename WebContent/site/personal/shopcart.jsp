<%/*
购物车页面，被/personal.jsp包含，查找所有购物车内物品
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="src.dbHandle.*,src.vo.*,java.sql.*,java.util.*,java.text.SimpleDateFormat"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//findGoodsByUser
ShopCartHandle shopCartHandle=new ShopCartHandle();
User me =(User)session.getAttribute("loginUser");
UserHandle userHandle=new UserHandle();
List <Goods> list=null;
list=shopCartHandle.findGoodsByUser(me);
%>


<script type="text/javascript">
function remove(goodsId){
	xmlRemove=new XMLHttpRequest();
	
	xmlRemove.onreadystatechange=function()
	  {
		  if ((xmlRemove.readyState==4)&&(xmlRemove.status==200))
		    {
		    if(xmlRemove.responseText=="success")
		    	{
		    	document.getElementById("list-goods-"+goodsId).remove(); 		
		    	}
		 
		  
		  else{
			  //document.getElementById("auditing-button-"+goodsid).innerHTML="=操作中=";
		  }
		  
		    }
	
	
	
	
	
	
	
}
	xmlRemove.open("GET","RemoveShopCartServlet?goodsId="+goodsId+"&t="+Math.random(),true);
	xmlRemove.send(null);
}
</script>
<div class="panel panel-info">
	<div class="panel-heading">
			我的购物车
	</div>
	<div class="panel-body">
	<div class="list-group">
	<%
	if(list.size()!=0){
		for(Goods good:list){
	    	if(good.getProducter_id()==null)continue;
	    	User user = userHandle.findById(good.getProducter_id());
	    	%>
	    	<div id="list-goods-<%=good.getId() %>" class="list-group-item">
				<div class="row">
					<div class="col-md-3">
						<img class="img-rounded img-item-goods"
							src="<%=good.getImage()%>" />
					</div>
					<div class="col-md-9">
					<div class="row detail-goods lead">
						<div>
						<a href="goods/info.jsp?goodsid=<%=good.getId()%>"><%=good.getName()%></a>
						<button  onclick="remove(<%=good.getId()%>)"class="pull-right btn btn-success">
						移除
						</button>
						</div>
					</div>
			        <div class="row detail-goods text-muted">价格:<%=good.getPrice()%> </div>
					
					<div class="row detail-goods text-muted">发布者:<%if(user.getName()!=null){ %><%=user.getName() %><%}else{%><%=user.getEmail()%><%}%> </div>
					<div class="row detail-goods text-danger">
					时间：
					<%
					java.util.Date date=good.getCreatDate();
					SimpleDateFormat myFmt=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
					String dateStr =myFmt.format(date);
					out.print(dateStr);
					%>
					</div>
					</div>
				</div>
	    	</div>
	    	<%}%>
	    	<div>
	    	
	    	<button id ="buyAll"class="pull-right btn btn-success">
			购买全部
			</button>
			</div>
					<script type="text/javascript">
					$(document).ready(function(){
						  $("#buy").click(function(){
						  $(".buy-confirm").show(200);
						  });
						});
						</script>
						<div style="display:none;" class="buy-confirm">
						<hr />
						<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="panel panel-info">
								<div class="panel-heading">
								<span class="center-block" style="text-align:center;font-size:15px;">确定购买</span>
								</div>
								<div class="panel-body">
								<p>
								请输入给卖家的附加消息，然后点击 "确定" 按钮，我们将会通知卖家。
								</p>
								
								<form action="OrderCheckServlet?goodsid=<%=request.getParameter("goodsid")%>&userid=<%=((User)session.getAttribute("loginUser")).getId()%>" method="post">
								  <div class="form-group">
								    <textarea class="form-control" name="message-to-seller" id="message-to-seller"></textarea>
								  </div>
								  <button type="submit" class="pull-left btn btn-default">确认购买</button>
								</form>
								
								</div>
							</div>
						</div>
						</div>
						</div>
			<%}%>
	    	</div>
	</div>
</div>