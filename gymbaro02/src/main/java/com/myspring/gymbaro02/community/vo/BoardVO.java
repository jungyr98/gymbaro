package com.myspring.gymbaro02.community.vo;

import java.util.Date;

// board table
public class BoardVO {
	private int articleNo;
	private String title;
	private String content;
	private Date writeDate;
	private int uid;
	private int view_cnt;


	public BoardVO() {}
	
	public BoardVO(int articleNo, String title, String content, Date writeDate, int uid, int view_cnt) {
		this.articleNo = articleNo;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.uid = uid;
		this.view_cnt = view_cnt;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	
	



}
