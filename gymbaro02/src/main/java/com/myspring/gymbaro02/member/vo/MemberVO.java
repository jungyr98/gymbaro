package com.myspring.gymbaro02.member.vo;

import java.util.Date;

public class MemberVO {
	private int uid;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_gender;
	private String member_type;
	private int member_level;
	private int member_point;
	private String phone_number;
	private String email;
	private String pwdFindQ;
	private String pwdFindA;
	private String zipcode;
	private String roadAddress;
	private String jibunAddress;
	private String extraAddress;
	private String info_yn;
	private Date joinDate;
	private Date deletedDate;
	private String del_yn;
	private String SALT;
	
	public MemberVO() {
		
	}
	
	public MemberVO(int uid, String member_id, String member_pwd, String member_name, String member_gender, String member_type, int member_level, int member_point, String phone_number,
			String email, String pwdFindQ, String pwdFindA, String zipcode, String roadAddress, String jibunAddress, String extraAddress, String info_yn, Date joinDate, Date deletedDate, String del_yn, String SALT) {
		
		this.uid = uid;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_type = member_type;
		this.member_level = member_level;
		this.member_point = member_point;
		this.phone_number = phone_number;
		this.email = email;
		this.pwdFindQ = pwdFindQ;
		this.pwdFindA = pwdFindA;
		this.zipcode = zipcode;
		this.roadAddress = roadAddress;
		this.jibunAddress = jibunAddress;
		this.extraAddress = extraAddress;
		this.info_yn = info_yn;
		this.joinDate = joinDate;
		this.deletedDate = deletedDate;
		this.del_yn = del_yn;
		this.SALT = SALT;
		
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	public int getMember_level() {
		return member_level;
	}
	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwdFindQ() {
		return pwdFindQ;
	}
	public void setPwdFindQ(String pwdFindQ) {
		this.pwdFindQ = pwdFindQ;
	}
	public String getPwdFindA() {
		return pwdFindA;
	}
	public void setPwdFindA(String pwdFindA) {
		this.pwdFindA = pwdFindA;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public String getInfo_yn() {
		return info_yn;
	}
	public void setInfo_yn(String info_yn) {
		this.info_yn = info_yn;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getDeletedDate() {
		return deletedDate;
	}
	public void setDeletedDate(Date deletedDate) {
		this.deletedDate = deletedDate;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getSALT() {
		return SALT;
	}
	public void setSALT(String sALT) {
		SALT = sALT;
	}
	
	
}
