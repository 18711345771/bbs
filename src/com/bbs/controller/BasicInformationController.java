package com.bbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.po.BasicInformation;
import com.bbs.po.User;
import com.bbs.service.BasicInformationService;
import com.bbs.service.UserService;

@Controller
public class BasicInformationController {

	@Autowired
	UserService userService;

	@Autowired
	BasicInformationService basicInformationService;

	@RequestMapping("/bbs/savebasicinformation.action")
	@ResponseBody
	public String uploadBasicInformation(
			String genderoptions, String birthday,
			String country,String province,
			String city,String introduce,
			String industry,String position,
			String personallabels,HttpServletRequest req) {

		//System.out.println(city);

		BasicInformation basicInformation = new BasicInformation();
		User userTemp=(User) req.getSession().getAttribute("UserInfo");
		User user = new User();
		user = userService.selectUserByUsername(userTemp.getUsername());
		Integer userId = user.getId();

		basicInformation.setUserId(userId);
		basicInformation.setUsername(userTemp.getUsername());
		basicInformation.setGender(genderoptions);
		basicInformation.setIntroduce(introduce);
		basicInformation.setIndustry(industry);
		basicInformation.setPosition(position);
		basicInformation.setPersonallabels(personallabels);
		basicInformation.setBirthday(birthday);

		// ·â×°µØÖ·
		String address = null;
		if("0".equals(province)){
			address = country + "/" + "---" + "/" + city;
		}else{
			address = country + "/" + province + "/" + city;
		}
		basicInformation.setAddress(address);

		BasicInformation basicInformationTemp = new BasicInformation();
		basicInformationTemp = basicInformationService.selectBasicInformation(userTemp.getUsername());
		if (basicInformationTemp != null) {
			basicInformationService.updateBasicInformation(basicInformation);
		} else {
			basicInformationService.addBasicInformation(basicInformation);
		}
		return "OK";
	}
	@RequestMapping(value="/bbs/getbasicinformation.action")
	@ResponseBody
	public BasicInformation getBasicInformation(HttpServletRequest req){
		User user=(User) req.getSession().getAttribute("UserInfo");
		BasicInformation basicInformation=basicInformationService.selectBasicInformation(user.getUsername());
		return basicInformation;
	}
}
