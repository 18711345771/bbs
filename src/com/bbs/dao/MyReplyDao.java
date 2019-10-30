package com.bbs.dao;

import java.util.List;
import com.bbs.po.MyReply;

public interface MyReplyDao {
		public List<MyReply> selectMyReplyList(MyReply myReply);
		public Integer  selectMyReplyListCount(String writer);
		public Integer insertMyReply(MyReply myReply);
		public MyReply selectMyReply(Integer id);
		public Integer deleteMyReply(Integer id);
}
