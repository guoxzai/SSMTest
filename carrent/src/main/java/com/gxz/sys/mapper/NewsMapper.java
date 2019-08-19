package com.gxz.sys.mapper;

import java.util.List;

import com.gxz.sys.domain.News;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
    
    List<News> queryAllNews(News news);
    
    //首页根据时间  查询新闻呢信息
    News queryNewsByTime(News news);
    
}