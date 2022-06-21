package com.myspring.gymbaro02.cs.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("csCommentVO")
public class CsCommentVO {
	private int cs_commentNO;
	private int csNO;
	private int uid;
	private String commentContent;
	private Date writeDate;
	private String writer;
	public int getCs_commentNO() {
		return cs_commentNO;
	}
	public void setCs_commentNO(int cs_commentNO) {
		this.cs_commentNO = cs_commentNO;
	}
	public int getCsNO() {
		return csNO;
	}
	public void setCsNO(int csNO) {
		this.csNO = csNO;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
}
