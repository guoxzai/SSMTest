<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户信息</title>
    
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
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'99.9%'">
	<form action="" id="searchFrm">
		<table width="100%" cellpadding="10" cellspacing="10">
			<tr align="center">
				<td width="33%">
				 <input class="easyui-textbox" name="identity" data-options="prompt:'请输入身份证号',label:'身份证号:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				</td>
				<td  width="33%">
				 <input class="easyui-textbox" name="loginname" data-options="prompt:'请输入登录名称',label:'登录名称:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				</td>
				<td  width="33%">
				 <input class="easyui-textbox" name="realname" data-options="prompt:'请输入真实姓名',label:'真实姓名:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				</td>
			</tr>
			<tr align="center">
				<td width="33%">
				 <input class="easyui-textbox" name="address" data-options="prompt:'请输入用户地址',label:'用户地址:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				</td>
				<td  width="33%">
				 <input class="easyui-textbox" name="phone" data-options="prompt:'请输入用户电话',label:'用户电话:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				</td>
				<td  width="33%">
				 <input class="easyui-textbox" name="position" data-options="prompt:'请输入用户职位',label:'用户职位:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
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
	<a href="javascript:void(0)" class="easyui-linkbutton" id="addUser" data-options="iconCls:'icon-add',plain:true">添加用户</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="updateUser" data-options="iconCls:'icon-edit',plain:true">修改用户</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="deleteUser" data-options="iconCls:'icon-remove',plain:true">删除用户</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="resettingPwd" data-options="iconCls:'icon-advancedsettings',plain:true">重置密码</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="selectUserRole" data-options="iconCls:'icon-group',plain:true">分配角色</a>
</div>
<!-- 数据表格结束-->
 
<!-- 添加  修改的弹出层开始 -->
<div class="easyui-dialog" id="dlg" data-options="title:'添加用户',iconCls:'icon-save',width:'600px',height:'500px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#dlg-buttons'">
<div class="easyui-panel" border="false" style="width:100%;padding:20px;">
	<form  method="post" id="dataFrm">
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="realname" name="realname" data-options="prompt:'请输入用户用户姓名',label:'用户姓名:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="loginname" data-options="prompt:'请输入登录名称',label:'登录名称:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="identity" data-options="prompt:'请输入身份证号',label:'身份证号:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
		 <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="address" data-options="prompt:'请输入用户用户地址',label:'用户地址:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
         <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="phone" data-options="prompt:'请输入用户电话',label:'用户电话:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
         <div style="margin-bottom:10px">
            <input class="easyui-textbox" name="position" data-options="prompt:'请输入用户职位',label:'用户职位:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
        <div style="margin-bottom:10px">
         <label class="textbox-label" style="text-align: right;" >用户性别:</label>
             <input class="easyui-radiobutton" name="sex" value="1">男 <span style="display:inline-block;width: 10px"></span>
             <input class="easyui-radiobutton" name="sex" value="0">女
        </div>
        <div>
         <label class="textbox-label" style="text-align: right;" >是否可用:</label>
             <input class="easyui-radiobutton" name="available" value="1">是<span style="display:inline-block;width: 10px"></span>
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

<!-- 添加  修改的弹出层开始 -->
<div class="easyui-dialog" id="dlg_Role" data-options="title:'分配角色',iconCls:'icon-save',width:'600px',height:'500px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#dlg-buttons-role'">
	<div class="easyui-panel" border="false" style="width:100%;padding:20px;">
		<form  method="post" id="dataFrm">
			<input type="hidden" name="userid" id="userid"/>
			<table id="dg_Role"></table>  
		</form>
	</div>
</div>
<div id="dlg-buttons-role" style="text-align: right;">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="doSelectUserRole" data-options="iconCls:'icon-save'" style="width:120px">分配角色</a>
    <a href="javascript:void(0)" onclick="javascript:$('#dlg_Role').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
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
		url : '${gxz}/user/loadAllUser.action',
		fitColumns : true,
		emptyMsg : '<font color=red>查无数据</font>',
		pagination : true,
		pagePosition : 'bottom',
		pageNumber : 1,
		pageSize : 10,
		pageList : [ 5, 10, 15, 20, 25 ],
		toolbar : '#tb',
		columns:[ [
		           {field:'userid',title:'编号',width:100,align:'center'},
		           {field:'identity',title:'身份证号',width:100,align:'center'},
		           {field:'loginname',title:'登录名称',width:100,align:'center'},
		           {field:'realname',title:'真实名称',width:100,align:'center'},
		           {field:'address',title:'用户地址',width:100,align:'center'},
		           {field:'sex',title:'用户性别',width:100,align:'center',formatter:function(value){
		               return value==1?'<font color=green>男</font>':'<font color=red>女</font>';
		           }},
		           {field:'phone',title:'用户电话',width:100,align:'center'},
		           {field:'pwd',title:'用户密码',width:100,align:'center',formatter:function(value){
		        	   return "******";
		           }},
		           {field:'position',title:'用户职位',width:100,align:'center'},
		           {field:'available',title:'是否可用',width:100,align:'center',formatter:function(value){
		               return value==1?'<font color=green>可用</font>':'<font color=red>不可用</font>';
		           }}
		       ] ],
		
	});
	
	$("#doSearch").click(function(){
		var params = $("#searchFrm").serialize();
		$("#dg").datagrid({
			url:'${gxz}/user/loadAllUser.action?'+params
		});
	});
	
	//添加用户
	var url="";
	$("#addUser").click(function(){
		$("#dlg").dialog("open").dialog('setTitle','添加用户');
		$("#dataFrm").form("clear");
		url="${gxz}/user/addUser.action";
		$("#realname").textbox('textbox').bind('blur', function(e){
			var val=$(this).val();
			$.post("${gxz}/user/getPinyinName.action",{realname:val},function(obj){
				$("#dataFrm").form("load",{
					loginname:obj,
					sex:1,
					available:1
				});
			});
		});
	});
	//修改用户
	$("#updateUser").click(function(){
	//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$("#dlg").dialog("open").dialog('setTitle','修改用户');
			$("#dataFrm").form("clear");
			$("#dataFrm").form("load",row);
			url="${gxz}/user/updateUser.action?userid="+row.userid;
			$("#realname").textbox('textbox').bind('blur', function(e){
				var val=$(this).val();
				$.post("${gxz}/user/getPinyinName.action",{realname:val},function(obj){
					$("#dataFrm").form("load",{
						loginname:obj,
					});
				});
			});
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
                 var result = eval('('+result+')');
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
	//删除用户
	$("#deleteUser").click(function(){
		//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$.messager.confirm('删除', '你确定要删除'+row.realname+'这个用户吗?', function(r){
				if (r){
					$.post("${gxz}/user/deleteUser.action",{userid:row.userid},function(obj){
						 //刷新表格
		                $("#dg").datagrid("reload");
		                $.messager.show({
		                    title:'提示',
		                    msg:obj.msg
		                });
					},"json");
				}
			});
		}else{
			$.messager.show({
				title:'提示',
				msg:'请选中操作行'
			});
		}
	});
	
	//重置密码
	$("#resettingPwd").click(function(){
		//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$.messager.confirm('重置密码', '你确定要重置'+row.realname+'这个用户吗?', function(r){
				if (r){
					$.post("${gxz}/user/resettingPwd.action",{userid:row.userid},function(obj){
						 //刷新表格
		                $("#dg").datagrid("reload");
		                $.messager.show({
		                    title:'提示',
		                    msg:obj.msg
		                });
					},"json");
				}
			});
		}else{
			$.messager.show({
				title:'提示',
				msg:'请选中操作行'
			});
		}
	});
	
	
	/******************角色分配******************/
	$("#selectUserRole").click(function(){
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$("#dlg_Role").dialog("open").dialog('setTitle','分配【'+row.realname+'】角色');
			userRoleMenu(row.userid);
			$("#userid").val(row.userid);
		}else{
			$.messager.show({
				title:'提示',
				msg:'请选中操作行'
			});
		}
	});
	
	$("#doSelectUserRole").click(function(){
		var row=$("#dg_Role").datagrid("getChecked");
		if(row){
			params="userid="+$("#userid").val();
			for(var i=0;i<row.length;i++){
				params+="&rids="+row[i].roleid;
			}
			$.post("${gxz}/user/saveUserRole.action?"+params,function(obj){
				$("#dlg_Role").dialog("close");
				$.messager.show({
					title:'提示',
					msg:obj.msg
				});
			});
		}else{
			$.messager.show({
				title:'提示',
				msg:'请选择需要分配的角色'
			});
		}
	});
	
	function userRoleMenu(userid){
		$("#dg_Role").datagrid({
			width:'99.9%',
			title : '角色列表',
			rownumbers : true,
			url : '${gxz}/user/loadRoleByUid.action?userid='+userid,
			fitColumns : true,
			emptyMsg : '<font color=red>查无数据</font>',
			pagePosition : 'bottom',
			columns:[ [
			           {field:'checked',width:100,align:'center', checkbox : true},
			           {field:'roleid',title:'编号',width:100,align:'center'},
			           {field:'rolename',title:'角色名称',width:100,align:'center'},
			           {field:'roledesc',title:'角色描述',width:100,align:'center'},
			           {field:'available',title:'是否可用',width:100,align:'center',formatter:function(value){
			               return value==1?'<font color=green>可用</font>':'<font color=red>不可用</font>';
			           }}
			       ] ],
	       onLoadSuccess:function(data){
		    	for(var i=0;i<data.rows.length;i++){
		    		if(data.rows[i].checked){
		    			$("#dg_Role").datagrid("selectRow",i);
		    		}
		    	}
		    }
			
		});
	}
</script>
</body>
</html>
