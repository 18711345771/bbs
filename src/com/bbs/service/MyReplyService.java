package com.bbs.service;

import com.bbs.po.MyReply;
import com.bbs.utils.Page;

public interface MyReplyService {
	public Page<MyReply> findMyReplyList(Integer page,Integer rows,String writer);
	public Integer insertMyReply(MyReply myReply);
	public MyReply selectMyReply(Integer id);
	public Integer deleteMyreply(Integer id);
}
