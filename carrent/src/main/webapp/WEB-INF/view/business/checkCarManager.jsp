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
		<div class="easyui-panel" style="text-align: center;padding: 20px" data-options="title:'出租单号查询',iconCls:'icon-search',width:'98%'">
			 <input class="easyui-searchbox" id="serach_rentid" name="rentid" data-options="prompt:'请输入出租单号',searcher:dosearch" style="width:60%">
		</div>
		<div style="height: 5px"></div>
	  <!-- 查询条件结束 -->
	  
  	<div id="content" style="width: 99%;">
  		<div class="easyui-panel" data-options="title:'生成检查单',iconCls:'icon-save',width:'100%'" >
  			<form action="" method="post" id="checkFrm">
  				<table width="100%" style="text-align: center;margin-top: 20px" cellpadding="5">
  					<tr>
  						<td width="50%">
  							<input class="easyui-textbox" name="checkid" id="checkid" readonly="readonly" data-options="prompt:'请输入检查单号',label:'检查单号:',labelAlign:'right',labelPosition:'left',required:true" style="width:60%"/>
  						</td>
  						<td width="50%">
  							<input class="easyui-datetimebox" name="checkdate" id="checkdate" readonly="readonly" data-options="prompt:'请选择检查时间',label:'检查时间:',labelAlign:'right',labelPosition:'left',required:true" style="width: 60%"/>
  						</td>
  					</tr>
  					<tr>
  						<td width="50%">
  							<input class="easyui-textbox" name="rentid" id="rentid" readonly="readonly" data-options="prompt:'请输入出租单号',label:'出租单号:',labelAlign:'right',labelPosition:'left',required:true" style="width:60%"/>
  						</td>
  						<td width="50%">
  							<input class="easyui-textbox" name="opername" id="opername" readonly="readonly" data-options="prompt:'请选择操作员',label:'操作员:',labelAlign:'right',labelPosition:'left',required:true" style="width: 60%"/>
  						</td>
  					</tr>
  					<tr>
  						<td width="50%">
  							<input class="easyui-textbox" name="problem" data-options="prompt:'请输入存在问题',label:'存在问题:',labelAlign:'right',labelPosition:'left',required:true" style="width:60%"/>
  						</td>
  						<td width="50%">
  							<input class="easyui-textbox" name="paymoney" data-options="prompt:'请输入赔付金额',label:'赔付金额:',labelAlign:'right',labelPosition:'left',required:true" style="width: 60%"/>
  						</td>
  					</tr>
  					<tr>
  						<td colspan="3">
							<input class="easyui-textbox" name="checkdesc" data-options="prompt:'请输入问题描述',label:'问题描述:',labelAlign:'right',labelPosition:'left',multiline:true" style="width: 80%;height: 80px"/>
  						</td>
  					</tr>
  					<tr>
  						<td colspan="3">
  							<a href="javascript:void(0);" id="addChecks" class="easyui-linkbutton" data-options="iconCls:'icon-accept'">保存</a>
  						</td>
  					</tr>
  				</table>
  			</form>
  		</div>
  		<div style="height: 5px"></div>
  		<div class="easyui-layout" data-options="width:'100%',height:'300px'">
  			<div  class="easyui-panel" data-options="iconCls:'icon-book-open',title:'车辆信息',region:'west',width:'33%',height:'100%'">
  				<table style="text-align: center;">
					<tr>
						<td width="70%">车牌号:</td>
						<td id="car_carnumber"></td>
					</tr>
					<tr>
						<td width="70%" >车辆类型:</td>
						<td id="car_cartype"></td>
					</tr>
					<tr>
						<td width="70%" >车辆颜色:</td>
						<td id="car_color"></td>
					</tr>
					<tr>
						<td width="70%">车辆价格:</td>
						<td id="car_price"></td>
					</tr>
					<tr>
						<td width="70%">默认出租价格:</td>
						<td id="car_rentprice"></td>
					</tr>
					<tr>
						<td width="70%">出租押金:</td>
						<td id="car_deposit"></td>
					</tr>
					<tr>
						<td width="70%">车辆描述:</td>
						<td id="car_description"></td>
					</tr>
					<tr>
						<td width="70%">车辆图片:</td>
						<td><img alt="车辆图片" width="100" height="80" id="car_carimg"
							src="${gxz }/upload/001.png"></td>
					</tr>
				</table>

  			</div>
  			<div class="easyui-panel" data-options="iconCls:'icon-book-open',title:'出租单信息',region:'center',width:'33%',height:'100%'">
  				<table style="text-align: center;padding: 20px" cellpadding="8">
					<tr>
						<td width="60%">出租单号:</td>
						<td id="rent_rentid"></td>
					</tr>
					<tr>
						<td width="60%" >出租的实际价格:</td>
						<td id="rent_price"></td>
					</tr>
					<tr>
						<td width="60%" >起租时间:</td>
						<td id="rent_begindate"></td>
					</tr>
					<tr>
						<td width="60%">还车时间:</td>
						<td id="rent_returndate"></td>
					</tr>
					<tr>
						<td width="60%">操作员:</td>
						<td id="rent_opername"></td>
					</tr>
				</table>
  			</div>
  			<div class="easyui-panel" data-options="iconCls:'icon-book-open',title:'客户信息',region:'east',width:'33%',height:'100%'">
  				<table style="text-align:center;padding: 20px" cellpadding="6">
					<tr>
						<td width="50%" >省份证号:</td>
						<td id="cus_identity"></td>
					</tr>
					<tr>
						<td width="50%" >客户姓名:</td>
						<td id="cus_custname"></td>
					</tr>
					<tr>
						<td width="50%" >客户性别:</td>
						<td id="cus_sex"></td>
					</tr>
					<tr>
						<td width="50%" >客户地址:</td>
						<td id="cus_address"></td>
					</tr>
					<tr>
						<td width="50%" >客户职位:</td>
						<td id="cus_career"></td>
					</tr>
					<tr>
						<td width="50%" >客户电话:</td>
						<td id="cus_phone"></td>
					</tr>
				</table>
  			</div>
  		</div>
  		
  	</div>
  
  </body>
  <script type="text/javascript">
  	$(function(){
  		$("#content").hide();
	});
  	
  	function dosearch(){
  		$.post('${gxz}/rentCar/queryRentById.action',{rentid:$("#serach_rentid").val()},function(data){
  			if(null==data){
  				$("#content").hide();
  				$.messager.show({
  					title:'提示',
  					msg:'出租单号不存在'
  				});
  			}else if(data.rentflag==1){
  				$("#content").hide();
  				$.messager.show({
  					title:'提示',
  					msg:'该出租单号的车辆已归还'
  				});
  			}else{
  				$("#content").show();
  				initCheckFrmMsg($("#serach_rentid").val());
  			}
  		},"json");
  	}
  	
  	function initCheckFrmMsg(rentid){
  		$.post("${gxz}/check/initCheckFrm.action",{rentid:rentid},function(data){
  			$("#checkFrm").form("load",data.check);
  			
  			$("#car_carnumber").html(data.car.carnumber);
  			$("#car_cartype").html(data.car.cartype);
  			$("#car_color").html(data.car.color);
  			$("#car_price").html(data.car.price);
  			$("#car_rentprice").html(data.car.rentprice);
  			$("#car_deposit").html(data.car.deposit);
  			$("#car_description").html(data.car.description);
  			$("#car_carimg").attr("src",'${gxz}/'+data.car.carimg);
  			
  			$("#rent_rentid").html(rentid);
  			$("#rent_price").html(data.rent.price);
  			$("#rent_begindate").html(data.rent.begindate);
  			$("#rent_rentid").html(data.rent.rentid);
  			$("#rent_returndate").html(data.rent.returndate);
  			$("#rent_opername").html(data.rent.opername);
  			
  			
  			$("#cus_identity").html(data.customer.identity);
  			$("#cus_custname").html(data.customer.custname);
  			$("#cus_sex").html(data.customer.sex==1?'男':'女');
  			$("#cus_address").html(data.customer.address);
  			$("#cus_career").html(data.customer.career);
  			$("#cus_phone").html(data.customer.phone);
  		});
  	}
  	
  	
  	$("#addChecks").click(function(){
  		$("#checkFrm").form("submit",{
			url: '${gxz}/check/addCheck.action',
            onSubmit: function(){
                return $(this).form('validate');//触发验证
            },
            success: function(result){
               $("#content").hide();
               $.messager.show({
                   title:'提示',
                   msg:"操作成功"
               });
            }
		});
  	});
  </script>
</html>

