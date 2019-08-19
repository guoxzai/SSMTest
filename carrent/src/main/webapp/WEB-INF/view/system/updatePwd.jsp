<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatePwd.jsp' starting page</title>
    
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
    <div class="easyui-panel" data-options="title:'修改密码',iconCls:'icon-search',width:'99%',height:'400px'">
	<form action="" id="updatePwdFrm">
		<table width="100%" cellpadding="8" cellspacing="10">
			<tr style="text-align: center;">
				<td width="33%">
				 <input class="easyui-textbox" name="loginname" value="${user.loginname }" data-options="readonly:true,label:'用户名:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				</td>
			<tr/>
			
			<tr style="text-align: center;">
				<td width="33%">
					<input type="hidden" id="oldpwd" value="${user.pwd }">
				 <input class="easyui-passwordbox" name="pwd" id="pwd"   validType="equaloldPwd['#oldpwd']"  data-options="required:true,prompt:'请输入原始密码',label:'原始密码:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				 <span id="sp1"></span>
				</td>
			<tr/>
			
			<tr style="text-align: center;">
				<td  width="33%">
				 <input class="easyui-passwordbox" class="easyui-validatebox" name="newPwd" id="newPwd" data-options="required:true,prompt:'请输入新密码',label:'新密码:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				</td>
			</tr>
			
			<tr style="text-align: center;">
				<td  width="33%">
				 <input class="easyui-passwordbox" class="easyui-validatebox" name="rePwd" id="rePwd" validType="equals['#newPwd']" data-options="required:true,prompt:'确认密码',label:'确认密码:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				 <span id="msg"></span>
				</td>
			</tr>
		<tr>
			<td align="center" colspan="3">
			   <a href="javascript:void(0)" class="easyui-linkbutton" id="doUpdate" data-options="iconCls:'icon-search'" style="width:80px">修改</a>
               <a href="javascript:void(0)" onclick="javascript:$('#updatePwdFrm').form('reset')" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">重置</a>
			</td>
		</tr>
	</table>
	</form>
</div>
<div style="height: 2px"></div>
<!-- 查询条件结束 -->
  </body>
  <script type="text/javascript">
  	
  $.extend($.fn.validatebox.defaults.rules, {
	    equaloldPwd: {
	        validator: function(value,param){
	        	return value == $(param[0]).val();
	        },
	        message: '原始密码不匹配'
	    },
	    equals: {
			validator: function(value,param){
				return value == $(param[0]).val();
			},
			message: "两次密码不匹配"
			
	    }
	});
  	function checkPwd(){
  		$.post("${gxz}/user/userIsExist.action",{pwd:$('#pwd').textbox('getValue')},function(data){
  			if(data){
  				$("#sp1").html("<font color='green'>密码正确</font>");
  			}else{
	  			$("#sp1").html("<font color='red'>密码错误</font>");
  				
  			}
  		});
  	}
	
  	
  	$("#doUpdate").click(function(){
  		$('#updatePwdFrm').form('submit', {
  	  		url: '${gxz}/user/updatePwd.action',
  	  		onSubmit: function(){
  	  			var isValid = $(this).form('validate');
  	  			if (!isValid){
  	  				$.messager.progress('close');	// hide progress bar while the form is invalid
  	  			}
  	  			return isValid;	// return false will stop the form submission
  	  		},
  	  		success: function(){
  	  			window.location.href="${gxz}/login/toLogin.action"   // hide progress bar while submit successfully
  	  		}
  	  	});
  	});
  
	/* $.extend($.fn.validatebox.defaults.rules, {
		    equals: {
				validator: function(value,param){
					return value == $(param[0]).val();
				},
				message: $("#msg").html("<font color='red'>密码不一致</font>")
				
		    }
		}); */
 
  </script>
</html>
