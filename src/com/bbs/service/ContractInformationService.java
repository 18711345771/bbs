package com.bbs.service;

import com.bbs.po.ContractInformation;

public interface ContractInformationService {
	public Integer addContractInformation(ContractInformation contractInformation);
	public Integer updateContractInformation(ContractInformation contractInformation);
	public ContractInformation selectContractInformation(String username);
}
