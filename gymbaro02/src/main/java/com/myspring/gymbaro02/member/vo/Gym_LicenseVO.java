package com.myspring.gymbaro02.member.vo;

public class Gym_LicenseVO {
	private  int uid;
	private String license_num;
	
	public Gym_LicenseVO() {
		
	}
	
	public Gym_LicenseVO(int uid, String license_num) {
		this.uid = uid;
		this.license_num = license_num;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getLicense_num() {
		return license_num;
	}

	public void setLicense_num(String license_num) {
		this.license_num = license_num;
	}
	
	
}
