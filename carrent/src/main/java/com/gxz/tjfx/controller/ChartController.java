package com.gxz.tjfx.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxz.tjfx.domain.CircleChart;
import com.gxz.tjfx.domain.ColumnChart;
import com.gxz.tjfx.domain.LineChart;
import com.gxz.tjfx.service.CircleChartService;

@RequestMapping("tjfx")
@Controller
public class ChartController {

	@Autowired
	private CircleChartService circleChartService;
	
	/**
	 * 统计人员分布地区的情况
	 * @return
	 */
	@RequestMapping("toTjCustomerArea")
	public String toTjCustomerArea(){
		return "forward:/WEB-INF/view/tjfx/tjCustomerArea.jsp";
	}
	
	@RequestMapping("loadAllCircleChart")
	@ResponseBody
	public List<CircleChart> loadAllCircleChart(){
		return circleChartService.queryAllListGroupByAddress();
	}
	
	/**
	 * 统计业务员年销售量
	 * @return
	 */
	@RequestMapping("toTjOpernameSalMoneyYear")
	public String tjOpernameSalMoneyYear(){
		return "forward:/WEB-INF/view/tjfx/tjOpernameSalMoneyYear.jsp";
	}
	
	@RequestMapping("opernameSalMoneyYear")
	@ResponseBody
	public Map<String,List<?>> opernameSalMoneyYear(Integer year){
		Map<String,List<?>> map = new HashMap<>();
		List<ColumnChart> list = circleChartService.opernameSalMoneyYear(year);
		List<String> opernames = new ArrayList<>();
		List<Double> prices = new ArrayList<>();
		for (ColumnChart columnChart : list) {
			String opername = columnChart.getOpername();
			Double price = columnChart.getPrice();
			opernames.add(opername);
			prices.add(price);
			map.put("opername",opernames);
			map.put("prices",prices);
		}
		
		return map;
	} 
	
	/**
	 * 统计业务员一年内每月的销售情况
	 */
	@RequestMapping("toTjYearMonthLine")
	public String toTjYearMonthLine(){
		return "/WEB-INF/view/tjfx/tjYearMonthLine.jsp";
	}
	
	@RequestMapping("yearMonthPriceSum")
	@ResponseBody
	public List<Double> yearMonthPriceSum(Integer year){
		List<Double> list = new ArrayList<>();
		List<LineChart> yearMonthPrices = circleChartService.queryYearMonthPriceSum(year);
		for(int month = 1 ; month <= 12 ; month++){
			Double value=0.0;
			for (LineChart yearMonthPrice : yearMonthPrices) {
				if(month == yearMonthPrice.getMonth()){
					value=yearMonthPrice.getMonthPrice();
					break;
				}
			}
			list.add(value);
			
		}
		/*Map<String,List<?>> map = new HashMap<>();
		List<LineChart> yearMonthPrices = circleChartService.queryYearMonthPriceSum(year);
		List<Integer> months = new ArrayList<>();
		List<Double> prices = new ArrayList<>();
		for (LineChart data : yearMonthPrices) {
			months.add(data.getMonth());
			prices.add(data.getMonthPrice());
		}
		map.put("months", months);
		map.put("prices", prices);*/
		System.out.println(list);
		return list;
	}
	
}
