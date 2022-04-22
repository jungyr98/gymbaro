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
}
