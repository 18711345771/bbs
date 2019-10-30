package com.bbs.dao;

import java.util.List;

import com.bbs.po.MyView;

public interface MyViewDao {
	public List<MyView> selectMyViewList(MyView myView);
	public Integer  selectMyViewListCount(String writer);
	public Integer insertMyView(MyView myView);
	public MyView selectMyView(Integer id);
}
