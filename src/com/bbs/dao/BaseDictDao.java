package com.bbs.dao;

import java.util.List;

import com.bbs.po.BaseDict;

public interface BaseDictDao {
	public BaseDict selectBaseDictById(String id);
	public List<BaseDict> findBaseDictListWithTypeCode(String typecode);
	
}
