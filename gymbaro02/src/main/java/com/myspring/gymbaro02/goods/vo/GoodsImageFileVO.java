package com.myspring.gymbaro02.goods.vo;

import java.sql.Date;

public class GoodsImageFileVO {
	private int img_id;
	private int goods_id;
	private String fileName;
	private String fileType;
	private int uid;
	private Date uploadDate;
	
	public GoodsImageFileVO() {
		
	}

	public int getImg_id() {
		return img_id;
	}

	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	
	
}
