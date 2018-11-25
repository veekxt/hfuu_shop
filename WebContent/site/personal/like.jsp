<%/*
购物车页面，被/personal.jsp包含，查找所有购物车内物品
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="src.tools.IntHolder,src.tools.*,src.dbHandle.*,src.vo.*,java.sql.*,java.util.*,java.text.SimpleDateFormat"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="panel panel-info">
                <div class="list-group">
                <%
                //判断pn参数
                User user=(User)session.getAttribute("loginUser");
                int pn=1;
                int perPage=StaticVar.PERPAGE_COLLECT;//每页显示几条？
                int ceta=0;
                String tmpString=request.getParameter("pn");
                //获取pn参数
                if(tmpString!=null && tmpString.length()!=0){
                    if(Integer.parseInt(tmpString)>0){
                        pn=Integer.parseInt(tmpString);
                    }
                }
                //获取ceta参数
                tmpString=request.getParameter("ceta");
                if(tmpString!=null && tmpString.length()!=0){
                    if(Integer.parseInt(tmpString)>0){
                        ceta=Integer.parseInt(tmpString);
                    }
                }
                int limitMin=(pn-1)*perPage;
                GoodsHandle goodHandle=new GoodsHandle();
                UserHandle userHandle =new UserHandle();
                CollectHandle collectHandle=new CollectHandle();
                List <Goods> list=null;
                IntHolder num = new IntHolder(0);
                %>
                <%
                out.println("<span class=\"list-group-item list-group-item-info\">我的收藏</span>");
                list = collectHandle.findGoodsByUser(user, num, limitMin, perPage);
                  if(list.size()!=0){
                    for(Goods good:list){
                    if(good.getProducter_id()==null)continue;
                    User pUser = userHandle.findById(good.getProducter_id());
                    %><div onMouseLeave="hide(this,'re-bt-<%=good.getId() %>')" onMouseOver="show(this,'re-bt-<%=good.getId() %>')" class="list-group-item">
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
                                <span class="detail-goods text-muted">　发布者:<%if(pUser.getName()!=null){%><%=pUser.getName() %><%}else{%><%=pUser.getEmail()%><%}%> </span>
                                <span class="detail-goods text-muted">　时间：
                                <%
                                java.util.Date date=good.getCreatDate();
                                SimpleDateFormat myFmt=new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
                                String dateStr =myFmt.format(date);
                                out.print(dateStr);
                                %>
                                <button id="re-bt-<%=good.getId() %>" style="display:none" type="button" class="btn btn-xs btn-danger"
                                onclick="delete_collect(<%=good.getId()%>)">移除收藏</button>
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>    
                    <%    
                      }
                  }else{%>
            <div class="list-group-item">
            尚未收藏任何物品
            </div>
            <%}%>
                </div>
<% 
int maxPage=num.value%perPage==0?num.value/perPage:num.value/perPage+1;
%>
<nav>
  <ul class="pager">
    <li class=""><a class="page-cut-btn" href="user/personal.jsp?tab=like&pn=<%=pn<=1?pn:pn-1%>&userid=<%=user.getId()%>"><span aria-hidden="true"></span><%=pn>1?"上一页":"位于首页"%></a></li>
    <li style=""><span style="border:0">    　　第<span style="color:red;border:0"><%=pn %></span>页　　</span></li>
    <li class=""><a class="page-cut-btn" href="user/personal.jsp?tab=like&pn=<%=pn<maxPage?pn+1:pn%>&userid=<%=user.getId()%>"><%=pn<maxPage?"下一页":"位于末页"%> <span aria-hidden="true"></span></a></li>
  </ul>
</nav>
</div>

<script>
function show(obj,id1) {
    var objDiv = $("#"+id1+"");
    $(objDiv).css("display","inline");
}

function hide(obj,id1) {
var objDiv = $("#"+id1+"");
$(objDiv).css("display", "none");
}

function delete_collect(goodsid){
    collectRemove=new XMLHttpRequest();
    collectRemove.onreadystatechange=function()
      {
      if (collectRemove.readyState==4 && collectRemove.status==200)
        {
        if(collectRemove.responseText=="success")
            {
                cnode = document.getElementById("re-bt-"+goodsid);
                cnode.innerHTML="已从收藏夹移除";
            }
        }
      }
    collectRemove.open("GET","RemoveCollectServlet?goodsid="+goodsid+"&t="+Math.random(),true);
    collectRemove.send(null);
}

</script>
<%
userHandle.close();
goodHandle.close();
collectHandle.close();
%>