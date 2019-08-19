package com.gxz.sys.constast;

public interface SysConstast {
	//登陆提示
	String LOGIN_ERROR_USERNAME = "用户不存在";
	String LOGIN_ERROR_PWD = "密码错误";
	
	//用户类型
	Integer USER_SYSTEM_SUPER=1;//系统内置用户
	Integer USER_TYPE_NORMAL=2;//系统用户
	
	// 是否有效
	Integer AVAILABLE_TRUE = 1;
	Integer AVAILABLE_FALSE = 0;
	// 是否打开
	Integer OPEN_TRUE = 1;
	Integer OPEN_FALSE = 0;
	// 是否父节点
	Integer PARENT_TRUE = 1;
	Integer PARENT_FALSE = 0;
	
	
	/**
	 * 操作相关的
	 */
	Integer CODE_SUCCESS = 1;
	Integer CODE_ERROR = -1;
	
	String OPERATION_DELETE_SUCCESS = "删除成功";
	String OPERATION_UPDATE_SUCCESS = "修改成功";
	String OPERATION_ADD_SUCCESS = "添加成功";
	String OPERATION_RESET_PWD_SUCCESS = "重置密码成功";
	
	String OPERATION_DELETE_ERROR = "删除失败";
	String OPERATION_UPDATE_ERROR = "修改失败";
	String OPERATION_ADD_ERROR = "添加失败";
	String OPERATION_RESET_PWD_ERROR = "重置密码失败";
	
	//重置密码
	String OPERATION_RESET_PWD="123456";
}
