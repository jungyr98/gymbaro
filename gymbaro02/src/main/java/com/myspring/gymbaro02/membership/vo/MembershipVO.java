package com.myspring.gymbaro02.membership.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("membershipVO")
public class MembershipVO {
	private String membership_id;
	private int uid;
	private String name;
	private String gender;
	private String birth;
	private String phone_number;
	private String zipcode;
	private String roadAddress;
	private String extraAddress;
	private int gym_id;
	private String gym_name;
	private String first_option;
	private String second_option;
	private Date start_date;
	private Date last_date;
	private String alarm_yn;
	private String payment;
	private int total_price;
	private String membership_state;
	private Date regDate;
	private String fileName;
	
	public MembershipVO() {
		
	}
	
	public MembershipVO(String membership_id, int uid, int gym_id, String phone_number, Date start_date, Date last_date, String alarm_yn, String payment, int total_price, String membership_state, Date regDate) {
		this.membership_id = membership_id;
		this.uid = uid;
		this.gym_id = gym_id;
		this.phone_number = phone_number;
		this.start_date = start_date;
		this.last_date = last_date;
		this.alarm_yn = alarm_yn;
		this.payment = payment;
		this.total_price = total_price;
		this.membership_state = membership_state;
		this.regDate = regDate;
	}
	
	public String getMembership_id() {
		return membership_id;
	}
	public void setMembership_id(String membership_id) {
		this.membership_id = membership_id;
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
	
	public String getGym_name() {
		return gym_name;
	}

	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}

	public String getFirst_option() {
		return first_option;
	}

	public void setFirst_option(String first_option) {
		this.first_option = first_option;
	}

	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
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

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddres(String extraAddres) {
		this.extraAddress = extraAddres;
	}

	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getSecond_option() {
		return second_option;
	}

	public void setSecond_option(String second_option) {
		this.second_option = second_option;
	}

	public Date getLast_date() {
		return last_date;
	}
	public void setLast_date(Date last_date) {
		this.last_date = last_date;
	}
	public String getAlarm_yn() {
		return alarm_yn;
	}
	public void setAlarm_yn(String alarm_yn) {
		this.alarm_yn = alarm_yn;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getMembership_state() {
		return membership_state;
	}
	public void setMembership_state(String membership_state) {
		this.membership_state = membership_state;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
