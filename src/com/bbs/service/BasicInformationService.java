package com.bbs.service;

import com.bbs.po.BasicInformation;

public interface BasicInformationService {
	public Integer addBasicInformation(BasicInformation basicInformation);
	public BasicInformation selectBasicInformation(String username);
	public Integer updateBasicInformation(BasicInformation basicInformation);
}
