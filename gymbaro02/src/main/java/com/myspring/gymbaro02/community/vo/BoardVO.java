package com.myspring.gymbaro02.community.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

// board table
@Component("boardVO")
public class BoardVO {
	private int articleNo;
	private String article_category;
	private String title;
	private String content;
	private Date writeDate;
	private String writer;
	private int uid;
	private int view_cnt;
	private int commentNo;
	private int comment_cnt;


	public BoardVO() {}
	
	public BoardVO(int articleNo, String article_category, String title, String content, Date writeDate, String writer, int uid, int view_cnt, int commentNo, int comment_cnt) {
		this.articleNo = articleNo;
		this.article_category = article_category;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.writer = writer;
		this.uid = uid;
		this.view_cnt = view_cnt;
		this.commentNo = commentNo;
		this.comment_cnt = comment_cnt;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	
	public String getArticle_category() {
		return article_category;
	}
	
	public void setArticle_category(String article_category) {
		this.article_category = article_category;
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
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
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
	
	
	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getComment_cnt() {
		return comment_cnt;
	}
	
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}

}