package com.myspring.gymbaro02.gym.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("gymReviewVO")
public class GymReviewVO {
	private int review_id;
	private int uid;
	private int gym_id;
	private String content;
	private int score_gym;
	private int score_instructor;
	private int score_access;
	private Date regDate;
	private String review_writer;
	private String membership_id;
	private int member_level;


	public GymReviewVO() {}
	
	public GymReviewVO(int review_id, int uid, int gym_id, String content, int score, Date regDate) {
		this.review_id = review_id;
		this.uid = uid;
		this.gym_id = gym_id;
		this.content = content;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getScore_gym() {
		return score_gym;
	}

	public void setScore_gym(int score_gym) {
		this.score_gym = score_gym;
	}

	public int getScore_instructor() {
		return score_instructor;
	}

	public void setScore_instructor(int score_instructor) {
		this.score_instructor = score_instructor;
	}

	public int getScore_access() {
		return score_access;
	}

	public void setScore_access(int score_access) {
		this.score_access = score_access;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public String getMembership_id() {
		return membership_id;
	}

	public void setMembership_id(String membership_id) {
		this.membership_id = membership_id;
	}

	public int getMember_level() {
		return member_level;
	}

	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}
	
	



}

