package com.myspring.gymbaro02.notice.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("noticeVO")
public class NoticeVO {
	private int noticeNo;
	private String title;
	private String content;
	private Date regDate;
	private int uid;
	private String notice_writer;
	private String notice_category;
	private int view_cnt;
	private String impt_notice;
	private String imageFileName;


	public NoticeVO() {}
	
	public NoticeVO(int noticeNo, String title, String content, Date regDate, int uid, String notice_writer, String notice_category, int view_cnt, String impt_notice, String imageFileName) {
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.uid = uid;
		this.notice_writer = notice_writer;
		this.notice_category = notice_category;
		this.view_cnt = view_cnt;
		this.impt_notice = impt_notice;
		this.imageFileName = imageFileName;
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

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public String getNotice_category() {
		return notice_category;
	}

	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public String getImpt_notice() {
		return impt_notice;
	}

	public void setImpt_notice(String impt_notice) {
		this.impt_notice = impt_notice;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
}
