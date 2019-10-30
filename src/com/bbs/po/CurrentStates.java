package com.bbs.po;

public class CurrentStates {
		private Integer curstatesId;
	    private Integer userId;
	    private String username;
		private Integer securityscores;//安全得分
		private String lasttimeenter;//上次登录
		private String pswstrength;//密码强度
		private String mobileiden;//手机认证详细
		private Integer mobileidenstate;//手机认证状态
		private String emailiden;//邮箱认证详细
		private Integer emailidenstate;//邮箱认证状态
		public Integer getCurstatesId() {
			return curstatesId;
		}
		public void setCurstatesId(Integer curstatesId) {
			this.curstatesId = curstatesId;
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
		public Integer getSecurityscores() {
			return securityscores;
		}
		public void setSecurityscores(Integer securityscores) {
			this.securityscores = securityscores;
		}
		public String getLasttimeenter() {
			return lasttimeenter;
		}
		public void setLasttimeenter(String lasttimeenter) {
			this.lasttimeenter = lasttimeenter;
		}
		public String getPswstrength() {
			return pswstrength;
		}
		public void setPswstrength(String pswstrength) {
			this.pswstrength = pswstrength;
		}
		public String getMobileiden() {
			return mobileiden;
		}
		public void setMobileiden(String mobileiden) {
			this.mobileiden = mobileiden;
		}
		public Integer getMobileidenstate() {
			return mobileidenstate;
		}
		public void setMobileidenstate(Integer mobileidenstate) {
			this.mobileidenstate = mobileidenstate;
		}
		public String getEmailiden() {
			return emailiden;
		}
		public void setEmailiden(String emailiden) {
			this.emailiden = emailiden;
		}
		public Integer getEmailidenstate() {
			return emailidenstate;
		}
		public void setEmailidenstate(Integer emailidenstate) {
			this.emailidenstate = emailidenstate;
		}
		@Override
		public String toString() {
			return "CurrentStates [curstatesId=" + curstatesId + ",userId=" + userId + ", username=" + username + ", securityscores=" + securityscores
					+ ", lasttimeenter=" + lasttimeenter + ", pswstrength=" + pswstrength + ", mobileiden=" + mobileiden
					+ ", mobileidenstate=" + mobileidenstate + ", emailiden=" + emailiden + ", emailidenstate="
					+ emailidenstate + "]";
		}
}
