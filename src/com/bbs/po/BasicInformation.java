package com.bbs.po;

public class BasicInformation {
	private Integer basicId;//表单id
	private Integer userId;//用户id
	private String username;//用户名
	private String gender;//用户性别
	private String birthday;//生日
	private String address;//居住地址
	private String introduce;//自我简介
	private String industry;//所属行业
	private String position;//职业
	private String personallabels;//我的标签

	public Integer getBasicId() {
		return basicId;
	}

	public void setBasicId(Integer basicId) {
		this.basicId = basicId;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPersonallabels() {
		return personallabels;
	}

	public void setPersonallabels(String personallabels) {
		this.personallabels = personallabels;
	}

	@Override
	public String toString() {
		return "BasicInformation [basicId=" + basicId + ", userId=" + userId + ", username=" + username + ", gender="
				+ gender + ", birthday=" + birthday + ", address=" + address + ", introduce=" + introduce
				+ ", industry=" + industry + ", position=" + position + ", personallabels=" + personallabels + "]";
	}
}
