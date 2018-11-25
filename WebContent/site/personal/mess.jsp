<%@page import="src.tools.IntHolder"%>
<%/*
个人信息页，被/personal包含，非自己只显示公开信息
*/%>
<%
UserHandle userHandle=new UserHandle();
MessHandle messHandle= new MessHandle();
User user=null;
if(!LoginVerify.isLogin(request)){
    request.getRequestDispatcher("../../user/login.jsp?login-info="+java.net.URLEncoder.encode("你应该先登录，之后从个人中心进入消息页","UTF-8")).forward(request,response);
	return;
}
User me=(User)session.getAttribute("loginUser");

int pn=1;
String tmpString=request.getParameter("pn");
//获取pn参数
if(tmpString!=null && tmpString.length()!=0){
    if(Integer.parseInt(tmpString)>0){
        pn=Integer.parseInt(tmpString);
    }
}
int perPage=StaticVar.PERPAGE_MESS;//每页显示几条？
IntHolder num=new IntHolder(0);
int limitMin=(pn-1)*perPage;

List<Mess> allMess = messHandle.findAllMessByUser(num,me, limitMin, perPage);
int maxPage=num.value%perPage==0?num.value/perPage:num.value/perPage+1;
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.text.SimpleDateFormat,java.sql.*,src.dbHandle.*,src.tools.*,javax.servlet.http.HttpSession,java.util.*,src.vo.*"%>

<div class="panel panel-info">
	<div class="panel-heading">
<%
	String handle=request.getParameter("handle");
	Boolean isWrite=(handle!=null && handle.equals("write"))?true:false;
%>
<a href="<%=basePath%>user/personal.jsp?tab=mess&userid=<%=me.getId()%>">我的消息</a>
 / 
<a href="<%=basePath%>user/personal.jsp?tab=mess&handle=write&userid=<%=me.getId()%>">发送站内信</a>
	</div>
	<div class="panel-body">
<%if(!isWrite){%>
<div class="alert alert-warning" role="alert">
注意：系统消息会带有“sys”标签，其他皆为用户消息,带有“user”标签。
</div>
<!-- 这里写消息列表 -->
<%
//访问了消息页，则将消息数量清零
userHandle.emptyMessnum(me);
%>
<script>
//前端消息数量清零
document.getElementById("mess-number").innerHTML="0";
</script>
<%
if(allMess.size()!=0){
    for(int i=0;i<allMess.size();i++){
        Mess mess=allMess.get(i);
%>

<!-- 一条消息 -->	
<%user=userHandle.findById(mess.getMessFromId()); %>
<div onMouseLeave="hide(this,'cz-bt-<%=mess.getMessId() %>','is-bt-<%=mess.getMessId() %>');" onMouseOver="show(this,'cz-bt-<%=mess.getMessId() %>');" id="mess-<%=mess.getMessId() %>" class="media">
  <div class="media-left">
    <a href="#">
      <img width="65px" class="media-object" 
      src="<%=user.getImg()%>"<%//获取该用户头像 %>
       alt="sss">
    </a>
  </div>
  <div class="media-body">
    <span class="media-heading">
    
    <%
    if(user.getId()==1){
        out.print("<span class=\"label label-danger\">SYS</span>");
    }else{
        out.print("<span class=\"label label-primary\">user</span>");
    }
    %>
    来自
    <a target="_blank" href="<%=basePath %>user/personal.jsp?tab=info&userid=<%=user.getId() %>">
    <%
    if(user.getName()==null || user.getName().length()==0){
        out.print(user.getEmail());
    }else{
        out.print(user.getName());
    }
    %>
    </a>，
    <%
	java.util.Date date=mess.getSendDate();
	SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String dateStr =myFmt.format(date);
	out.print(dateStr);
    %>
    </span>
    <div style="display:none" id="cz-bt-<%=mess.getMessId() %>">
    <button type="button" class="btn btn-xs btn-success"
	onclick="window.open('<%=basePath%>user/personal.jsp?tab=mess&handle=write&toemail=<%=user.getEmail()%>%20==>%20<%=user.getName()%>&userid=<%=me.getId()%>')">回复</button>
	<button type="button" class="btn btn-xs btn-danger"
	onclick="is_delete('is-bt-<%=mess.getMessId()%>')">删除此条消息</button>
    </div>
 
    <div style="display:none" id="is-bt-<%=mess.getMessId() %>">
	<button type="button" class="btn btn-xs btn-danger"
	onclick="delete_mess('<%=mess.getMessId() %>')">点此确认删除</button>
    </div>
 
    <pre><%
    if(user.getId()==1){
    	out.print(mess.getMessText());
    }else{
    	out.print(mess.getMessText().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
    }
    %></pre>
  </div>
</div>
<!-- end of 一条消息 -->

<%}%>
<nav>
  <ul class="pager">
    <li class=""><a class="page-cut-btn" href="user/personal.jsp?tab=mess&userid=<%=me.getId()%>&pn=<%=pn<=1?1:pn-1%>"><span aria-hidden="true"></span><%=pn>1?"上一页":"位于首页"%></a></li>
    <li style=""><span style="border:0">    　　第<span style="color:red;border:0"><%=pn %></span>页　　</span></li>
    <li class=""><a class="page-cut-btn" href="user/personal.jsp?tab=mess&userid=<%=me.getId()%>&pn=<%=pn>=maxPage?pn:pn+1%>"><%=pn<maxPage?"下一页":"位于末页"%><span aria-hidden="true"></span></a></li>
  </ul>
</nav>
<%}else{%>
<div class="alert alert-warning" role="alert">
你尚未收到任何消息，或已经到达最大页数！
</div>
<%}%>
<!-- end of 消息列表 -->
<%} else{ %>
<!-- 这里写消息发送页 -->
<div class="alert alert-warning" role="alert">
注意：消息发送成功后，对方将收到**站内消息**
</div>

<%
//提示
if(request.getParameter("info")!=null && !request.getParameter("info").equals("")){
%>
<div class="alert alert-warning" role="alert">
<%=request.getParameter("info") %>
</div>
<%}%>
<%
//邮箱自动填写
String toEmail="";
if(request.getParameter("toemail")!=null && !request.getParameter("toemail").equals("")){
    toEmail=request.getParameter("toemail");
}
%>

<form action="MessCheckServlet" method="post">
  <div class="form-group">
    <label for="InputEmail">发送给用户：</label>
    <input value="<%=toEmail%>" type="text" class="form-control" name="InputEmailToSend" placeholder="输入用户邮箱">
  </div>
  <div class="form-group">
    <label for="InputMess">消息正文：</label>
    <textarea rows="5" class="form-control" name="InputMess" placeholder="输入消息正文"></textarea>
  </div>
  <button type="submit" class="btn btn-default">发送</button>
</form>
<!-- end of 消息发送页 -->
<%} %>
	</div>
</div>

<script>
function show(obj,id1) {
	var objDiv = $("#"+id1+"");
	$(objDiv).css("display","inline");
}

function hide(obj,id1,id2) {
var objDiv = $("#"+id1+"");
$(objDiv).css("display", "none");
var objDiv2 = $("#"+id2+"");
$(objDiv2).css("display", "none");
}

function is_delete(id){
	var objDiv = $("#"+id+"");
	$(objDiv).css("display","inline");
}

function delete_mess(messid){
	xmlMess=new XMLHttpRequest();
	xmlMess.onreadystatechange=function()
	  {
	  if (xmlMess.readyState==4 && xmlMess.status==200)
	    {
	    if(xmlMess.responseText=="success")
	    	{
				//移除节点
		    	cnode = document.getElementById("mess-"+messid);
		    	cnode.parentNode.removeChild(cnode);
	    	}
	    }
	  }
	xmlMess.open("GET","RemoveMessServlet?messid="+messid+"&t="+Math.random(),true);
	xmlMess.send(null);
}
</script> 
<%
userHandle.close();
messHandle.close();
%>