package com.myspring.gymbaro02.community.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

// comment table
@Component("commentVO")
public class CommentVO {
	private int articleNo;
	private int commentNo;
	private int uid;
	private String comment_writer;
	private String comment_content;
	private Date regDate;
	private int comment_cnt; 
	private String title;
	
	public CommentVO() {}
	
	public CommentVO(int articleNo, int commentNo, int uid, String comment_writer, String comment_content, Date regDate, int comment_cnt) {
		this.articleNo = articleNo;
		this.commentNo = commentNo;
		this.uid = uid;
		this.comment_writer = comment_writer;
		this.comment_content = comment_content;
		this.regDate = regDate;
		this.comment_cnt  = comment_cnt; 
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

	public String getComment_writer() {
		return comment_writer;
	}

	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getComment_cnt() {
		return comment_cnt;
	}

	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
