<%@page import="src.dbHandle.UserHandle"%>
<%@page import="org.w3c.dom.UserDataHandler"%>
<%@page import="src.dbHandle.GoodsHandle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.text.SimpleDateFormat,java.sql.*,java.lang.Math,src.tools.*,javax.servlet.http.HttpSession,java.util.*,src.vo.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
List<Goods> list= new ArrayList<Goods>();
String key="";
GoodsHandle goodsHandle=new GoodsHandle();
UserHandle userHandle=new UserHandle();
if(request.getParameter("key")==null || request.getParameter("key").length()==0){
    response.sendRedirect("index.jsp?ceta=0");
    goodsHandle.close();
    userHandle.close();
    return;
}else{
    key=request.getParameter("key");
    try {
        list = goodsHandle.findByKey(key);
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<jsp:include page="site/head.jsp" />
<title>物品交易-合肥学院-首页</title>
</head>
<body>
    <jsp:include page="site/header.jsp" />
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="row">
                    <div class="col-md-12">
                        <div class="list-group">
                            <span class="list-group-item list-group-item-info">分类</span> 
                            <a href="index.jsp?ceta=0" class="list-group-item"><span class="badge"><!-- 这里写数量，暂时搁置 --></span>全部</a>
                            <a href="index.jsp?ceta=2" class="list-group-item"><span class="badge"></span>生活出行</a>
                            <a href="index.jsp?ceta=1" class="list-group-item"><span class="badge"></span>书籍</a> 
                            <a href="index.jsp?ceta=5" class="list-group-item"><span class="badge"></span>体育运动</a> 
                            <a href="index.jsp?ceta=4" class="list-group-item"><span class="badge"></span>电子产品</a>
                            <a href="index.jsp?ceta=3" class="list-group-item"><span class="badge"></span>衣物鞋包</a>
                            <a href="index.jsp?ceta=6" class="list-group-item"><span class="badge"></span>其他</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="list-group">
                <span class="list-group-item list-group-item-info">"<%=request.getParameter("key")%>"  的搜索结果</span>
                 <% if(list.size()!=0){
                    for(Goods good:list){
                    if(good.getProducter_id()==null)continue;
                    User user = userHandle.findById(good.getProducter_id());
                    %><div class="list-group-item">
                        <div class="row">
                            <div class="goods-img col-md-2">
                                <img class="img-rounded img-item-goods"
                                    src="<%=good.getImage()%>" />
                            </div>
                                <div class="col-md-10">
                                <div class="row detail-goods lead">
                                <a href="goods/info.jsp?goodsid=<%=good.getId()%>">
                                
                                
                                <%
                                String name=good.getName();
                                int tmp;
                                String str1=name;
                                String str2="";
                                String str3="";
                                if((tmp=name.indexOf(key))!=-1){
                                	str1=name.substring(0,tmp);
                                	str2=key;
                                	str3=name.substring(tmp+key.length());
                                }
                                %>
                                <%=str1 %><span class="bg-beselect"><%=str2 %></span><%=str3 %>
                                </a>
                                </div>
                                <div class="row detail-goods">￥<span class="text-danger"><%=Math.round(good.getPrice()) %></span>
                                <span class="detail-goods text-muted">　发布者:<%if(user.getName()!=null){%><%=user.getName() %><%}else{%><%=user.getEmail()%><%}%> </span>
                                <span class="detail-goods text-muted">　时间：
                                <%
                                java.util.Date date=good.getCreatDate();
                                SimpleDateFormat myFmt=new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
                                String dateStr =myFmt.format(date);
                                out.print(dateStr);
                                %>
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>    
                    <%    
                      }
                  }else{%>
            <div class="list-group-item">
            未搜索到任何物品
            </div>
            <%}%>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="site/footer.jsp" />
</body>
</html>
<%
goodsHandle.close();
userHandle.close();
%>