package com.gxz.sys.utils.jsondata;

import java.util.List;

public class DataGridView {
	private Long total;
	private List<?> rows;

	public DataGridView(Long total, List<?> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}

	public DataGridView() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}

}
