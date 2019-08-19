package com.gxz.sys.service;

import com.gxz.sys.domain.User;
import com.gxz.sys.vo.UserVo;

public interface LoginService {

	User login(UserVo userVo);

}
