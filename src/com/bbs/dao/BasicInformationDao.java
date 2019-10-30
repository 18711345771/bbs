package com.bbs.dao;

import com.bbs.po.BasicInformation;

public interface BasicInformationDao {
	public Integer addBasicInformation(BasicInformation basicInformation);
	public BasicInformation selectBasicInformation(String username);
	public Integer updateBasicInformation(BasicInformation basicInformation);
}
