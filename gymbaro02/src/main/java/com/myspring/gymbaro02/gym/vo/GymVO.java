package com.myspring.gymbaro02.gym.vo;

import java.util.Date;

public class GymVO {
	private int gym_id;
	private int uid;
	private String gym_name;
	private String hp;
	private String firstAddress;
	private String extraAddress;
	private String first_option;
	private String gym_intro;
	private String program_list;
	private String kakao_addr;
	private String insta_addr;
	private String fbook_addr;
	private String nblog_addr;
	private String home_addr;
	private int price_info1;
	private int price_info2;
	private int price_info3;
	private int price_info4;
	private int price_info5;
	private String service;
	private String time_info;
	private String recommand;
	private Date regDate; 
	private String gym_fileName;
	private Double distance;
	private String state;
	private int member_count;


public GymVO() {}

public GymVO(int gym_id, int uid, String gym_name, String zipcode, String roadAddress, String jibunAddress, String extraAddress, String gym_intro, 
		String program_list, String insta_addr, String fbook_addr, String nblog_addr, String home_addr, int price_info1, int price_info2, int price_info3, int price_info4, int price_info5, 
		String service, Date regDate) {

	this.gym_id = gym_id;
	this.uid = uid;
	this.gym_name = gym_name;
	this.extraAddress = extraAddress;
	this.gym_intro = gym_intro;
	this.program_list = program_list;
	this.insta_addr = insta_addr;
	this.fbook_addr = fbook_addr;
	this.nblog_addr = nblog_addr;
	this.home_addr = home_addr;
	this.price_info1 = price_info1;
	this.price_info2 = price_info2;
	this.price_info3 = price_info3;
	this.price_info4 = price_info4;
	this.price_info5 = price_info5;
	this.service = service;
	this.regDate = regDate;
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
		
		public String getHp() {
			return hp;
		}

		public void setHp(String hp) {
			this.hp = hp;
		}

		public String getExtraAddress() {
			return extraAddress;
		}
		
		public void setExtraAddress(String extraAddress) {
			this.extraAddress = extraAddress;
		}
		
		public String getGym_intro() {
			return gym_intro;
		}
		
		public void setGym_intro(String gym_intro) {
			this.gym_intro = gym_intro;
		}
		
		public String getProgram_list() {
			return program_list;
		}
		
		public void setProgram_list(String program_list) {
			this.program_list = program_list;
		}
		
		
		
		public String getKakao_addr() {
			return kakao_addr;
		}

		public void setKakao_addr(String kakao_addr) {
			this.kakao_addr = kakao_addr;
		}

		public String getInsta_addr() {
			return insta_addr;
		}
		
		public void setInsta_addr(String insta_addr) {
			this.insta_addr = insta_addr;
		}
		
		public String getFbook_addr() {
			return fbook_addr;
		}
		
		public void setFbook_addr(String fbook_addr) {
			this.fbook_addr = fbook_addr;
		}
		
		public String getNblog_addr() {
			return nblog_addr;
		}
		
		public void setNblog_addr(String nblog_addr) {
			this.nblog_addr = nblog_addr;
		}
		
		public String getHome_addr() {
			return home_addr;
		}
		
		public void setHome_addr(String home_addr) {
			this.home_addr = home_addr;
		}
		
		public int getPrice_info1() {
			return price_info1;
		}
		
		public void setPrice_info1(int price_info1) {
			this.price_info1 = price_info1;
		}
		
		public int getPrice_info2() {
			return price_info2;
		}
		
		public void setPrice_info2(int price_info2) {
			this.price_info2 = price_info2;
		}
		
		public int getPrice_info3() {
			return price_info3;
		}
		
		public void setPrice_info3(int price_info3) {
			this.price_info3 = price_info3;
		}
		
		public int getPrice_info4() {
			return price_info4;
		}
		
		public void setPrice_info4(int price_info4) {
			this.price_info4 = price_info4;
		}
		
		public int getPrice_info5() {
			return price_info5;
		}
		
		public void setPrice_info5(int price_info5) {
			this.price_info5 = price_info5;
		}
		
		public String getService() {
			return service;
		}
		
		public void setService(String service) {
			this.service = service;
		}
		
		public Date getRegDate() {
			return regDate;
		}
		
		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}

		public String getFirstAddress() {
			return firstAddress;
		}

		public void setFirstAddress(String firstAddress) {
			this.firstAddress = firstAddress;
		}

		public String getFirst_option() {
			return first_option;
		}

		public void setFirst_option(String first_option) {
			this.first_option = first_option;
		}

		public String getGym_fileName() {
			return gym_fileName;
		}

		public void setGym_fileName(String gym_fileName) {
			this.gym_fileName = gym_fileName;
		}

		public String getRecommand() {
			return recommand;
		}

		public void setRecommand(String recommand) {
			this.recommand = recommand;
		}

		public Double getDistance() {
			return distance;
		}

		public void setDistance(Double distance) {
			this.distance = distance;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public int getMember_count() {
			return member_count;
		}

		public void setMember_count(int member_count) {
			this.member_count = member_count;
		}

		public String getTime_info() {
			return time_info;
		}

		public void setTime_info(String time_info) {
			this.time_info = time_info;
		}
				
				
}
