package com.gxz.bus.mapper;

import java.util.List;

import com.gxz.bus.domain.Car;
import com.gxz.bus.vo.CarVo;

public interface CarMapper {
    int deleteByPrimaryKey(String carnumber);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(String carnumber);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);
    
    List<Car> queryAllCar(CarVo carVo);
}