package com.myspring.gymbaro02.community.vo;

import java.util.Date;

// notice table
public class NoticeVO {
	private int noticeNo;
	private String title;
	private String content;
	private Date regDate;
	private int uid;


	public NoticeVO() {}
	
	public NoticeVO(int noticeNo, String title, String content, Date regDate, int uid) {
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.uid = uid;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
}