package com.bbs.po;

import java.util.Date;

public class MyReply {
		private Integer id;//������id
		private Integer reply_id;//�ظ������ӵ�id
		private String writer;//���������֣���Ϊ�����
		private String reply_title;
		private Integer reply_viewcount;//�ظ������ӵ�viewcount
		private Integer reply_replycount;
		private String reply_editorNo;
		private Date reply_datetime;
		
		private Integer start;//��ʼҳ
		private Integer rows;//���������
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public Integer getReply_id() {
			return reply_id;
		}
		public void setReply_id(Integer reply_id) {
			this.reply_id = reply_id;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public Integer getReply_viewcount() {
			return reply_viewcount;
		}
		public void setReply_viewcount(Integer reply_viewcount) {
			this.reply_viewcount = reply_viewcount;
		}
		public Integer getReply_replycount() {
			return reply_replycount;
		}
		public void setReply_replycount(Integer reply_replycount) {
			this.reply_replycount = reply_replycount;
		}
		public String getReply_editorNo() {
			return reply_editorNo;
		}
		public void setReply_editorNo(String reply_editorNo) {
			this.reply_editorNo = reply_editorNo;
		}
		public Date getReply_datetime() {
			return reply_datetime;
		}
		public void setReply_datetime(Date reply_datetime) {
			this.reply_datetime = reply_datetime;
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
		public String getReply_title() {
			return reply_title;
		}
		public void setReply_title(String reply_title) {
			this.reply_title = reply_title;
		}
		@Override
		public String toString() {
			return "MyReply [id=" + id + ", reply_id=" + reply_id + ", writer=" + writer + ", reply_title="
					+ reply_title + ", reply_viewcount=" + reply_viewcount + ", reply_replycount=" + reply_replycount
					+ ", reply_editorNo=" + reply_editorNo + ", reply_datetime=" + reply_datetime + ", start=" + start
					+ ", rows=" + rows + "]";
		}
}
