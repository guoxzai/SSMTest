package com.gxz.sys.utils.jsondata;

public class ResultObj {

	private Integer code = 1; // 如果code<0操作失败
	private String msg;

	public ResultObj(Integer code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	public ResultObj() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
