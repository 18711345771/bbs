package com.bbs.dao;

import com.bbs.po.ContractInformation;

public interface ContractInformationDao {
	public Integer addContractInformation(ContractInformation contractInformation);
	public Integer updateContractInformation(ContractInformation contractInformation);
	public ContractInformation selectContractInformation(String username);
}
