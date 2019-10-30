package com.bbs.po;

public class ContractInformation {
	private Integer contractId;
	private Integer userId;
	private String username;
	private String realname;
	private String telephone;
	private String linkaddress;
	private String emailcode;
	public Integer getContractId() {
		return contractId;
	}
	public void setContractId(Integer contractId) {
		this.contractId = contractId;
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
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getLinkaddress() {
		return linkaddress;
	}
	public void setLinkaddress(String linkaddress) {
		this.linkaddress = linkaddress;
	}
	public String getEmailcode() {
		return emailcode;
	}
	public void setEmailcode(String emailcode) {
		this.emailcode = emailcode;
	}
	@Override
	public String toString() {
		return "ContractInformation [contractId=" + contractId + ", userId=" + userId + ", username=" + username
				+ ", realname=" + realname + ", telephone=" + telephone + ", linkaddress=" + linkaddress
				+ ", emailcode=" + emailcode + "]";
	}
}
