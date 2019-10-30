package com.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.MyViewDao;
import com.bbs.po.MyView;
import com.bbs.service.MyViewService;
import com.bbs.utils.Page;
@Service("myViewService")
public class MyViewServiceImpl implements MyViewService {

	@Autowired
	MyViewDao  myViewDao;
	
	@Override
	public Page<MyView> findMyViewList( Integer page,Integer rows,String writer) {
		MyView myView=new MyView();
		myView.setWriter(writer);
		myView.setStart(rows*(page-1));
		myView.setRows(rows);
		
		List<MyView> myViews=myViewDao.selectMyViewList(myView);
		Integer count =myViewDao.selectMyViewListCount(writer);
		Page<MyView> results=new Page<>();
		results.setPage(page);
		results.setRows(myViews);
		results.setSize(rows);
		results.setTotal(count);
		return results;
	}

	@Override
	public Integer insertMyView(MyView myView) {
		return myViewDao.insertMyView(myView);
	}

	@Override
	public MyView selectMyView(Integer id) {
		return myViewDao.selectMyView(id);
	}

}
