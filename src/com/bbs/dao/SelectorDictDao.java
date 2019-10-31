package com.bbs.dao;

import com.bbs.po.SelectorDict;

public interface SelectorDictDao {
		public SelectorDict selectSelectorDictByDictOrderCode(String dict_order_code);
}
