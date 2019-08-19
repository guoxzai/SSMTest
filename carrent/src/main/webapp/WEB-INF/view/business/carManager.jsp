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
  
   <body style="visibility: hidden;">
<!-- 查询条件开始 -->
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'99%'">
	<form action="" id="searchFrm" >
		<table width="100%" cellpadding="10" cellspacing="10">
			<tr>
				<td width="30%" style="text-align: center;">
				 <input class="easyui-textbox" name="carnumber" data-options="prompt:'请输入车辆号牌',label:'车辆号牌:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td  width="30%" style="text-align: center;">
				 <input class="easyui-textbox" name="cartype" data-options="prompt:'请输入车辆类型',label:'车辆类型:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td  width="30%" style="text-align: center;">
				 <input class="easyui-textbox" name="color" data-options="prompt:'请输入车辆颜色',label:'车辆颜色:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
			</tr>
			<tr>
				<td width="30%" style="text-align: center;">
				 <input class="easyui-textbox" name="description" data-options="prompt:'请输入车辆描述',label:'车辆描述:',labelAlign:'right',labelPosition:'left'" style="width:60%;">
				</td>
				<td  width="30%" style="text-align: center;">
				<label class="textbox-label" style="text-align: right;" >是否出租:</label>
                     <input class="easyui-radiobutton" name="isrenting" value="0">未出租 <span style="display:inline-block;width: 10px"></span>
                     <input class="easyui-radiobutton" name="isrenting" value="1">已出租
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
	<a href="javascript:void(0)" class="easyui-linkbutton" id="addCar" data-options="iconCls:'icon-add',plain:true">添加车辆</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="updateCar" data-options="iconCls:'icon-edit',plain:true">修改车辆</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" id="deleteCar" data-options="iconCls:'icon-remove',plain:true">删除车辆</a>

</div>
<!-- 数据表格结束-->
<!-- 添加  修改的弹出层开始 -->
<div class="easyui-dialog" id="dlg" data-options="title:'添加车辆',iconCls:'icon-save',width:'600px',height:'500px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#dlg-buttons'">
<div class="easyui-panel" border="false" style="width:100%;padding:10px;">
	<form  method="post" id="dataFrm">
		 <div style="margin-bottom:10px">
            <input class="easyui-textbox" id="carnumber" name="carnumber" data-options="prompt:'请输入车辆号牌',label:'车辆号牌:',labelAlign:'right',labelPosition:'left',required:true" style="width:60%;">
        </div>
		 <div style="margin-bottom:10px">
            <input class="easyui-textbox" name="cartype" data-options="prompt:'请输入车辆类型',label:'车辆类型:',labelAlign:'right',labelPosition:'left',required:true" style="width:60%;">
        </div>
		 <div style="margin-bottom:10px">
            <input class="easyui-textbox" name="color" data-options="prompt:'请输入车辆颜色',label:'车辆颜色:',labelAlign:'right',labelPosition:'left',required:true" style="width:60%;">
        </div>
		 <div style="margin-bottom:10px">
            <input class="easyui-textbox" name="price" data-options="prompt:'请输入车辆购买价格',label:'购买价格:',labelAlign:'right',labelPosition:'left',required:true" style="width:60%;">
        </div>
         <div style="margin-bottom:10px">
            <input class="easyui-textbox" name="rentprice" data-options="prompt:'请输入车辆出租价格',label:'出租价格:',labelAlign:'right',labelPosition:'left',required:true" style="width:60%;">
        </div>
         <div style="margin-bottom:10px">
            <input class="easyui-textbox" name="deposit" data-options="prompt:'请输入车辆出租押金',label:'出租押金:',labelAlign:'right',labelPosition:'left',required:true" style="width:60%;">
        </div>
         <div style="margin-bottom:10px">
            <input class="easyui-textbox" name="description" data-options="prompt:'请输入描述信息',label:'出租描述:',labelAlign:'right',labelPosition:'left'" style="width:100%;">
        </div>
        <div>
        	 <label class="textbox-label" style="text-align: right;" >是否出租:</label>
             <input class="easyui-radiobutton" name="isrenting" value="0">未出租 <span style="display:inline-block;width: 10px"></span>
             <input class="easyui-radiobutton" name="isrenting" value="1">已出租
        </div>
        	<input type="hidden" id="carimg" name="carimg"/>
        	<img id="img_carimg" src="${gxz }/upload/defaultCarImg.png" style="width: 36%;height:220px;position: absolute;left: 60%;top: 45px">
		</form>
		
		<form action="" method="post" id="uploadFrm">
			<div style="margin-bottom:10px">
				<input class="easyui-filebox" name="mf" data-options="buttonText: '选择文件',prompt:'请选择车辆图片',label:'车辆图片:',labelAlign:'right',labelPosition:'left'" style="width:70%;">
				<a href="javascript:void(0)" class="easyui-linkbutton" id="uploadCarImg" data-options="iconCls:'icon-add',accept:'image/*'">上传图片</a>
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
	$(function(){
		$("body").css({
			visibility:"visible"
		});
	});

	$("#uploadCarImg").click(function(){
		//$("#carimgfrm")[0]是把jq对象转成js对象
		var formData = new FormData($("#uploadFrm")[0]);
		 $.ajax({
			url:'${gxz }/upload/fileUpload.action',
			type:'POST',
			data:formData,
			async:false,
			cache:false,
			contentType:false,
			processData:false,
			success:function(path){
				$("#img_carimg").attr("src",'${gxz}/'+path);
				//给表单设置值 ，目地是当提交表单时把这个图片地址传到后台
				$("#carimg").val(path);
			},
			error:function(rv){
				alert(rv);
			}
		}); 

	});

	//初始化数据表格
	$("#dg").datagrid({
		width:'99%',
		height:400,
		title : '数据列表',
		rownumbers : true,
		singleSelect : true,
		url : '${gxz}/car/loadAllCar.action',
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
	
	$("#doSearch").click(function(){
		var params = $("#searchFrm").serialize();
		$("#dg").datagrid({
			url:'${gxz}/car/loadAllCar.action?'+params
		});
	});
	
	//添加车辆
	var url="";
	$("#addCar").click(function(){
		$("#dlg").dialog("open").dialog('setTitle','添加车辆');
		$("#dataFrm").form("clear");
		$("#dataFrm").form("load",{isrenting:0});
		$("#carnumber").textbox("readonly",false);
		$("#img_carimg").attr("src","${gxz }/upload/defaultCarImg.png");
		url="${gxz}/car/addCar.action";
	});
	//修改车辆
	$("#updateCar").click(function(){
	//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$("#dlg").dialog("open").dialog('setTitle','修改车辆');
			$("#dataFrm").form("clear");
			$("#dataFrm").form("load",row);
			$("#carnumber").textbox("readonly",true);
			$("#img_carimg").attr("src",'${gxz }/'+row.carimg);
			url="${gxz}/car/updateCar.action";
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
	//删除车辆
	$("#deleteCar").click(function(){
		//得到选中行
		var row=$("#dg").datagrid("getSelected");
		if(row){
			$.messager.confirm('删除', '你确定要删除'+row.carnumber+'这个车辆吗?', function(r){
				if (r){
					$.post("${gxz}/car/deleteCar.action",{carnumber:row.carnumber},function(obj){
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
