package com.bbs.po;

import java.util.Date;

public class Article {
	private Integer id;//本帖id
	private Integer pid;//父帖id
	private Integer rootid;//根id
	private String editorNo;//所属板块
	private String type;//帖子类型
	private String title;//标题
	private String context;//内容
	private Date datatime;//发帖时间
	private String writer;//作者
	private String  wheadicon;//作者头像
	private Integer viewcount;//帖子浏览量
	private Integer replycount;//帖子回复量
	private Integer isleaf;//是否为叶子结点，1表示是叶子结点，0表示不是叶子结点
	private Integer start;//起始行
	private Integer rows;//每页数
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Integer getRootid() {
		return rootid;
	}
	public void setRootid(Integer rootid) {
		this.rootid = rootid;
	}
	public String getEditorNo() {
		return editorNo;
	}
	public void setEditorNo(String editorNo) {
		this.editorNo = editorNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getDatatime() {
		return datatime;
	}
	public void setDatatime(Date datatime) {
		this.datatime = datatime;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWheadicon() {
		return wheadicon;
	}
	public void setWheadicon(String wheadicon) {
		this.wheadicon = wheadicon;
	}
	public Integer getViewcount() {
		return viewcount;
	}
	public void setViewcount(Integer viewcount) {
		this.viewcount = viewcount;
	}
	public Integer getReplycount() {
		return replycount;
	}
	public void setReplycount(Integer replycount) {
		this.replycount = replycount;
	}
	public Integer getIsleaf() {
		return isleaf;
	}
	public void setIsleaf(Integer isleaf) {
		this.isleaf = isleaf;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", pid=" + pid + ", rootid=" + rootid + ", editorNo=" + editorNo + ", type=" + type
				+ ", title=" + title + ", context=" + context + ", datatime=" + datatime + ", writer=" + writer+ ", wheadicon=" + wheadicon
				+ ", viewcount=" + viewcount + ", replycount=" + replycount + ", isleaf=" + isleaf + ", start=" + start
				+ ", rows=" + rows + "]";
	}
}
