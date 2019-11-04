package com.bbs.dao;

import com.bbs.po.Experience;

public interface ExperienceDao {
		public Experience selectExperienceByuserName(String userName);
		public Integer insertExperienceSelective(Experience experience);
		public Integer updateExperienceSelective(Experience experience);
}
