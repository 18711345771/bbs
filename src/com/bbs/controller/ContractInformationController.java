package com.bbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.po.ContractInformation;
import com.bbs.po.User;
import com.bbs.service.ContractInformationService;
import com.bbs.service.UserService;

@Controller
public class ContractInformationController {
	
	@Autowired
	ContractInformationService contractInformationService;
	
	@RequestMapping("/bbs/savecontractinformation.action")
	@ResponseBody
	public ContractInformation saveContractInformation(String realname,String telephone,String linkaddress,String emailcode,HttpServletRequest req) {
		User user=(User) req.getSession().getAttribute("UserInfo");
		ContractInformation contractInformation=new ContractInformation();
		if (user!=null) {
			contractInformation.setUserId(user.getId());
			contractInformation.setUsername(user.getUsername());
		}
		contractInformation.setRealname(realname);
		contractInformation.setTelephone(telephone);
		contractInformation.setLinkaddress(linkaddress);
		contractInformation.setEmailcode(emailcode);
		
		ContractInformation contractInformationTemp =new ContractInformation();
		contractInformationTemp=contractInformationService.selectContractInformation(user.getUsername());
		
		if (contractInformationTemp!=null) {
			contractInformationService.updateContractInformation(contractInformation);
		}else {
			contractInformationService.addContractInformation(contractInformation);
		}
		return contractInformation;
	}
}
