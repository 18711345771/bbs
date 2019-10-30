package com.bbs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.BasicInformationDao;
import com.bbs.po.BasicInformation;
import com.bbs.service.BasicInformationService;

@Service
public class BasicInformationServiceImpl implements BasicInformationService {

	@Autowired
	BasicInformationDao basicInformationDao;
	
	@Override
	public Integer addBasicInformation(BasicInformation basicInformation) {
		return basicInformationDao.addBasicInformation(basicInformation);
	}

	@Override
	public BasicInformation selectBasicInformation(String username) {
		return basicInformationDao.selectBasicInformation(username);
	}

	@Override
	public Integer updateBasicInformation(BasicInformation basicInformation) {
		return basicInformationDao.updateBasicInformation(basicInformation);
	}

}
