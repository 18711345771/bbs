package com.bbs.service;

import com.bbs.po.Experience;

public interface ExperienceService {
	public Experience selectExperienceByuserName(String userName);
	public Integer insertExperienceSelective(Experience experience);
	public Integer updateExperienceSelective(Experience experience);
}
