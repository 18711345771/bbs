package com.bbs.controller;

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
	public BasicInformation uploadBasicInformation(@RequestParam("userName") String username,
			@RequestParam("genderoptions") String gender, @RequestParam("birthday") String birthday,
			@RequestParam("country") String country, @RequestParam("province") String province,
			@RequestParam("city") String city, @RequestParam("introduce") String introduce,
			@RequestParam("industry") String industry, @RequestParam("position") String position,
			@RequestParam("tagsinput") String personallabels) {

		System.out.println(city);

		BasicInformation basicInformation = new BasicInformation();
		User user = new User();
		user = userService.selectUserByUsername(username);
		Integer userId = user.getId();

		basicInformation.setUserId(userId);
		basicInformation.setUsername(username);
		basicInformation.setGender(gender);
		basicInformation.setIntroduce(introduce);
		basicInformation.setIndustry(industry);
		basicInformation.setPosition(position);
		basicInformation.setPersonallabels(personallabels);
		if (birthday.indexOf("00 ")>0) {
			birthday = birthday.substring(0, birthday.indexOf("00"));
		}
		basicInformation.setBirthday(birthday);

		// ·â×°µØÖ·
		String address = country + "/" + province + "/" + city;
		basicInformation.setAddress(address);

		BasicInformation basicInformationTemp = new BasicInformation();
		basicInformationTemp = basicInformationService.selectBasicInformation(username);
		if (basicInformationTemp != null) {
			basicInformationService.updateBasicInformation(basicInformation);
		} else {
			basicInformationService.addBasicInformation(basicInformation);
		}
		return basicInformation;
	}
}
