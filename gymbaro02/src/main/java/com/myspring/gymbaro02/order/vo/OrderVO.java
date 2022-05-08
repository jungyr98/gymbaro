package com.myspring.gymbaro02.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	private int order_seq_num;
	private String order_id;
	private int uid;
	private int goods_id;
	private String goods_name;
	private String option_name;
	private int goods_qty;
	private String member_yn;
	private String orderer_name;
	private String receiver_name;
	private String receiver_phone_number;
	private String receiver_zipcode;
	private String receiver_roadAddress;
	private String receiver_jibunAddress;
	private String receiver_extraAddress;
	private String order_state;
	private String payment;
	private String delivery_memo;
	private int total_price;
	private Date creDate;
	
	public OrderVO() {
		
	}
	

	public int getOrder_seq_num() {
		return order_seq_num;
	}



	public void setOrder_seq_num(int order_seq_num) {
		this.order_seq_num = order_seq_num;
	}



	public int getGoods_id() {
		return goods_id;
	}



	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}



	public String getOption_name() {
		return option_name;
	}



	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}



	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public int getGoods_qty() {
		return goods_qty;
	}

	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
	}

	public String getMember_yn() {
		return member_yn;
	}

	public void setMember_yn(String member_yn) {
		this.member_yn = member_yn;
	}

	public String getOrderer_name() {
		return orderer_name;
	}

	public void setOrderer_name(String orderer_name) {
		this.orderer_name = orderer_name;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getReceiver_phone_number() {
		return receiver_phone_number;
	}

	public void setReceiver_phone_number(String receiver_phone_number) {
		this.receiver_phone_number = receiver_phone_number;
	}

	public String getReceiver_zipcode() {
		return receiver_zipcode;
	}

	public void setReceiver_zipcode(String receiver_zipcode) {
		this.receiver_zipcode = receiver_zipcode;
	}

	public String getReceiver_roadAddress() {
		return receiver_roadAddress;
	}

	public void setReceiver_roadAddress(String receiver_roadAddress) {
		this.receiver_roadAddress = receiver_roadAddress;
	}

	public String getReceiver_jibunAddress() {
		return receiver_jibunAddress;
	}

	public void setReceiver_jibunAddress(String receiver_jibunAddress) {
		this.receiver_jibunAddress = receiver_jibunAddress;
	}

	public String getReceiver_extraAddress() {
		return receiver_extraAddress;
	}

	public void setReceiver_extraAddress(String receiver_extraAddress) {
		this.receiver_extraAddress = receiver_extraAddress;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getDelivery_memo() {
		return delivery_memo;
	}

	public void setDelivery_memo(String delivery_memo) {
		this.delivery_memo = delivery_memo;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	
}
