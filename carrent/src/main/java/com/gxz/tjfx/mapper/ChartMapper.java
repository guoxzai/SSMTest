package com.gxz.tjfx.mapper;

import java.util.List;

import com.gxz.tjfx.domain.CircleChart;
import com.gxz.tjfx.domain.ColumnChart;
import com.gxz.tjfx.domain.LineChart;

public interface ChartMapper {
	
	public List<CircleChart> queryAllListGroupByAddress();
	
	public List<ColumnChart> columnChartOpernameSalYear(Integer year);
	
	public List<LineChart> opernameYearMonth(Integer year);
}
