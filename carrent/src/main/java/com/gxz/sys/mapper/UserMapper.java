package com.gxz.sys.mapper;

import java.util.List;

import com.gxz.sys.domain.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> queryAllUser(User user);
    
    //根据用户名查询账号是否存在
    User login(User user);
    
    //检查用户是否存在
    Integer queryUserCount(User user);
    
    /**
     * 用户角色分配
     */
    int deleteUserRole(Integer uid);
    int addUserRole(Integer uid,Integer rid);
}