<%@page import="org.omg.CORBA.IntHolder"%>
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
//判断pn参数
int pn=1;
int perPage=StaticVar.PERPAGE_GOODS;//每页显示几条？
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
List <Goods> list=null;
IntHolder num = new IntHolder(0);
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
							<a href="index.jsp?ceta=0" class="list-group-item <%=ceta==0?"active":"" %>"><span class="badge"><!-- 这里写数量，暂时搁置 --></span>全部</a>
							<a href="index.jsp?ceta=2" class="list-group-item <%=ceta==2?"active":"" %>"><span class="badge"></span>生活出行</a>
							<a href="index.jsp?ceta=1" class="list-group-item <%=ceta==1?"active":"" %>"><span class="badge"></span>书籍</a> 
							<a href="index.jsp?ceta=5" class="list-group-item <%=ceta==5?"active":"" %>"><span class="badge"></span>体育运动</a> 
							<a href="index.jsp?ceta=4" class="list-group-item <%=ceta==4?"active":"" %>"><span class="badge"></span>电子产品</a>
							<a href="index.jsp?ceta=3" class="list-group-item <%=ceta==3?"active":"" %>"><span class="badge"></span>衣物鞋包</a>
							<a href="index.jsp?ceta=6" class="list-group-item <%=ceta==6?"active":"" %>"><span class="badge"></span>其他</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="list-group">
			    <%
			    switch(ceta){
                case 0:
                    out.println("<span class=\"list-group-item list-group-item-info\">分类-全部</span>");
                    list=goodHandle.findAll(num,limitMin,perPage);
                    break;
                case 1:
                    out.println("<span class=\"list-group-item list-group-item-info\">分类-书籍</span>");
                    list=goodHandle.findByCeta(1,num,limitMin,perPage);
                    break;
                case 2:
                    out.println("<span class=\"list-group-item list-group-item-info\">分类-生活出行</span>");
                    list=goodHandle.findByCeta(2,num,limitMin,perPage);
                    break;
                case 3:
                    out.println("<span class=\"list-group-item list-group-item-info\">分类-衣物鞋包</span>");
                    list=goodHandle.findByCeta(3,num,limitMin,perPage);
                    break;
                case 4:
                    out.println("<span class=\"list-group-item list-group-item-info\">分类-电子产品</span>");
                    list=goodHandle.findByCeta(4,num,limitMin,perPage);
                    break;
                case 5:
                    out.println("<span class=\"list-group-item list-group-item-info\">分类-体育运动</span>");
                    list=goodHandle.findByCeta(5,num,limitMin,perPage);
                    break;
                case 6:
                    out.println("<span class=\"list-group-item list-group-item-info\">分类-其他</span>");
                    list=goodHandle.findByCeta(6,num,limitMin,perPage);
                    break;
                default:
                    out.println("<span class=\"list-group-item list-group-item-info\">分类-全部</span>");
                    list=goodHandle.findAll(num,limitMin,perPage);
                	break;
			    }
			      if(list.size()!=0){
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
									<a href="goods/info.jsp?goodsid=<%=good.getId()%>"><%=good.getName()%></a>
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
			此分类下暂无物品或页数已经到达最大！
			</div>
			<%}%>
				</div>
<% 
int maxPage=num.value%perPage==0?num.value/perPage:num.value/perPage+1;
%>
<nav>
  <ul class="pager">
    <li class=""><a class="page-cut-btn" href="index.jsp?ceta=<%=ceta%>&pn=<%=pn<=1?pn:pn-1%>"><span aria-hidden="true"></span><%=pn>1?"上一页":"位于首页"%></a></li>
    <li style=""><span style="border:0">    　　第<span style="color:red;border:0"><%=pn %></span>页　　</span></li>
    <li class=""><a class="page-cut-btn" href="index.jsp?ceta=<%=ceta%>&pn=<%=pn<maxPage?pn+1:pn%>"><%=pn<maxPage?"下一页":"位于末页"%> <span aria-hidden="true"></span></a></li>
  </ul>
</nav>
			</div>
		</div>  
	</div>
	<jsp:include page="site/footer.jsp" />
</body>
</html>
<%
goodHandle.close();
userHandle.close();
%>