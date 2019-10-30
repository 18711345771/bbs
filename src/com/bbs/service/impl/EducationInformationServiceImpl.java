package com.bbs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.EducationInformationDao;
import com.bbs.po.EducationInformation;
import com.bbs.service.EducationInformationService;
@Service
public class EducationInformationServiceImpl implements EducationInformationService {

	@Autowired
	EducationInformationDao educationInformationDao;
	
	@Override
	public Integer addEducationInformation(EducationInformation educationInformation) {
		return educationInformationDao.addEducationInformation(educationInformation);
	}

	@Override
	public Integer updateEducationInformation(EducationInformation educationInformation) {
		return educationInformationDao.updateEducationInformation(educationInformation);
	}

	@Override
	public EducationInformation selectEducationInformation(String username) {
		return educationInformationDao.selectEducationInformation(username);
	}

}
