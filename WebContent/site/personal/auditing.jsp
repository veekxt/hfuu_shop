<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="panel panel-info">
<div class="panel-heading">
<%
	out.println("审核商品");
%>
</div>
<div class="panel-body">
<table class="table table-striped" >
  <tr>
  <th class="td-user-name" style="width:10%;">
姓名
  </th>
    <th class="td-user-name" style="width:15%;">
物品名
  </th>
    <th class="td-user-name" style="width:20%;">
详情
  </th>
      <th class="td-user-name" style="width:15%;">
操作
  </th>
  </tr>
  <tr>
  	<td class="td-user-name">
  	谢涛
  	</td>
  	<td class="td-name">
  	野生蛤蟆
  	</td>
  	  	<td>
  	<abbr title="付款就
  	
  	
就发货地恢复苏杭的覅配方牛和覅速回地批发你看的时间房价会USD房间内的减肥不就\n是不复读巨神兵复合素的房价似乎对方的框架房你师父是对方就能上看到就会发卡号是豆腐皮和啤酒能付款了环保的皮肤和家人能立刻恢复和配送费多少技能覅普惠的反对四但开发工具是南方科技表示的基本覅诶办法" 
  	class="initialism">HTML</abbr>
  	</td>
  	<td>
<div class="btn-group btn-group-sm" role="group">
  <button type="button" class="btn btn-success">通过</button>
  <button type="button" class="btn btn-danger">拒绝</button>
</div>
  	</td>
  </tr>
</table>

</div>
</div>