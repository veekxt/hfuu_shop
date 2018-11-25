<%/*
审核页面，被/personal.jsp包含，查找所有未审核商品（status=1）
status说明：
1-未审核
2-审核通过
3-审核未通过
4-已被购买(交易中)
5-交易完成
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="src.dbHandle.*,src.vo.*,java.sql.*,java.util.*,java.text.SimpleDateFormat"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>
function passGoods(goodsid,type){
	xmlGoods=new XMLHttpRequest();
	xmlGoods.onreadystatechange=function()
	  {
	  if (xmlGoods.readyState==4 && xmlGoods.status==200)
	    {
	    if(xmlGoods.responseText=="success")
	    	{
	    		if(type=="pass"){document.getElementById("auditing-button-"+goodsid).innerHTML="<p class=\"bg-info\">已通过</p>";}
	    		if(type=="refuse"){document.getElementById("auditing-button-"+goodsid).innerHTML="<p class=\"bg-danger\">已拒绝</p>";}
	    	}
	    }
	  else{
		  //document.getElementById("auditing-button-"+goodsid).innerHTML="=操作中=";
	  }
	  }
	xmlGoods.open("GET","AuditingServlet?goodsid="+goodsid+"&t="+Math.random()+(type=="pass"?"&hd=1":"&hd=0"),true);
	xmlGoods.send(null);
}
</script>
<div class="panel panel-info">
	<div class="panel-heading">
		<%
	out.println("审核商品");
%>
	</div>
	<div class="panel-body">
<%
GoodsHandle goodsHandle=new GoodsHandle();
UserHandle userHandle=new UserHandle();
List<Goods> all=null;
try{
all = goodsHandle.findAllNotAuditing();
}catch(Exception e){
    System.out.print("数据库异常");
}
if(all.size()==0){
%>
<div class="alert alert-info" role="alert">
还没有需要审核的物品
</div>
<%
}else{
%>
		<table class="table table-striped">
			<tr>
				<th class="td-user-name" style="width: 10%;">用户</th>
				<th class="td-user-name" style="width: 15%;">发布于</th>
				<th class="td-user-name" style="width: 15%;">物品名</th>
				<th class="td-user-name" style="width: 15%;">详情</th>
				<th class="td-user-name" style="width: 15%;">操作</th>
			</tr>
<%
for(Goods goods:all)
{
%>
			<tr>
				<td class="td-user-name" style="width: 10%;">
				<%
				if(userHandle.findById(goods.getProducter_id()).getName()==null){
				    out.print(userHandle.findById(goods.getProducter_id()).getEmail());
				}
				else{
				    out.print(userHandle.findById(goods.getProducter_id()).getName());
				}
				%>
				</td>
				<td class="td-user-name" style="width: 15%;"><%=new SimpleDateFormat("yyyy/MM/dd HH:mm").format(goods.getCreatDate())%></td>
				<td class="td-user-name" style="width: 15%;"><%="<a target='_blank' href="+"goods/info.jsp?goodsid="+goods.getId()+">"+goods.getName()+"</a>"%>
				</td>
				<td class="td-user-name" style="width: 15%;"><abbr
					title="<%=goods.getContent()%>">[详情]</abbr>
				</td>
				<td>
					<div id="auditing-button-<%=goods.getId()%>"
						class="btn-group btn-group-sm">
					<button type="button" class="btn btn-success"
							onclick="passGoods(<%=goods.getId()%>,'pass');">通过</button>
					<button type="button" class="btn btn-danger"
							onclick="passGoods(<%=goods.getId()%>,'refuse');">拒绝</button>
					</div>
				</td>
			</tr>

<%}%>
<%}%>
		</table>

	</div>
</div>
<%
userHandle.close();
goodsHandle.close();
%>