package com.bbs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.ContractInformationDao;
import com.bbs.po.ContractInformation;
import com.bbs.service.ContractInformationService;
@Service
public class ContractInformationServiceImpl implements ContractInformationService {

	@Autowired
	ContractInformationDao contractInformationDao;
	
	@Override
	public Integer addContractInformation(ContractInformation contractInformation) {
		return contractInformationDao.addContractInformation(contractInformation);
	}

	@Override
	public Integer updateContractInformation(ContractInformation contractInformation) {
		return contractInformationDao.updateContractInformation(contractInformation);
	}

	@Override
	public ContractInformation selectContractInformation(String username) {
		return contractInformationDao.selectContractInformation(username);
	}

}
