package com.bbs.service;

import com.bbs.po.MyView;
import com.bbs.utils.Page;

public interface MyViewService {
	public Page<MyView> findMyViewList(Integer page,Integer rows,String writer);
	public Integer insertMyView(MyView myView);
	public MyView selectMyView(Integer id);
}
