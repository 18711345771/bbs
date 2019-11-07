package com.bbs.dao;

import java.util.List;

import com.bbs.po.SelectorDict;

public interface SelectorDictDao {
		public List<SelectorDict> selectSelectorDictByDictTypeCode(String dict_type_code);
}
