package com.myspring.gymbaro02.community.vo;

import java.util.Date;

// comment table
public class CommentVO {
	private int articleNo;
	private int commentNo;
	private int uid;
	private String content;
	private Date regDate;

	
	public CommentVO() {}
	
	public CommentVO(int articleNo, int commentNo, int uid, String content, Date regDate) {
		this.articleNo = articleNo;
		this.commentNo = commentNo;
		this.uid = uid;
		this.content = content;
		this.regDate = regDate;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
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
	
	
}
