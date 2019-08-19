package com.gxz.bus.mapper;

import java.util.List;

import com.gxz.bus.domain.Rent;

public interface RentMapper {
    int deleteByPrimaryKey(String rentid);

    int insert(Rent record);

    int insertSelective(Rent record);

    Rent selectByPrimaryKey(String rentid);

    int updateByPrimaryKeySelective(Rent record);

    int updateByPrimaryKey(Rent record);
    
    List<Rent> queryAllRent(Rent rent);
}