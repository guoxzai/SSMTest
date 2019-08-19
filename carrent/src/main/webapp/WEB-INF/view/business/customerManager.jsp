<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>客户信息</title>
    
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
 <%@ include file="/loadingDiv.jsp"%>
<!-- 查询条件开始 -->
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'99.9%'">
	<form action="" id="searchFrm">
		<table width="100%" cellpadding="10" cellspacing="10">
			<tr>
				<td width="33%">
				 <input class="easyui-textbox" name="identity" data-options="prompt:'请输入身份证号',label:'身份证号:',labelAlign:'right',labelPosition:'left'" style="width:80%;">
				</td>
				<td  width="33%">
				 <input class="easyui-textbox" name="custname" data-options="prompt:'请输入客户姓名',label:'客户姓名:',labelAlign:'right',labelPosition:'left'" style="width:80%;">
				</td>
				<td  width="33%">
				 <input class="easyui-textbox" name="address" data-options="prompt:'请输入客户地址',label:'客户地址:',labelAlign:'right',labelPosition:'left'" style="width:80%;">
				</td>
			</tr>
			<tr>
				<td width="33%">
				 <input class="easyui-textbox" name="phone" data-options="prompt:'请输入客户电话',label:'客户电话:',labelAlign:'right',labelPosition:'left'" style="width:80%;">
				</td>
				<td  width="33%">
				 <input class="easyui-textbox" name="career" data-options="prompt:'请输入客户职位',label:'客户职位:',labelAlign:'right',labelPosition:'left'" style="width:80%;">
				</td>
				<td  width="33%">
				<label class="textbox-label" style="text-align: right;" >性别:</label>
                     <input class="easyui-radiobutton" name="sex" value="1">男 <span style="display:inline-block;width: 10px"></span>
                     <input class="easyui-radiobutton" name="sex" value="0">女
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
<table id="dg" class="easyui-datagrid"></table>  
<div id="tb">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="addCustomer" data-options="iconCls:'icon-add',plain:true">添加客户</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="updateCustomer" data-options="iconCls:'icon-edit',plain:true">修改客户</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="deleteCustomer" data-options="iconCls:'icon-remove',plain:true">删除客户</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="exportMsg" data-options="iconCls:'icon-print',plain:true">导出信息</a>
</div>
<!-- 数据表格结束-->
 
<!-- 添加  修改的弹出层开始 -->
<div class="easyui-dialog" id="dlg" data-options="title:'添加客户',iconCls:'icon-save',width:'600px',height:'400px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#dlg-buttons'">
<div class="easyui-panel" border="false" style="width:100%;padding:10px;">
	<form  method="post" id="dataFrm">
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="identity" name="identity" data-options="prompt:'请输入客户身份证号',label:'身份证号:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="custname" data-options="prompt:'请输入客户姓名',label:'客户姓名:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="address" data-options="prompt:'请输入客户地址',label:'客户地址:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="phone" data-options="prompt:'请输入客户联系方式',label:'联系方式:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
         <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="career" data-options="prompt:'请输入客户职位',label:'客户职位:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
        <div>
         <label class="textbox-label" style="text-align: right;" >性别:</label>
             <input class="easyui-radiobutton" name="sex" value="1">男 <span style="display:inline-block;width: 10px"></span>
             <input class="easyui-radiobutton" name="sex" value="0">女
        </div>
		</form>
	</div>
</div>
<div id="dlg-buttons" style="text-align: center;">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="doSubmit" data-options="iconCls:'icon-save'" style="width:80px">保存</a>
    <a href="javascript:void(0)" onclick="javascript:$('#dlg').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
</div>
<!-- 添加  修改的弹出层结束 -->
<script type="text/javascript">
	//初始化数据表格
	$("#dg").datagrid({
		width:'99.9%',
		height:400,
		title : '数据列表',
		rownumbers : true,
		singleSelect : true,
		url : '${gxz}/customer/loadAllCustomer.action',
		fitColumns : true,
		emptyMsg : '<font color=red>查无数据</font>',
		pagination : true,
		pagePosition : 'bottom',
		pageNumber : 1,
		pageSize : 10,
		pageList : [ 5, 10, 15, 20, 25 ],
		toolbar : '#tb',
		columns:[ [
		           {field:'identity',title:'身份证号',width:100,align:'center'},
		           {field:'custname',title:'客户姓名',width:100,align:'center'},
		           {field:'address',title:'客户地址',width:100,align:'center'},
		           {field:'phone',title:'联系方式',width:100,align:'center'},
		           {field:'sex',title:'客户性别',width:100,align:'center',formatter:function(value){
		               return value==1?'男':'女';
		           }},
		           {field:'career',title:'客户职位',width:100,align:'center'}
		       ] ],
		
	});
	
	$("#doSearch").click(function(){
		var params = $("#searchFrm").serialize();
		$("#dg").datagrid({
			url:'${gxz}/customer/loadAllCustomer.action?'+params
		});
	});
	
	//添加客户
	var url="";
	$("#addCustomer").click(function(){
		$("#dlg").dialog("open").dialog('setTitle','添加客户');
		$("#dataFrm").form("clear");
		$("#dataFrm").form("load",{sex:1});
		$("#identity").textbox("readonly",false);
		url="${gxz}/customer/addCustomer.action";
	});
	//修改客户
	$("#updateCustomer").click(function(){
	//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$("#dlg").dialog("open").dialog('setTitle','修改客户');
			$("#dataFrm").form("clear");
			$("#dataFrm").form("load",row);
			$("#identity").textbox("readonly",true);
			url="${gxz}/customer/updateCustomer.action";
		}else{
			$.messager.show({
				title:'提示',
				msg:'请选中操作行'
			});
		}
	});
	//保存
	$("#doSubmit").click(function(){
		$("#dataFrm").form("submit",{
			 url: url,
             onSubmit: function(){
                 return $(this).form('validate');//触发验证
             },
             success: function(result){
                //刷新表格
                $("#dg").datagrid("reload");
                //关闭弹出层
                $("#dlg").dialog("close");
                $.messager.show({
                    title:'提示',
                    msg:'操作成功'
                });
             }
		});
	});
	//删除客户
	$("#deleteCustomer").click(function(){
		//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$.messager.confirm('删除', '你确定要删除'+row.custname+'这个客户吗?', function(r){
				if (r){
					$.post("${gxz}/customer/deleteCustomer.action",{identity:row.identity},function(obj){
						 //刷新表格
		                $("#dg").datagrid("reload");
		                $.messager.show({
		                    title:'提示',
		                    msg:'操作成功'
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
	
	$("#exportMsg").click(function(){
		window.location.href="${gxz}/customer/exportCustomer.action";
	});
</script>
</body>
</html>
