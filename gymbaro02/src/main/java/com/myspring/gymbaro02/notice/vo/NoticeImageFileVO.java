package com.myspring.gymbaro02.notice.vo;

import org.springframework.stereotype.Component;

@Component("noticeImageFileVO")
public class NoticeImageFileVO {
	private int imageFileNo;
	private String imageFileName;
	private int noticeNo;
	
	public NoticeImageFileVO() {}

	public int getImageFileNo() {
		return imageFileNo;
	}

	public void setImageFileNo(int imageFileNo) {
		this.imageFileNo = imageFileNo;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
}
