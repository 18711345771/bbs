package com.bbs.service;

import java.util.List;

import com.bbs.po.SelectorDict;

public interface SelectorDictService {
	public List<SelectorDict> selectSelectorDictByDictTypeCode(String dict_type_code);
}
