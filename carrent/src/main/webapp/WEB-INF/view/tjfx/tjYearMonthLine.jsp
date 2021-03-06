<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>年月份销售额曲线图</title>
    
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
	<script type="text/javascript" src="${gxz }/resources/echarts/echarts.min.js"></script>
  </head>
  
  <body>
  <!-- 查询条件开始 -->
	<div class="easyui-panel" style="padding: 20px;text-align: center;" data-options="title:'查询条件',iconCls:'icon-search',width:'99%'">
	       <select class="easyui-combobox" id="year" name="year" data-options="onChange:chageData"  label="选择年份:" labelPosition="left" style="width:30%;">
	           <c:forEach var="sn" begin="2015" end="2030">
	           		<option value="${sn }">${sn }年</option>
	           </c:forEach>
	       </select>
	</div>
	<div style="height: 2px"></div>
   <!-- 查询条件结束 -->
	<div id="container" style="height:640px"></div>
	
	<script type="text/javascript">
		var currentYear=new Date().getFullYear();
		$("#year").val(currentYear);
		function chageData(newValue, oldValue){
			loadChart(newValue);
		}
		loadChart(currentYear);
		
		function loadChart(year){
			$.post("${gxz}/tjfx/yearMonthPriceSum.action",{year:year},function(obj){
				var dom = document.getElementById("container");
				var myChart = echarts.init(dom);
				var app = {};
				option = null;
				option = {
					 title: {
					        left: 'center',
					        text: '年度月份销售额统计',
					    },
				    xAxis: {
				        type: 'category',
				        data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
				        /* data:obj.months */
				       
				    },
				    yAxis: {
				        type: 'value'
				    },
				    series: [{
				        data: obj,
				        type: 'line',
				        itemStyle : { normal: {label : {show: true}}}
				    }]
				};
				;
				if (option && typeof option === "object") {
				    myChart.setOption(option, true);
				}
			},"json");
		}
		
		
	</script>
  </body>
</html>
