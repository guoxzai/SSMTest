package com.gxz.sys.service;

import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.vo.UserVo;

public interface UserService {

	boolean userIsExist(UserVo userVo);

	void updatePwd(UserVo userVo);

	DataGridView loadAllUser(UserVo userVo);

	void addUser(UserVo userVo);

	void updateUser(UserVo userVo);

	void deleteUser(UserVo userVo);

	//重置密码
	void resettingPwd(UserVo userVo);

	//用户分配角色
	void saveUserRole(UserVo userVo);

}
