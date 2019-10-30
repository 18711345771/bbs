package com.bbs.dao;

import com.bbs.po.EducationInformation;

public interface EducationInformationDao {
	public Integer addEducationInformation(EducationInformation educationInformation);
	public Integer updateEducationInformation(EducationInformation educationInformation);
	public EducationInformation selectEducationInformation(String username);
}
