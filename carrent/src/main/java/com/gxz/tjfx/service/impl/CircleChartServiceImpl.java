package com.gxz.tjfx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxz.tjfx.domain.CircleChart;
import com.gxz.tjfx.domain.ColumnChart;
import com.gxz.tjfx.domain.LineChart;
import com.gxz.tjfx.mapper.ChartMapper;
import com.gxz.tjfx.service.CircleChartService;

@Service
public class CircleChartServiceImpl implements CircleChartService {
	
	@Autowired
	private ChartMapper circleChartMapper;

	@Override
	public List<CircleChart> queryAllListGroupByAddress() {
		return circleChartMapper.queryAllListGroupByAddress();
	}

	@Override
	public List<ColumnChart> opernameSalMoneyYear(Integer year) {
		return circleChartMapper.columnChartOpernameSalYear(year);
	}

	@Override
	public List<LineChart> queryYearMonthPriceSum(Integer year) {
		return circleChartMapper.opernameYearMonth(year);
	}

}
