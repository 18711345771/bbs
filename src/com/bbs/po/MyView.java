package com.bbs.po;

import java.util.Date;

public class MyView {
	private Integer id;//������id
	private Integer view_id;//��������ӵ�id
	private String writer;//���������֣���Ϊ�����
	private String  view_title;
	private Integer view_viewcount;//��������ӵ�viewcount
	private Integer view_replycount;
	private String view_editorNo;
	private Date view_datetime;
	
	private Integer start;//��ʼҳ
	private Integer rows;//���������
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getView_id() {
		return view_id;
	}
	public void setView_id(Integer view_id) {
		this.view_id = view_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Integer getView_viewcount() {
		return view_viewcount;
	}
	public void setView_viewcount(Integer view_viewcount) {
		this.view_viewcount = view_viewcount;
	}
	public Integer getView_replycount() {
		return view_replycount;
	}
	public void setView_replycount(Integer view_replycount) {
		this.view_replycount = view_replycount;
	}
	public String getView_editorNo() {
		return view_editorNo;
	}
	public void setView_editorNo(String view_editorNo) {
		this.view_editorNo = view_editorNo;
	}
	public Date getView_datetime() {
		return view_datetime;
	}
	public void setView_datetime(Date view_datetime) {
		this.view_datetime = view_datetime;
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
	public String getView_title() {
		return view_title;
	}
	public void setView_title(String view_title) {
		this.view_title = view_title;
	}
	@Override
	public String toString() {
		return "MyView [id=" + id + ", view_id=" + view_id + ", writer=" + writer + ", view_title=" + view_title
				+ ", view_viewcount=" + view_viewcount + ", view_replycount=" + view_replycount + ", view_editorNo="
				+ view_editorNo + ", view_datetime=" + view_datetime + ", start=" + start + ", rows=" + rows + "]";
	}
	
}
