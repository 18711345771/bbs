package com.bbs.dao;

import com.bbs.po.CurrentStates;

public interface CurrentStatesDao {
	public Integer addCurrentStates(CurrentStates currentStates);
	public Integer updateCurrentStates(CurrentStates currentStates);
	public CurrentStates selectCurrentStates(String username);
}
