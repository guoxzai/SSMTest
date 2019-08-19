package com.gxz.tjfx.domain;

public class CircleChart {
	private Integer value;
	private String name;

	public CircleChart(Integer value, String name) {
		super();
		this.value = value;
		this.name = name;
	}

	public CircleChart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
