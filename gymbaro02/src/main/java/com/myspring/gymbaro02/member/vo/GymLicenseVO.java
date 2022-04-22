package com.myspring.gymbaro02.member.vo;

public class GymLicenseVO {
	private int uid;
	private int license_num;
	
	public GymLicenseVO() {}
	
	public GymLicenseVO(int uid, int license_num) {
		this.uid = uid;
		this.license_num = license_num;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getLicense_num() {
		return license_num;
	}

	public void setLicense_num(int license_num) {
		this.license_num = license_num;
	}
}
