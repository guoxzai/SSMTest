<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkManager.jsp' starting page</title>
    
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
	<script type="text/javascript" src="${gxz }/resources/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${gxz }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
  </head>
  
 <body>
 <!-- 查询条件开始 -->
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'99%'">
	<form action="" id="searchFrm" >
		<table width="100%" cellpadding="10" cellspacing="10">
			<tr>
				<td width="33%" style="text-align: center;">
				 <input class="easyui-textbox" name="checkid" data-options="prompt:'请输入检查单号',label:'检查单号:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td  width="33%" style="text-align: center;">
				 <input class="easyui-textbox" name="rentid" data-options="prompt:'请输入出租单号',label:'出租单号:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td  width="33%" style="text-align: center;">
				 <input class="easyui-textbox" name="problem" data-options="prompt:'请输入存在问题',label:'存在问题:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
			</tr>
			<tr>
				<td width="33%" style="text-align: center;">
				 <input class="easyui-datetimebox" name="startTime" data-options="prompt:'请输入开始时间',label:'开始时间:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td width="33%" style="text-align: center;">
				 <input class="easyui-datetimebox" name="endTime" data-options="prompt:'请输入结束时间',label:'结束时间:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td width="33%" style="text-align: center;">
				 <input class="easyui-textbox" name="checkdesc" data-options="prompt:'请输入问题描述',label:'问题描述:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
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
	<a href="javascript:void(0)" class="easyui-linkbutton" id="updateCheck" data-options="iconCls:'icon-edit',plain:true">修该检查单</a>
</div>
<!-- 数据表格结束-->
<!-- 添加  修改的弹出层开始 -->
<div class="easyui-dialog" id="dlg" data-options="title:'修改检查单',iconCls:'icon-save',width:'600px',height:'500px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#dlg-buttons'">
<div class="easyui-panel" border="false" style="width:100%;padding:30px;text-align: center;">
	<form  method="post" id="dataFrm">
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="checkid" name="checkid" readonly data-options="prompt:'请输入检查单号',label:'检查单号:',labelAlign:'right',labelPosition:'left',required:true" style="width:90%;">
        </div>
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="checkdate" readonly data-options="prompt:'请输入检查日期',label:'检查日期:',labelAlign:'right',labelPosition:'left',required:true" style="width:90%;">
        </div>
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="problem" data-options="prompt:'请输入存在问题',label:'存在问题:',labelAlign:'right',labelPosition:'left',required:true" style="width:90%;">
        </div>
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="checkdesc" data-options="prompt:'请输入问题描述',label:'问题描述:',labelAlign:'right',labelPosition:'left',required:true" style="width:90%;">
        </div>
         <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="paymoney" data-options="prompt:'请输入赔付金额',label:'赔付金额:',labelAlign:'right',labelPosition:'left',required:true" style="width:90%;">
        </div>
         <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="rentid" readonly data-options="prompt:'请输入出租单号',label:'出租单号:',labelAlign:'right',labelPosition:'left',required:true" style="width:90%;">
        </div>
         <div>
            <input class="easyui-textbox" name="opername" readonly data-options="prompt:'请输入操作员',label:'操作员:',labelAlign:'right',labelPosition:'left'" style="width:90%;">
        </div>
	</div>
</div>
<div id="dlg-buttons" style="text-align: right;">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="doSubmit" data-options="iconCls:'icon-ok'" style="width:80px">保存</a>
    <a href="javascript:void(0)" onclick="javascript:$('#dlg').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
</div>
<!-- 添加  修改的弹出层结束 -->

<script type="text/javascript">
	//初始化数据表格
	$("#dg").datagrid({
		width:'99%',
		height:400,
		title : '检查单查询',
		rownumbers : true,
		singleSelect : true,
		url : '${gxz}/check/loadAllCheck.action',
		fitColumns : true,
		emptyMsg : '<font color=red>查无数据</font>',
		pagination : true,
		pagePosition : 'bottom',
		pageNumber : 1,
		pageSize : 10,
		pageList : [ 5, 10, 15, 20, 25 ],
		toolbar : '#tb',
		columns:[ [
		           {field:'checkid',title:'检查单号',width:120,align:'center'},
		           {field:'checkdate',title:'检查日期',width:100,align:'center'},
		           {field:'problem',title:'存在问题',width:100,align:'center'},
		           {field:'checkdesc',title:'问题描述',width:100,align:'center'},
		           {field:'paymoney',title:'赔付金额',width:100,align:'center'},
		           {field:'rentid',title:'出租单号',width:120,align:'center'},
		           {field:'opername',title:'操作员',width:100,align:'center'},
		       ] ],
	});
	$("#doSearch").click(function(){
		var params = $("#searchFrm").serialize();
		$("#dg").datagrid({
			url:'${gxz}/check/loadAllCheck.action?'+params
		});
	});
	
	//修改车辆
	$("#updateCheck").click(function(){
	//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$("#dlg").dialog("open").dialog('setTitle','修改检查单');
			$("#dataFrm").form("clear");
			$("#dataFrm").form("load",row);
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
			 url:"${gxz}/check/updateCheck.action",
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
                    msg:"操作成功"
                });
             }
		});
	});
</script>
 </body>
</html>

