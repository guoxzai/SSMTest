<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>菜单管理</title>
    
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
	
	<link rel="stylesheet" href="${gxz }/resources/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script type="text/javascript" src="${gxz }/resources/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${gxz }/resources/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${gxz }/resources/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${gxz }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript" src="${gxz }/resources/zTree/js/jquery.ztree.core.js"></script>
  </head>
 
  <body>
  	 <div class="easyui-layout" style="width:99%;height:800px">
  	<div class="easyui-panel" data-options="region:'west',iconCls:'icon-node-tree32',title:'菜单树',split:false,width:'15%'">
  		<div id="treeMenus" class="ztree"></div>
  	</div>
  	<div class="easyui_panel" data-options="region:'center',title:'菜单列表',split:false,width:'85%'" style="text-align: center;">
  		<!-- 数据表格开始 -->
		<table id="dg"></table>  
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton" id="addMenu" data-options="iconCls:'icon-add',plain:true">添加菜单</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" id="updateMenu" data-options="iconCls:'icon-edit',plain:true">修改菜单</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" id="deleteMenu" data-options="iconCls:'icon-remove',plain:true">删除菜单</a>
		</div>
		<!-- 数据表格结束-->
		 
		<!-- 添加  修改的弹出层开始 -->
		<div class="easyui-dialog" id="dlg" data-options="title:'添加菜单',iconCls:'icon-save',width:'600px',height:'468px'
		,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
		modal:true,draggable:true,
		buttons:'#dlg-buttons'">
		<div class="easyui-panel" border="false" style="width:100%;padding:10px;">
			<form  method="post" id="dataFrm">
				 <div style="margin-bottom:10px">
		            <input class="easyui-combotree" id="pid" name="pid" data-options="url:'${gxz }/menu/loadComboTreeJson.action',method:'get',prompt:'请选择父级菜单',label:'父级菜单:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
		        </div>
				 <div style="margin-bottom:10px">
		            <input class="easyui-textbox" name="name" data-options="prompt:'请输入菜单名称',label:'菜单名称:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
		        </div>
				 <div style="margin-bottom:10px">
		            <input class="easyui-textbox" name="href" data-options="prompt:'请输入菜单地址',label:'菜单地址:',labelAlign:'right',labelPosition:'left'" style="width:100%;">
		        </div>
				 <div style="margin-bottom:10px">
		            <input class="easyui-textbox" name="icon" data-options="prompt:'请输入菜单图标',label:'菜单图标:',labelAlign:'right',labelPosition:'left'" style="width:100%;">
		        </div>
		         <div style="margin-bottom:10px">
		            <input class="easyui-textbox" name="tabicon" data-options="prompt:'请输入TAB图标',label:'TAB图标:',labelAlign:'right',labelPosition:'left'" style="width:100%;">
		        </div>
		         <div style="margin-bottom:10px">
		            <input class="easyui-textbox" name="target" data-options="prompt:'请输入TARGET',label:'TARGET:',labelAlign:'right',labelPosition:'left'" style="width:100%;">
		        </div>
		        <div style="margin-bottom:10px">
		         <label class="textbox-label" style="text-align: right;" >是否是父节点:</label>
		             <input class="easyui-radiobutton" name="parent" value="1">是 <span style="display:inline-block;width: 10px"></span>
		             <input class="easyui-radiobutton" name="parent" value="0">否
		        </div>
		          <div style="margin-bottom:10px">
		         <label class="textbox-label" style="text-align: right;" >是否展开:</label>
		             <input class="easyui-radiobutton" name="open" value="1">是<span style="display:inline-block;width: 10px"></span>
		             <input class="easyui-radiobutton" name="open" value="0">否
		        </div>
		        <div>
		         <label class="textbox-label" style="text-align: right;" >是否可用:</label>
		             <input class="easyui-radiobutton" name="available" value="1">是<span style="display:inline-block;width: 10px"></span>
		             <input class="easyui-radiobutton" name="available" value="0">否
		        </div>
				</form>
			</div>
		</div>
		<div id="dlg-buttons" style="text-align: right;">
			<a href="javascript:void(0)" class="easyui-linkbutton" id="doSubmit" data-options="iconCls:'icon-ok'" style="width:80px">保存</a>
		    <a href="javascript:void(0)" onclick="javascript:$('#dlg').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
		</div>
		<!-- 添加  修改的弹出层结束 -->
  	</div>
  </div>
  </body>
  <script type="text/javascript">
//初始化数据表格
	$("#dg").datagrid({
		width:'99.9%',
		height:750,
		rownumbers : true,
		singleSelect : true,
		url : '${gxz}/menu/loadAllMenuData.action',
		fitColumns : true,
		emptyMsg : '<font color=red>查无数据</font>',
		pagination : true,
		pagePosition : 'bottom',
		pageNumber : 1,
		pageSize : 20,
		pageList : [ 5, 10, 20,25, 30, 40 ],
		toolbar : '#tb',
		columns:[ [
		           {field:'id',title:'菜单编号',width:80,align:'center'},
		           {field:'pid',title:'父节点ID',width:80,align:'center'},
		           {field:'name',title:'菜单名称',width:150,align:'center'},
		           {field:'href',title:'菜单地址',width:200,align:'center'},
		           {field:'open',title:'是否展开',width:80,align:'center',formatter:function(value){
		        	   return value==1?'<font color=blue>展开</font>':'<font color=red>不展开</font>';
		           }},
		           {field:'parent',title:'是否父节点',width:100,align:'center',formatter:function(value){
		        	   return value==1?'<font color=blue>是</font>':'<font color=red>否</font>';
		           }},
		           {field:'icon',title:'图标',width:100,align:'center',formatter:function(value){
		        	   return "<img src="+value+" />"+value;
		           }},
		           {field:'tabicon',title:'TAB图标',width:100,align:'center'},
		           {field:'available',title:'是否可用',width:100,align:'center',formatter:function(value){
		        	   return value==1?'<font color=blue>可用</font>':'<font color=red>不可用</font>';
		           }},
		           {field:'target',title:'TARGET',width:100,align:'center'}
		       ] ],
		
	});
  
	  	function zTreeOnClick(event, treeId, treeNode) {
	    	$("#dg").datagrid({
				url:'${gxz}/menu/loadAllMenuData.action?id='+treeNode.id
			});
		};
		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: zTreeOnClick
			}
		};
		
		function initMenuTree(){
			$.post("${gxz}/menu/loadMenuManagerTree.action",function(zNodes){
				$.fn.zTree.init($("#treeMenus"), setting, zNodes);
			});
		}
		initMenuTree();
	/* 	$(document).ready(function(){
			$.post("${gxz}/menu/loadMenuManagerTree.action",function(zNodes){
				$.fn.zTree.init($("#treeMenus"), setting, zNodes);
			});
		}); */
		
		//添加菜单
		var url="";
		$("#addMenu").click(function(){
			$("#dlg").dialog("open").dialog('setTitle','添加菜单');
			$("#dataFrm").form("clear");
			$("#dataFrm").form("load",{parent:0,open:0,available:1});
			url="${gxz}/menu/addMenu.action";
		});
		//修改菜单
		$("#updateMenu").click(function(){
		//得到选中行
			var row=$("#dg").datagrid("getSelected");
			if(row){
				$("#dlg").dialog("open").dialog('setTitle','修改菜单');
				$("#dataFrm").form("clear");
				$("#dataFrm").form("load",row);
				url="${gxz}/menu/updateMenu.action?id="+row.id;
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
	                initMenuTree();
	                $("#pid").combotree("reload");
	                $.messager.show({
	                    title:'提示',
	                    msg:'操作成功'
	                });
	             }
			});
		});
		//删除菜单
		$("#deleteMenu").click(function(){
			//得到选中行
			var row=$("#dg").datagrid("getSelected");
			if(row){
				$.messager.confirm('删除', '你确定要删除'+row.name+'这个菜单吗?', function(r){
					if (r){
						$.post("${gxz}/menu/deleteMenu.action",{id:row.id},function(obj){
							 //刷新表格
			                $("#dg").datagrid("reload");
			                initMenuTree();
			                $("#pid").combotree("reload");
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
  	</script>
</html>
