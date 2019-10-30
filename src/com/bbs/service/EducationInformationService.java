package com.bbs.service;

import com.bbs.po.EducationInformation;

public interface EducationInformationService {
		public Integer addEducationInformation(EducationInformation educationInformation);
		public Integer updateEducationInformation(EducationInformation educationInformation);
		public EducationInformation selectEducationInformation(String username);

}
