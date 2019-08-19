package com.gxz.sys.vo;

import com.gxz.sys.domain.User;

public class UserVo extends User {
	private Integer page;
	private Integer rows;

	private String newPwd;
	
	//角色分配
	private Integer[] rids;
	
	public Integer[] getRids() {
		return rids;
	}

	public void setRids(Integer[] rids) {
		this.rids = rids;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

}
