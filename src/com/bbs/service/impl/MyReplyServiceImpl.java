package com.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.MyReplyDao;
import com.bbs.po.MyReply;
import com.bbs.service.MyReplyService;
import com.bbs.utils.Page;

@Service("myReplyService")
public class MyReplyServiceImpl implements MyReplyService {

	@Autowired
	MyReplyDao  myReplyDao;
	
	@Override
	public Page<MyReply> findMyReplyList( Integer page,Integer rows,String writer) {
		MyReply myReply=new MyReply();
		myReply.setWriter(writer);
		myReply.setStart(rows*(page-1));
		myReply.setRows(rows);
		
		List<MyReply> myreplys=myReplyDao.selectMyReplyList(myReply);
		Integer count =myReplyDao.selectMyReplyListCount(writer);
		Page<MyReply> results=new Page<>();
		results.setPage(page);
		results.setRows(myreplys);
		results.setSize(rows);
		results.setTotal(count);
		return results;
	}

	@Override
	public Integer insertMyReply(MyReply myReply) {
		return myReplyDao.insertMyReply(myReply);
	}

	@Override
	public MyReply selectMyReply(Integer id) {
		return myReplyDao.selectMyReply(id);
	}

	@Override
	public Integer deleteMyreply(Integer id) {
		return myReplyDao.deleteMyReply(id);
	}

}
