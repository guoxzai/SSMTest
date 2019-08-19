<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>统计客户地区</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${gxz }/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${gxz }/resources/echarts/echarts.min.js"></script>
</head>

<body>
	<div id="container" style="height: 100%"></div>
	<script type="text/javascript">
	$.post("${gxz}/tjfx/loadAllCircleChart.action",function(obj){
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		option = {
			title : {
				text : '汽车出租系统',
				subtext : '客户分布',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : obj
			},
			series : [
			          {
			              name: '地区人数占比',
			              type: 'pie',
			              radius : '55%',
			              center: ['50%', '60%'],
			              data:obj,
			              itemStyle: {
			                  emphasis: {
			                      shadowBlur: 10,
			                      shadowOffsetX: 0,
			                      shadowColor: 'rgba(0, 0, 0, 0.5)'
			                  }
			              }
			          }
			      ]
		};
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
	},"json");
		
	</script>
</body>
</html>
