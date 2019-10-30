package com.bbs.po;

public class EducationInformation {
	private Integer educateId;
	private Integer userId;
	private String username;
	private String collegeRecTime;
	private String collegeName;
	private String highSchoolRecTime;
	private String highSchoolName;
	private String careerSchoolRecTime;
	private String careerSchoolName;
	private String midSchoolRecTime;
	private String midSchoolName;
	private String priSchoolRecTime;
	private String priSchoolName;
	public Integer getEducateId() {
		return educateId;
	}
	public void setEducateId(Integer educateId) {
		this.educateId = educateId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCollegeRecTime() {
		return collegeRecTime;
	}
	public void setCollegeRecTime(String collegeRecTime) {
		this.collegeRecTime = collegeRecTime;
	}
	public String getCollegeName() {
		return collegeName;
	}
	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}
	public String getHighSchoolRecTime() {
		return highSchoolRecTime;
	}
	public void setHighSchoolRecTime(String highSchoolRecTime) {
		this.highSchoolRecTime = highSchoolRecTime;
	}
	public String getHighSchoolName() {
		return highSchoolName;
	}
	public void setHighSchoolName(String highSchoolName) {
		this.highSchoolName = highSchoolName;
	}
	public String getCareerSchoolRecTime() {
		return careerSchoolRecTime;
	}
	public void setCareerSchoolRecTime(String careerSchoolRecTime) {
		this.careerSchoolRecTime = careerSchoolRecTime;
	}
	public String getCareerSchoolName() {
		return careerSchoolName;
	}
	public void setCareerSchoolName(String careerSchoolName) {
		this.careerSchoolName = careerSchoolName;
	}
	public String getMidSchoolRecTime() {
		return midSchoolRecTime;
	}
	public void setMidSchoolRecTime(String midSchoolRecTime) {
		this.midSchoolRecTime = midSchoolRecTime;
	}
	public String getMidSchoolName() {
		return midSchoolName;
	}
	public void setMidSchoolName(String midSchoolName) {
		this.midSchoolName = midSchoolName;
	}
	public String getPriSchoolRecTime() {
		return priSchoolRecTime;
	}
	public void setPriSchoolRecTime(String priSchoolRecTime) {
		this.priSchoolRecTime = priSchoolRecTime;
	}
	public String getPriSchoolName() {
		return priSchoolName;
	}
	public void setPriSchoolName(String priSchoolName) {
		this.priSchoolName = priSchoolName;
	}
	@Override
	public String toString() {
		return "EducationInformation [educateId=" + educateId + ", userId=" + userId + ", username=" + username
				+ ", collegeRecTime=" + collegeRecTime + ", collegeName=" + collegeName + ", highSchoolRecTime="
				+ highSchoolRecTime + ", highSchoolName=" + highSchoolName + ", careerSchoolRecTime="
				+ careerSchoolRecTime + ", careerSchoolName=" + careerSchoolName + ", midSchoolRecTime="
				+ midSchoolRecTime + ", midSchoolName=" + midSchoolName + ", priSchoolRecTime=" + priSchoolRecTime
				+ ", priSchoolName=" + priSchoolName + "]";
	}
}
