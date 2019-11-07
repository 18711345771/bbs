package com.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.SelectorDictDao;
import com.bbs.po.SelectorDict;
import com.bbs.service.SelectorDictService;
@Service
public class SelectorDictServiceImpl implements SelectorDictService {

	@Autowired
	SelectorDictDao selectorDictDao;
	@Override
	public List<SelectorDict> selectSelectorDictByDictTypeCode(String dict_type_code) {
		return selectorDictDao.selectSelectorDictByDictTypeCode(dict_type_code);
	}

}
