<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>系统公告</title>
    
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
	
	<link href="${gxz }/resources/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${gxz }/resources/umeditor/third-party/template.min.js"></script>
	<script type="text/javascript"  src="${gxz }/resources/umeditor/umeditor.config.js"></script>
	<script type="text/javascript"  src="${gxz }/resources/umeditor/umeditor.min.js"></script>
	<script type="text/javascript"  src="${gxz }/resources/umeditor/lang/zh-cn/zh-cn.js"></script>
	
  </head>
  <body>
  
<!-- 查询条件开始 -->
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'100%'">
	<form action="" id="searchFrm">
		<table width="100%" cellpadding="10" style="padding: 10px">
			<tr>
				<td width="50%" align="center">
				 <input class="easyui-textbox" name="title" data-options="prompt:'请输入新闻标题',label:'新闻标题:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td  width="50%" align="center">
				 <input class="easyui-textbox" name="content" data-options="prompt:'请输入新闻内容',label:'新闻内容:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
			</tr>
			<tr>
				<td width="50%" align="center">
				 <input class="easyui-datetimebox" name="startTime" data-options="prompt:'请选择开始时间',label:'开始时间:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td  width="50%" align="center">
				 <input class="easyui-datetimebox" name="endTime" data-options="prompt:'请选择结束时间',label:'结束时间:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
			</tr>
		<tr>
			<td align="center" colspan="3">
				<a href="javascript:void(0)" class="easyui-linkbutton" id="doSearch" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
                <a href="javascript:void(0)" onclick="javascript:$('#searchFrm').form('clear')" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">重置</a>
			</td>
		</tr>
	</table>
	</form>
</div>
<div style="height: 2px"></div>
<!-- 查询条件结束 -->
 
<!-- 数据表格开始 -->
<!-- <div class="easyui-layout">
	<table id="dg" class="easyui-datagrid" data-options="region:'west'"></table>  
	<div id="tb">
		<a href="javascript:void(0)" class="easyui-linkbutton" id="addNews" data-options="iconCls:'icon-add',plain:true">添加新闻</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="updateNews" data-options="iconCls:'icon-edit',plain:true">修改新闻</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="deleteNews" data-options="iconCls:'icon-remove',plain:true">删除新闻</a>
	</div>
	<div class="easyui-panel" style="display: none" data-options="region:'east',title:'东',width:'100px',split:true">
			东
	</div>
</div> -->	

<table id="dg" class="easyui-datagrid"></table>  
<div id="tb">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="addNews" data-options="iconCls:'icon-add',plain:true">添加新闻</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="updateNews" data-options="iconCls:'icon-edit',plain:true">修改新闻</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="deleteNews" data-options="iconCls:'icon-remove',plain:true">删除新闻</a>
</div>
<!-- 数据表格结束-->
 
<!-- 添加  修改的弹出层开始 -->
<div class="easyui-dialog" id="dlg" data-options="title:'添加新闻',iconCls:'icon-save',width:'800px',height:'700px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#dlg-buttons'">
<div class="easyui-panel" border="false" style="width:100%;padding:30px 60px;">
	<form  method="post" id="dataFrm">
		 <div style="margin-bottom:20px">
		 	
            <input class="easyui-textbox" name="title"  data-options="prompt:'请输入新闻标题',label:'新闻标题:',labelAlign:'right',labelPosition:'left',required:true" style="width:100%;">
        </div>
        
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="opername" data-options="prompt:'请输入发布人的名字',label:'发布人:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
        </div>
        
         <div style="margin-bottom:20px">
         	<label class="textbox-label textbox-label-left">新闻内容:</label>
        	 <script type="text/plain"  id="content" name="content" style="width:700px;height:300px"></script>
				<script type="text/javascript">
				 //实例化编辑器，显示在页面，参数是上面的id
				 var  um=UM.getEditor('content');
				</script>
        </div>
        
	</form>
</div>
</div>
<div id="dlg-buttons" style="text-align: right;">
	<a href="javascript:void(0)" class="easyui-linkbutton" id="doSubmit" data-options="iconCls:'icon-save'" style="width:80px">保存</a>
    <a href="javascript:void(0)" onclick="javascript:$('#dlg').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
</div>
<!-- 添加  修改的弹出层结束 -->
 
  
<script type="text/javascript">
	//初始化数据表格
	$("#dg").datagrid({
		width:'99.9%',
		height:450,
		title : '数据列表',
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
		           {field:'id',title:'新闻编号',width:100,align:'center'},
		           {field:'title',title:'新闻标题',width:100,align:'center'},
		           {field:'content',title:'新闻内容',width:100,align:'center'},
		           {field:'createtime',title:'发布时间',width:100,align:'center'},
		           {field:'opername',title:'发布人',width:100,align:'center'},
	     ] ],
	});
	
	$("#doSearch").click(function(){
		var params = $("#searchFrm").serialize();
		$("#dg").datagrid({
			url:'${gxz}/news/loadAllNews.action?'+params
		});
	});
	
	//添加新闻
	var url="";
	$("#addNews").click(function(){
		$("#dlg").dialog("open").dialog('setTitle','添加新闻');
		$("#dataFrm").form("clear");
		$("#content").html("");
		url="${gxz}/news/addNews.action";
	});
	//修改新闻
	$("#updateNews").click(function(){
	//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$("#dlg").dialog("open").dialog('setTitle','修改新闻');
			$("#dataFrm").form("clear");
			$("#dataFrm").form("load",row);
			$("#content").html(row.content);
			url="${gxz}/news/updateNews.action?id="+row.id;
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
	//删除新闻
	$("#deleteNews").click(function(){
		//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$.messager.confirm('删除', '你确定要删除'+row.id+'这个新闻吗?', function(r){
				if (r){
					$.post("${gxz}/news/deleteNews.action",{id:row.id},function(obj){
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
</script>
</body>

</html>
