package com.bbs.service.impl;

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
	public SelectorDict selectSelectorDictByDictTypeCode(String dict_order_code) {
		return selectorDictDao.selectSelectorDictByDictOrderCode(dict_order_code);
	}

}
