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
<div class="easyui-panel" style="text-align: center;padding: 20px" data-options="title:'查询条件',iconCls:'icon-search',width:'99%'">
	<input class="easyui-searchbox" id="seach_identity" data-options="prompt:'请输入客户身份证号',label:'客户身份证号:',labelAlign:'right',searcher:doSearch" style="width:50%">
</div>
<div style="height: 2px"></div>
<!-- 查询条件结束 -->
 
<!-- 数据表格开始 -->
<div id="content"> 
	<table id="dg" class="easyui-datagrid"></table>  
	<div id="tb">
		<a href="javascript:void(0)" class="easyui-linkbutton" id="toAddCar" data-options="iconCls:'icon-add',plain:true">出租车辆</a>
	
	</div>
</div>

<!-- 数据表格结束-->
<!-- 添加  修改的弹出层开始 -->
<div class="easyui-dialog" id="dlg" data-options="title:'出租车辆',iconCls:'icon-save',width:'600px',height:'450px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#dlg-buttons'">
<div class="easyui-panel" border="false" style="width:100%;padding:20px;">
	<form  method="post" id="dataFrm" style="position: relative;" >
			<div style="margin-bottom:10px">
	            <input class="easyui-textbox" name="rentid" id="rentid" data-options="prompt:'请输入出租单号',label:'出租单号:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
	         <div style="margin-bottom:10px">
	            <input class="easyui-datetimebox" name="begindate" data-options="prompt:'选择出租开始时间',label:'开始时间:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
	        <div style="margin-bottom:10px">
	            <input class="easyui-datetimebox" name="returndate" data-options="prompt:'选择出租结束时间',label:'结束时间:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
	         <div style="margin-bottom:10px">
	            <input class="easyui-numberbox" name="price" data-options="prompt:'请输入出租价格',label:'出租价格:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
			 <div style="margin-bottom:10px">
	            <input class="easyui-textbox" name="carnumber" id="carnumber" data-options="prompt:'请输入车牌号',label:'车牌号:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
	         <div style="margin-bottom:10px">
	            <input class="easyui-textbox" name="identity" id="identity" data-options="prompt:'请输入客户身份证号',label:'身份证号:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
	        </div>
	        <div style="margin-bottom:10px">
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
	<a href="javascript:void(0)" class="easyui-linkbutton" id="doSubmit" data-options="iconCls:'icon-save'" style="width:80px">出租</a>
    <a href="javascript:void(0)" onclick="javascript:$('#dlg').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
</div>
<!-- 添加  修改的弹出层结束 -->

<script type="text/javascript">

	$("#content").hide();

	
	function initDtagrid(){
		//初始化数据表格
		$("#dg").datagrid({
			width:'99.9%',
			height:400,
			title : '数据列表',
			rownumbers : true,
			singleSelect : true,
			url : '${gxz}/car/loadAllCar.action?isrenting=0',
			fitColumns : true,
			emptyMsg : '<font color=red>查无数据</font>',
			pagination : true,
			pagePosition : 'bottom',
			pageNumber : 1,
			pageSize : 10,
			pageList : [ 5, 10, 15, 20, 25 ],
			toolbar : '#tb',
			columns:[ [
			           {field:'carnumber',title:'车辆证号',width:100,align:'center'},
			           {field:'cartype',title:'车辆类型',width:100,align:'center'},
			           {field:'color',title:'车辆颜色',width:100,align:'center'},
			           {field:'isrenting',title:'出租状态',width:100,align:'center',formatter:function(value){
			               return value==1?'<font color=red>已出租</font>':'<font color=green>未出租</font>';
			           }},
			           {field:'price',title:'购买价格',width:100,align:'center'},
			           {field:'rentprice',title:'出租价格',width:100,align:'center'},
			           {field:'deposit',title:'出租押金',width:100,align:'center'},
			           {field:'description',title:'车辆描述',width:100,align:'center'}
			       ] ],
			view:detailview,
			detailFormatter: function(rowIndex, rowData){ //rowIndex索引     rowData 代表当前行的json对象
	              return '<img src="${gxz}/'+rowData.carimg+'" width=150 height=120 />'; 
	        }
		});
	}
	
	function doSearch(value){
		$.post("${gxz}/customer/customerisExist.action",{identity:value},function(obj){
			if(obj.flag){
				$("#content").show();
				initDtagrid();
			}else{
				$("#content").hide();
				 $.messager.show({
	                    title:'提示',
	                    msg:'客户信息不存在'
	              });
			}
		});
	}
	    
	//添加车辆
	$("#toAddCar").click(function(){
		
		var row=$("#dg").datagrid("getSelected");
		
		if(row){
			$("#dlg").dialog("open").dialog('setTitle','车辆出租');
			$("#dataFrm").form("clear");
			$("#rentid").textbox("readonly",true);
			$("#identity").textbox("readonly",true);
			$("#carnumber").textbox("readonly",true);
			$("#opername").textbox("readonly",true);
			
			$.post("${gxz}/rentCar/initRentCarFrm.action",{
				identity:$("#seach_identity").val(),
				carnumber:row.carnumber,
				price:row.rentprice
			},function(data){
				$("#dataFrm").form("load",data);
			});
			
		}else{
			$.messager.show({
                title:'提示',
                msg:'请选中要出租的车辆'
            });
		}
		
	});
	//保存
	$("#doSubmit").click(function(){
		$("#dataFrm").form("submit",{
			 url: "${gxz}/rentCar/addRent.action",
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
                    msg:'车辆出租成功'
                });
             }
		});
	});
</script>
</body>
</html>
