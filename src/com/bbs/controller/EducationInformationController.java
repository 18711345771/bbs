package com.bbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.po.EducationInformation;
import com.bbs.po.User;
import com.bbs.service.EducationInformationService;

@Controller
public class EducationInformationController {

	@Autowired
	EducationInformationService educationInformationService;

	@RequestMapping("/bbs/saveeducationinformation.action")
	@ResponseBody
	public String saveEducationInformation(String collegeRecruitTime, String province, String city,
			String school, String highSchoolRecruitTime, String highSchoolName, String careerSchoolRecruitTime,
			String careerSchoolName, String middleSchoolRecruitTime, String middleSchoolName,
			String primarySchoolRecruitTime, String primarySchoolName,HttpServletRequest req) {
		
		User user=(User) req.getSession().getAttribute("UserInfo");
		EducationInformation educationInformation = new EducationInformation();
		if(user!=null){
			educationInformation.setUserId(user.getId());
			educationInformation.setUsername(user.getUsername());
		}
		educationInformation.setCareerSchoolName(careerSchoolName);
		educationInformation.setCareerSchoolRecTime(careerSchoolRecruitTime);
		educationInformation.setCollegeRecTime(collegeRecruitTime);
		String collegeName=province+'/'+city+'/'+school;
		educationInformation.setCollegeName(collegeName);
		educationInformation.setHighSchoolRecTime(highSchoolRecruitTime);
		educationInformation.setHighSchoolName(highSchoolName);
		educationInformation.setMidSchoolRecTime(middleSchoolRecruitTime);
		educationInformation.setMidSchoolName(middleSchoolName);
		educationInformation.setPriSchoolRecTime(primarySchoolRecruitTime);
		educationInformation.setPriSchoolName(primarySchoolName);
		
		EducationInformation educationInformationTemp=new EducationInformation();
		educationInformationTemp=educationInformationService.selectEducationInformation(user.getUsername());
		
		if(educationInformationTemp!=null){
			educationInformationService.updateEducationInformation(educationInformation);
		}else{
			educationInformationService.addEducationInformation(educationInformation);
		}
		return "OK";
	}
	@RequestMapping("/bbs/getEducationInformation.action")
	@ResponseBody
	public String saveEducationInformation(String username){
		EducationInformation educationinfo=educationInformationService.selectEducationInformation(username);
		if(educationinfo!=null){
			return "OK";
		}else{
			return "FAIL";
		}
	}
}
