<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>角色信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${gxz }/resources/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${gxz }/resources/easyui/themes/metro/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${gxz }/resources/css/wu.css" />
	<link rel="stylesheet" type="text/css" href="${gxz }/resources/css/icon.css" />
	<script type="text/javascript" src="${gxz }/resources/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${gxz }/resources/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${gxz }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript" src="${gxz }/resources/zTree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${gxz }/resources/zTree/js/jquery.ztree.excheck.min.js"></script>
  </head>
  
 <body>
 
<!-- 查询条件开始 -->
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'99.9%'">
	<form action="" id="searchFrm">
		<table width="100%" cellpadding="10" cellspacing="10">
			<tr align="center">
				<td width="33%">
				 <input class="easyui-textbox" name="rolename" data-options="prompt:'请输入角色名称',label:'角色名称:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				</td>
				<td  width="33%">
				 <input class="easyui-textbox" name="roledesc" data-options="prompt:'请输入角色备注',label:'角色备注:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				</td>
				<td  width="33%">
				<label class="textbox-label" style="text-align: right;" >是否可用:</label>
                     <input class="easyui-radiobutton" name="available" value="1">是<span style="display:inline-block;width: 10px"></span>
                     <input class="easyui-radiobutton" name="available" value="0">否
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
<table id="dg"></table>  
<div id="tb">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="addRole" data-options="iconCls:'icon-add',plain:true">添加角色</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="updateRole" data-options="iconCls:'icon-edit',plain:true">修改角色</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="deleteRole" data-options="iconCls:'icon-remove',plain:true">删除角色</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="selectMenu" data-options="iconCls:'icon-group',plain:true">分配菜单</a>
</div>
<!-- 数据表格结束-->
 
<!-- 添加  修改的弹出层开始 -->
<div class="easyui-dialog" id="dlg" data-options="title:'添加角色',iconCls:'icon-save',width:'600px',height:'300px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#dlg-buttons'">
<div class="easyui-panel" border="false" style="width:100%;padding:20px;">
	<form  method="post" id="dataFrm">
		 <div style="margin-bottom:25px">
            <input class="easyui-textbox" id="rolename" name="rolename" data-options="prompt:'请输入角色名称',label:'角色名称:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
		 <div style="margin-bottom:25px">
            <input class="easyui-textbox" name="roledesc" data-options="prompt:'请输入角色备注',label:'角色备注:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
        <div>
         <label class="textbox-label" style="text-align: right;" >是否可用:</label>
             <input class="easyui-radiobutton" name="available" value="1">是 <span style="display:inline-block;width: 10px"></span>
             <input class="easyui-radiobutton" name="available" value="0">否
        </div>
		</form>
	</div>
</div>
<div id="dlg-buttons" style="text-align: center;">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="doSubmit" data-options="iconCls:'icon-save'" style="width:80px">保存</a>
    <a href="javascript:void(0)" onclick="javascript:$('#dlg').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
</div>
<!-- 添加  修改的弹出层结束 -->

<!-- 添加  角色分配的弹出层开始 -->
<div class="easyui-dialog" id="dlg-menu" data-options="title:'分配菜单',iconCls:'icon-group',width:'600px',height:'460px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#dlg-menu-buttons'">
	<div id="treeMenus" class="ztree"></div>
</div>
<div id="dlg-menu-buttons" style="text-align: center;">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="saveRoleMenu" data-options="iconCls:'icon-save'" style="width:120px">分配菜单</a>
    <a href="javascript:void(0)" onclick="javascript:$('#dlg-menu').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
</div>
<!-- 添加  角色分配的弹出层结束 -->

<script type="text/javascript">
	//初始化数据表格
	$("#dg").datagrid({
		width:'99%',
		height:400,
		title : '数据列表',
		rownumbers : true,
		singleSelect : true,
		url : '${gxz}/role/loadAllRole.action',
		fitColumns : true,
		emptyMsg : '<font color=red>查无数据</font>',
		pagination : true,
		pagePosition : 'bottom',
		pageNumber : 1,
		pageSize : 10,
		pageList : [ 5, 10, 15, 20, 25 ],
		toolbar : '#tb',
		columns:[ [
		           {field:'roleid',title:'角色编号',width:100,align:'center'},
		           {field:'rolename',title:'角色名字',width:100,align:'center'},
		           {field:'roledesc',title:'角色备注',width:100,align:'center'},
		           {field:'available',title:'是否可用',width:100,align:'center',formatter:function(value){
		               return value==1?'<font color=green>是</font>':'<font color=red>否</font>';
		           }},
		       ] ],
		
	});
	
	$("#doSearch").click(function(){
		var params = $("#searchFrm").serialize();
		$("#dg").datagrid({
			url:'${gxz}/role/loadAllRole.action?'+params
		});
	});
	
	//添加角色
	var url="";
	$("#addRole").click(function(){
		$("#dlg").dialog("open").dialog('setTitle','添加角色');
		$("#dataFrm").form("clear");
		$("#dataFrm").form("load",{available:1});
		url="${gxz}/role/addRole.action";
	});
	//修改角色
	$("#updateRole").click(function(){
	//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$("#dlg").dialog("open").dialog('setTitle','修改角色');
			$("#dataFrm").form("clear");
			$("#dataFrm").form("load",row);
			url="${gxz}/role/updateRole.action?roleid="+row.roleid;
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
	//删除角色
	$("#deleteRole").click(function(){
		//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$.messager.confirm('删除', '你确定要删除'+row.rolename+'这个角色吗?', function(r){
				if (r){
					$.post("${gxz}/role/deleteRole.action",{roleid:row.roleid},function(obj){
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
	
	/***************分配菜单*****************/
	var setting = {
		data: {
			simpleData: {
				enable: true
			}
		},check: {
			enable: true
		}
	};
	
	function initRoleMenuTree(roleid){
		$.post("${gxz}/role/loadRoleMenuTree.action?roleid="+roleid,function(zNodes){
			$.fn.zTree.init($("#treeMenus"), setting, zNodes);
		});
	}
	
	$("#selectMenu").click(function(){
		var row = $("#dg").datagrid("getSelected");		
		if(row){
			$("#dlg-menu").dialog("open").dialog("setTitle",'分配【'+row.rolename+'】的菜单');
			initRoleMenuTree(row.roleid);
		}else{
			$.messager.show({
				title:'提示',
				msg:'请选中操作行'
			});
		}
	});
	
	$("#saveRoleMenu").click(function(){
		var row = $("#dg").datagrid("getSelected");	
		var roleid = row.roleid;
		var treeObj = $.fn.zTree.getZTreeObj("treeMenus");
		var nodes = treeObj.getCheckedNodes(true);
		
		var params = "roleid="+roleid;
		for(var i=0;i<nodes.length;i++){
			params += "&ids="+nodes[i].id;			
		}
		$.post("${gxz}/role/saveRoleMenu.action?"+params,function(obj){
			$.messager.show({
				title : '提示',
				msg : obj.msg
			});
		},"json");
	});
</script>
</body>
</html>
