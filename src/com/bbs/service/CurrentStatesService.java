package com.bbs.service;

import com.bbs.po.CurrentStates;

public interface CurrentStatesService {
	public Integer addCurrentStates(CurrentStates currentStates);
	public Integer updateCurrentStates(CurrentStates currentStates);
	public CurrentStates selectCurrentStates(String username);
}
