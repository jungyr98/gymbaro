package com.myspring.gymbaro02.goods.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("goodsReviewVO")
public class GoodsReviewVO {
	private int review_id;
	private int uid;
	private String review_writer;
	private String goods_id;
	private String content;
	private int score;
	private Date regDate;
	private int order_count; 
	private int member_level;
	private String order_id;
	private String option_name;
	
	public GoodsReviewVO() {}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getOrder_count() {
		return order_count;
	}

	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}

	public int getMember_level() {
		return member_level;
	}

	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getOption_name() {
		return option_name;
	}

	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	
	
}
