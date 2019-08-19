package com.gxz.tjfx.service;

import java.util.List;

import com.gxz.tjfx.domain.CircleChart;
import com.gxz.tjfx.domain.ColumnChart;
import com.gxz.tjfx.domain.LineChart;

public interface CircleChartService {
	public List<CircleChart> queryAllListGroupByAddress();

	public List<ColumnChart> opernameSalMoneyYear(Integer year);

	public List<LineChart> queryYearMonthPriceSum(Integer year);
}
