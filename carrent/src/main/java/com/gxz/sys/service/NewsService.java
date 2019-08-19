package com.gxz.sys.service;

import com.gxz.sys.domain.News;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.vo.NewsVo;

public interface NewsService {

	DataGridView queryAllNews(NewsVo newsVo);

	void addNews(NewsVo newsVo);

	void updateNews(NewsVo newsVo);

	void deleteNews(Integer id);

	News queryNewsById(Integer id);

	News queryNewsByTime(NewsVo newsVo);


}
