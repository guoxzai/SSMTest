<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginInfoManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${gxz }/resources/easyui/themes/metro/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${gxz }/resources/css/wu.css" />
	<link rel="stylesheet" type="text/css" href="${gxz }/resources/css/icon.css" />
	<script type="text/javascript" src="${gxz }/resources/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${gxz }/resources/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${gxz }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body>
<!-- 查询条件开始 -->
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'99%'">
	<form action="" id="searchFrm">
		<table width="100%" cellpadding="10" cellspacing="10">
			<tr>
				<td width="50%" align="center">
				 <input class="easyui-textbox" name="loginname" data-options="prompt:'请输入用户名',label:'用户名:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td  width="50%" align="center">
				 <input class="easyui-textbox" name="loginip" data-options="prompt:'请输入用户IP地址',label:'用户IP:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
			</tr>
			<tr>
				<td width="50%" align="center">
				 <input class="easyui-datetimebox" name="startTime" data-options="prompt:'请输入开始时间',label:'开始时间:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td  width="50%" align="center">
				 <input class="easyui-datetimebox" name="endTime" data-options="prompt:'请输入结束时间',label:'结束时间:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
			</tr>
			<tr>
				<td align="center" colspan="3">
					<a href="javascript:void(0)" class="easyui-linkbutton" id="doSearch" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
                    <a href="javascript:void(0)" onclick="javascript:$('#searchFrm').form('reset')" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">重置</a>
				</td>
			</tr>
		</table>
	</form>
</div>
<div style="height: 2px"></div>
<!-- 查询条件结束 -->
 
<!-- 数据表格开始 -->
<table id="dg" class="easyui-datagrid" ></table>  
<div id="tb">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="deleteLoginInfo" data-options="iconCls:'icon-remove',plain:true">删除记录</a>
</div>
<!-- 数据表格结束-->
<script type="text/javascript">
	//初始化数据表格
	$("#dg").datagrid({
		width:'99%',
		height:500,
		title : '数据列表',
		rownumbers : true,
		singleSelect : true,
		url : '${gxz}/logInfo/loadAllLoginInfo.action',
		fitColumns : true,
		emptyMsg : '<font color=red>查无数据</font>',
		pagination : true,
		pagePosition : 'bottom',
		pageNumber : 1,
		pageSize : 10,
		pageList : [ 5, 10, 15, 20, 25 ],
		toolbar : '#tb',
		columns:[ [
		           {field:'id',title:'编号',width:100,align:'center'},
		           {field:'loginname',title:'用户名',width:100,align:'center'},
		           {field:'loginip',title:'用户IP',width:100,align:'center'},
		           {field:'logintime',title:'登陆时间',width:100,align:'center'}
		       ] ]
    });
    
	$("#doSearch").click(function(){
		var params = $("#searchFrm").serialize();
		$("#dg").datagrid({
			url:'${gxz}/logInfo/loadAllLoginInfo.action?'+params
		});
	});
	
	
	//删除用户记录
	$("#deleteLoginInfo").click(function(){
		//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$.messager.confirm('删除', '你确定要删除'+row.loginname+'这个用户记录吗?', function(r){
				if (r){
					$.post("${gxz}/logInfo/deleteLoginInfo.action",{id:row.id},function(obj){
						 //刷新表格
		                $("#dg").datagrid("reload");
		                $.messager.show({
		                    title:'提示',
		                    msg:obj.msg
		                });
					});
				}
			});
		}else{
			$.messager.show({
				title:'提示',
				msg:'请选中操作行'
			});
		}
	});

</script>
</body>


</html>
