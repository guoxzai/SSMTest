<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>车辆管理</title>
    
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
	<form action="" id="searchFrm">
		<table width="100%" style="padding: 20px" cellpadding="20px">
			<tr>
				<td width="33%">
				 <input class="easyui-textbox" name="rentid" data-options="prompt:'请输入出租单号',label:'出租单号:',labelAlign:'right',labelPosition:'left'" style="width:80%;">
				</td>
				<td  width="33%">
				 <input class="easyui-textbox" name="carnumber" data-options="prompt:'请输入车牌号',label:'车牌号:',labelAlign:'right',labelPosition:'left'" style="width:80%;">
				</td>
				<td  width="33%">
				 <input class="easyui-textbox" name="identity" data-options="prompt:'请输入身份证号',label:'身份证号:',labelAlign:'right',labelPosition:'left'" style="width:80%;">
				</td>
			</tr>
			<tr>
				<td width="33%">
				 <input class="easyui-datetimebox" name="begindate" data-options="prompt:'请输入起租时间',label:'起租时间:',labelAlign:'right',labelPosition:'left'" style="width:80%;">
				</td>
				<td  width="33%">
				 <input class="easyui-datetimebox" name="returndate" data-options="prompt:'请输入还车时间',label:'还车时间:',labelAlign:'right',labelPosition:'left'" style="width:80%;">
				</td>
				<td  width="33%">
				<label class="textbox-label" style="text-align: right;" >出租单状态:</label>
            		 <input class="easyui-radiobutton" name="rentflag" value="1">
            		 <label>已归还</label><span style="display:inline-block;width: 10px"></span>
            		 <input class="easyui-radiobutton" name="rentflag" value="0"><label>未归还</label>
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
	<a href="javascript:void(0)" class="easyui-linkbutton" id="updateRent" data-options="iconCls:'icon-edit',plain:true">修改出租单</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="deleteRent" data-options="iconCls:'icon-remove',plain:true">删除出租单</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="exportRent" data-options="iconCls:'icon-page-excel',plain:true">导出出租单</a>

</div>
<!-- 数据表格结束-->
<!-- 添加  修改的弹出层开始 -->
<div class="easyui-dialog" id="dlg" data-options="title:'添加车辆',iconCls:'icon-save',width:'600px',height:'500px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#dlg-buttons'">
	<div class="easyui-panel" border="false" style="width:100%;padding:10px;">
		<form  method="post" id="dataFrm" style="position: relative;" >
			<div style="margin-bottom:15px">
	            <input class="easyui-textbox" name="rentid" id="rentid" data-options="prompt:'请输入出租单号',label:'出租单号:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
	         <div style="margin-bottom:15px">
	            <input class="easyui-datetimebox" name="begindate" data-options="prompt:'选择出租开始时间',label:'开始时间:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
	        <div style="margin-bottom:15px">
	            <input class="easyui-datetimebox" name="returndate" data-options="prompt:'选择出租结束时间',label:'结束时间:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
	         <div style="margin-bottom:15px">
	            <input class="easyui-numberbox" name="price" data-options="prompt:'请输入出租价格',label:'出租价格:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
			 <div style="margin-bottom:15px">
	            <input class="easyui-textbox" name="carnumber" id="carnumber" data-options="prompt:'请输入车牌号',label:'车牌号:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
	         <div style="margin-bottom:15px">
	            <input class="easyui-textbox" name="identity" id="identity" data-options="prompt:'请输入客户身份证号',label:'身份证号:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
	        <div style="margin-bottom:15px">
	            <input class="easyui-textbox" name="opername" id="opername" data-options="prompt:'请输入操作员',label:'操作员:',labelAlign:'right',labelPosition:'left'" style="width:100%;">
	        </div>
	        <div>
	         <label class="textbox-label" style="text-align: right;" >归还状态:</label>
	             <input class="easyui-radiobutton" name="rentflag" value="1">已归还 <span style="display:inline-block;width: 10px"></span>
	             <input class="easyui-radiobutton" name="rentflag" value="0">未归还
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
		width:'99%',
		height:400,
		title : '数据列表',
		rownumbers : true,
		singleSelect : true,
		url : '${gxz}/rentCar/loadAllRent.action',
		fitColumns : true,
		emptyMsg : '<font color=red>查无数据</font>',
		pagination : true,
		pagePosition : 'bottom',
		pageNumber : 1,
		pageSize : 10,
		pageList : [ 5, 10, 15, 20, 25 ],
		toolbar : '#tb',
		columns:[ [
					{field:'rentid',title:'出租单号',width:200,align:'center'},
					{field:'identity',title:'身份证号',width:100,align:'center'},
					{field:'carnumber',title:'车牌号',width:100,align:'center'},
					{field:'price',title:'出租价格',width:100,align:'center'},
					{field:'begindate',title:'起租时间',width:100,align:'center'},
					{field:'returndate',title:'还车时间',width:100,align:'center'},
					{field:'rentflag',title:'出租单状态',width:100,align:'center',formatter:function(value){
						   return value==1?'<font color=blue>已归还</font>':'<font color=red>未归还</font>';
					}},
					{field:'opername',title:'操作员',width:100,align:'center'}
		       ] ]
	});
	
	$("#doSearch").click(function(){
		var params = $("#searchFrm").serialize();
		$("#dg").datagrid({
			url:'${gxz}/rentCar/loadAllRent.action?'+params
		});
	});
	
	//修改车辆
	$("#updateRent").click(function(){
	//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$("#dlg").dialog("open").dialog('setTitle','修改出租单');
			$("#dataFrm").form("clear");
			$("#dataFrm").form("load",row);
			$("#rentid").textbox("readonly",true);
			$("#begindate").textbox("readonly",true);
			$("#carnumber").textbox("readonly",true);
			$("#identity").textbox("readonly",true);
			$("#opername").textbox("readonly",true);
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
			 url: '${gxz}/rentCar/updateRent.action',
             onSubmit: function(){
                 return $(this).form('validate');//触发验证
             },
             success: function(result){
            	 console.log(result);
                //刷新表格
                $("#dg").datagrid("reload");
                //关闭弹出层
                $("#dlg").dialog("close");
                $.messager.show({
                    title:'提示',
                    msg:result.msg
                });
             }
		});
	});
	//删除车辆
	$("#deleteRent").click(function(){
		//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$.messager.confirm('删除', '你确定要删除'+row.rentid+'这个车辆吗?', function(r){
				if (r){
					$.post("${gxz}/rentCar/deleteRent.action",{rentid:row.rentid,carnumber:row.carnumber},function(obj){
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
	
	$("#exportRent").click(function(){
		var row=$("#dg").datagrid("getSelected");
		if(row){
			window.location.href="${gxz}/rentCar/exportRent.action?rentid="+row.rentid;
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
