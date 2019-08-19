package com.gxz.bus.mapper;

import java.util.List;

import com.gxz.bus.domain.Check;

public interface CheckMapper {
    int deleteByPrimaryKey(String checkid);

    int insert(Check record);

    int insertSelective(Check record);

    Check selectByPrimaryKey(String checkid);

    int updateByPrimaryKeySelective(Check record);

    int updateByPrimaryKey(Check record);
    
    List<Check> queryAllCheck(Check check);
}