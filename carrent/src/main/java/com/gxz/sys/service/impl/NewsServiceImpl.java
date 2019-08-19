package com.gxz.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.gxz.sys.domain.News;
import com.gxz.sys.mapper.NewsMapper;
import com.gxz.sys.service.NewsService;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.vo.NewsVo;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsMapper newsMapper;

	@Override
	public DataGridView queryAllNews(NewsVo newsVo) {
		Page<Object> page = PageHelper.startPage(newsVo.getPage(), newsVo.getRows());
		List<News> list = newsMapper.queryAllNews(newsVo);
		return new DataGridView(page.getTotal(),list);
	}

	@Override
	public void addNews(NewsVo newsVo) {
		newsMapper.insertSelective(newsVo);
	}

	@Override
	public void updateNews(NewsVo newsVo) {
		newsMapper.updateByPrimaryKeySelective(newsVo);
	}

	@Override
	public void deleteNews(Integer id) {
		newsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public News queryNewsById(Integer id) {
		return newsMapper.selectByPrimaryKey(id);
	}

	@Override
	public News queryNewsByTime(NewsVo newsVo) {
		return newsMapper.queryNewsByTime(newsVo);
	}


}
