package com.gxz.sys.mapper;

import java.util.List;

import com.gxz.sys.domain.LoginInfo;

public interface LoginInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LoginInfo record);

    int insertSelective(LoginInfo record);

    LoginInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LoginInfo record);

    int updateByPrimaryKey(LoginInfo record);
    
    List<LoginInfo> queryAllLoginInfo(LoginInfo loginInfo);
    
}