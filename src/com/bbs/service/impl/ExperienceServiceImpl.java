package com.bbs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.ExperienceDao;
import com.bbs.po.Experience;
import com.bbs.service.ExperienceService;
@Service
public class ExperienceServiceImpl implements ExperienceService {
	
	@Autowired
	ExperienceDao experienceDao;
	@Override
	public Experience selectExperienceByuserName(String userName) {
		return experienceDao.selectExperienceByuserName(userName);
	}
	@Override
	public Integer insertExperienceSelective(Experience experience) {
		return experienceDao.insertExperienceSelective(experience);
	}
	@Override
	public Integer updateExperienceSelective(Experience experience) {
		return experienceDao.updateExperienceSelective(experience);
	}

}
