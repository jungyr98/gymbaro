package com.myspring.gymbaro02.gym.vo;

import java.util.Date;

public class GymReviewVO {
	private int review_id;
	private int uid;
	private int gym_id;
	private String content;
	private int score;
	private Date regDate;


	public GymReviewVO() {}
	
	public GymReviewVO(int review_id, int uid, int gym_id, String content, int score, Date regDate) {
		this.review_id = review_id;
		this.uid = uid;
		this.gym_id = gym_id;
		this.content = content;
		this.score = score;
		this.regDate = regDate;		
	}

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

	public int getGym_id() {
		return gym_id;
	}

	public void setGym_id(int gym_id) {
		this.gym_id = gym_id;
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
	
	



}

