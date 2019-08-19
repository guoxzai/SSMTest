<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>系统首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="${gxz }/resources/easyui/themes/material/easyui.css" />
<link rel="stylesheet" type="text/css" href="${gxz }/resources/css/wu.css" />
<link rel="stylesheet" type="text/css" href="${gxz }/resources/css/icon.css" />
<script type="text/javascript" src="${gxz }/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${gxz }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>

  </head>
  
  <body>
  		<div  class="easyui-layout" style="width: 100%;height: 400px">
   		<!-- 系统公告 开始-->
   			<div class="easyui-panel" style="width: 70%" data-options="region:'center',iconCls:'icon-ok',split:true,border:true,title:'系统公告'">
   				<table id="dg" class="easyui-datagrid"></table>  
   			</div>
   		<!-- 系统公告 结束-->
   		
   		<!-- 日历 开始-->
   		<div class="easyui-panel" style="width: 30%" data-options="region:'east',iconCls:'icon-save',split:true,border:true,title:'系统公告'">
   			<div id="cc" class="easyui-calendar" data-options="border:false" style="width:100%;height:100%;"></div>
   		</div>
   		<!-- 日历 结束-->
   		</div>
   		
   		<div id="dlg" class="easyui-dialog" style="width:1000px;height: 600px"
		data-options="closed:true,modal:true,border:'thin',collapsible:true,minimizable:true,maximizable:true,closable:true">
			<form id="fm" method="post" novalidate
				style="margin:0;padding:20px 50px">
				<div style="margin-bottom:10px">
					<div id="title"
						style="text-align: center;font-size: 25px;font-weight: bold;"></div>
				</div>
				<hr>
				<div style="margin-bottom:10px;text-align: right;">
					发布人:<span id="opername" style="margin-right: 30px"></span>  发布时间:<span id="createtime"></span>
				</div>
				<hr>
				<div style="margin-bottom:10px;">
					<div id="content"></div>
				</div>
			</form>
		</div>
   		<script type="text/javascript">
		   	    $('#cc').calendar({
		   	    	onSelect: function(date){
		   	    		$.post('${gxz}/news/queryNewsByTime.action',{createtime:date},function(data){
		   	    			
		   	    		});
		   	    	}
		   	    });	
		   	    
		   		$("#dg").datagrid({
		   			width:'100%',
		   			height:360,
		   			rownumbers : true,
		   			singleSelect : true,
		   			url : '${gxz}/news/loadAllNews.action',
		   			fitColumns : true,
		   			emptyMsg : '<font color=red>查无数据</font>',
		   			pagination : true,
		   			pagePosition : 'bottom',
		   			pageNumber : 1,
		   			pageSize : 10,
		   			pageList : [ 5, 10, 15, 20, 25 ],
		   			toolbar : '#tb',
		   			columns:[ [
		   			           {field:'id',hidden:true},
		   			           {field:'title',title:'新闻标题',width:100,align:'center'},
		   			           {field:'createtime',title:'发布时间',width:100,align:'center'},
		   			           {field:'opername',title:'发布人',width:100,align:'center'},
		   			] ],
		   		});
		   		
		   		$('#dg').datagrid({
		   			onDblClickRow:function(rowIndex,rowData){
		   				$.post('${gxz}/news/queryNewsById.action',{id:rowData.id},function(data){
		   					$("#dlg").dialog("open").dialog("setTitle","新闻内容");
		   					$("#title").html(data.title);
		   					$("#opername").html(data.opername);
		   					$("#content").html(data.content);
		   					$("#createtime").html(data.createtime);
		   				});
		   			}
		   		});
   		</script>
  </body>
</html>
