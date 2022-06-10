package com.myspring.gymbaro02.liked.vo;

import org.springframework.stereotype.Component;

@Component("likedVO")
public class LikedVO {
	private int liked_id;
	private int gym_id;
	private int uid;
	private String gym_name;
	private String fileName;
	
	public LikedVO() {
		
	}

	public int getLiked_id() {
		return liked_id;
	}

	public void setLiked_id(int liked_id) {
		this.liked_id = liked_id;
	}

	public int getGym_id() {
		return gym_id;
	}

	public void setGym_id(int gym_id) {
		this.gym_id = gym_id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getGym_name() {
		return gym_name;
	}

	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
