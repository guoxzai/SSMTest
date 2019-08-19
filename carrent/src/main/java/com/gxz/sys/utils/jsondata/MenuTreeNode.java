package com.gxz.sys.utils.jsondata;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MenuTreeNode {
	// 简单的json数据拼接
	// zTree中树的构造
	private Integer id;
	@JsonProperty("pId")
	private Integer pid;
	private String name;
	private Boolean isParent;
	private Boolean open;
	private String href;// 因为zTree是url会跳转整个页面
	private String icon;
	private String tabIcon;

	/************ 标准的json数据拼接 复用 开始 *******************/
	// easyui中的树构造
	private String text;
	private List<MenuTreeNode> children = new ArrayList<>();

	public MenuTreeNode(Integer id, Integer pid, String text) {
		super();
		this.id = id;
		this.pid = pid;
		this.text = text;
	}

	/************ 标准的json数据拼接 复用 结束 *******************/

	/************* 角色分配 复选框树的组合开始 *******************/
	private boolean checked;
	
	public MenuTreeNode(Integer id, Integer pid, String name, Boolean isParent,
			Boolean open, String icon, boolean checked) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.isParent = isParent;
		this.open = open;
		this.icon = icon;
		this.checked = checked;
	}

	/************* 角色分配 复选框树的组合结束 *******************/

	public MenuTreeNode(Integer id, Integer pid, String name, Boolean isParent,
			Boolean open, String href, String icon, String tabIcon) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.isParent = isParent;
		this.open = open;
		this.href = href;
		this.icon = icon;
		this.tabIcon = tabIcon;
	}

	public MenuTreeNode() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getIsParent() {
		return isParent;
	}

	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}

	public Boolean getOpen() {
		return open;
	}

	public void setOpen(Boolean open) {
		this.open = open;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getTabIcon() {
		return tabIcon;
	}

	public void setTabIcon(String tabIcon) {
		this.tabIcon = tabIcon;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<MenuTreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<MenuTreeNode> children) {
		this.children = children;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

}
