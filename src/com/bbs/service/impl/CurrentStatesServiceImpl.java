package com.bbs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.CurrentStatesDao;
import com.bbs.po.CurrentStates;
import com.bbs.service.CurrentStatesService;
@Service
public class CurrentStatesServiceImpl implements CurrentStatesService {
	
	@Autowired
	CurrentStatesDao currentStatesDao;
	
	@Override
	public Integer addCurrentStates(CurrentStates currentStates) {
		return currentStatesDao.addCurrentStates(currentStates);
	}

	@Override
	public Integer updateCurrentStates(CurrentStates currentStates) {
		return currentStatesDao.updateCurrentStates(currentStates);
	}

	@Override
	public CurrentStates selectCurrentStates(String username) {
		return currentStatesDao.selectCurrentStates(username);
	}

}
