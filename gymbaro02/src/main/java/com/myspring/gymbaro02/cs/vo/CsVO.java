package com.myspring.gymbaro02.cs.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("CsVO")
public class CsVO {
	private int csNO; //±Û¹øÈ£
	private int uid;
	private int goods_id;
	private String title;
	private String txtContent;
	private Date writeDate;
	private String processing_status;
	private String cs_category;
	private String writer;
	private String secret;
	
	public CsVO() {
		
	}
	
	public int getcsNO() {
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
	
	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getTxtContent() {
		return txtContent;
	}

	public void setTxtContent(String txtContent) {
		this.txtContent = txtContent;
	}

	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getProcessing_status() {
		return processing_status;
	}
	public void setProcessing_status(String processing_status) {
		this.processing_status = processing_status;
	}
	
	public String getCs_category() {
		return cs_category;
	}

	public void setCs_category(String cs_category) {
		this.cs_category = cs_category;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}
}
