package com.bbs.po;

import java.util.Date;

public class Experience {
		private Integer id;
		private Integer userId; 
		private String userName;
		private Date firstTime;
		private Date previousTime;
		private Date recentTime;
		private String ipAddress;
		private Integer dynamicDays;
		private Integer upgradeDays;
		private String currentLevel;
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public Integer getUserId() {
			return userId;
		}
		public void setUserId(Integer userId) {
			this.userId = userId;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public Date getFirstTime() {
			return firstTime;
		}
		public void setFirstTime(Date firstTime) {
			this.firstTime = firstTime;
		}
		public Date getPreviousTime() {
			return previousTime;
		}
		public void setPreviousTime(Date previousTime) {
			this.previousTime = previousTime;
		}
		public Date getRecentTime() {
			return recentTime;
		}
		public void setRecentTime(Date recentTime) {
			this.recentTime = recentTime;
		}
		public String getIpAddress() {
			return ipAddress;
		}
		public void setIpAddress(String ipAddress) {
			this.ipAddress = ipAddress;
		}
		public Integer getDynamicDays() {
			return dynamicDays;
		}
		public void setDynamicDays(Integer dynamicDays) {
			this.dynamicDays = dynamicDays;
		}
		public Integer getUpgradeDays() {
			return upgradeDays;
		}
		public void setUpgradeDays(Integer upgradeDays) {
			this.upgradeDays = upgradeDays;
		}
		public String getCurrentLevel() {
			return currentLevel;
		}
		public void setCurrentLevel(String currentLevel) {
			this.currentLevel = currentLevel;
		}
		@Override
		public String toString() {
			return "Experience [id=" + id + ", userId=" + userId + ", userName=" + userName + ", firstTime=" + firstTime
					+ ", previousTime=" + previousTime + ", recentTime=" + recentTime + ", ipAddress=" + ipAddress
					+ ", dynamicDays=" + dynamicDays + ", upgradeDays=" + upgradeDays +", currentLevel="+ currentLevel +"]";
		}
}
