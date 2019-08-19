package com.gxz.sys.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.domain.News;
import com.gxz.sys.service.NewsService;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.utils.jsondata.ResultObj;
import com.gxz.sys.vo.NewsVo;


@Controller
@RequestMapping("news")
public class NewsController {

	@Autowired
	private NewsService newsService;
	
	@RequestMapping("toNewsManager")
	public String toNewsManager(){
		return "forward:/WEB-INF/view/system/newsManager.jsp";
	}
	
	@RequestMapping("loadAllNews")
	@ResponseBody
	public DataGridView loadAllNews(NewsVo newsVo){
		return newsService.queryAllNews(newsVo);
	}
	
	@RequestMapping("addNews")
	@ResponseBody
	public ResultObj addNews(NewsVo newsVo){
		ResultObj obj = null;
		try {
			newsVo.setCreatetime(new Timestamp(System.currentTimeMillis()));
			newsService.addNews(newsVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("updateNews")
	@ResponseBody
	public ResultObj updateNews(NewsVo newsVo){
		ResultObj obj = null;
		try {
			newsVo.setCreatetime(new Timestamp(System.currentTimeMillis()));
			newsService.updateNews(newsVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
			
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("deleteNews")
	@ResponseBody
	public ResultObj deleteNews(NewsVo newsVo){
		ResultObj obj = null;
		try {
			newsService.deleteNews(newsVo.getId());
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
			
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("queryNewsById")
	@ResponseBody
	public News queryNewsById(NewsVo newsVo){
		News news = newsService.queryNewsById(newsVo.getId());
		return news;
	}
	//首页的点击通过时间查询出新闻内容
	@RequestMapping("queryNewsByTime")
	@ResponseBody
	public News queryNewsByTime(NewsVo newsVo){
		News news = newsService.queryNewsByTime(newsVo);
		return news;
	}
	
	public static void main(String[] args) throws ParseException {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = "1999-11-10";
		Date date = sdf1.parse(str);
		date.setMonth(date.getDay()+1);
		System.out.println(date.getMonth());
		System.out.println(date.toLocaleString());
		
	}
	
}
