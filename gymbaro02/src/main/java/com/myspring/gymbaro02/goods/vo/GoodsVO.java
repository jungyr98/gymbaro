package com.myspring.gymbaro02.goods.vo;

public class GoodsVO {
	private int goods_id;
	private String goods_name;
	private int goods_price;
	private int event_id;
	private int goods_discount;
	private int goods_amount;
	private String goods_main_category;
	private String goods_sub_category;
	private String goods_state;
	private int uid;
	private String goods_fileName;
	

	public GoodsVO() {
		
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public int getEvent_id() {
		return event_id;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public int getGoods_discount() {
		return goods_discount;
	}

	public void setGoods_discount(int goods_discount) {
		this.goods_discount = goods_discount;
	}

	public int getGoods_amount() {
		return goods_amount;
	}

	public void setGoods_amount(int goods_amount) {
		this.goods_amount = goods_amount;
	}

	public String getGoods_main_category() {
		return goods_main_category;
	}

	public void setGoods_main_category(String goods_main_category) {
		this.goods_main_category = goods_main_category;
	}

	public String getGoods_sub_category() {
		return goods_sub_category;
	}

	public void setGoods_sub_category(String goods_sub_category) {
		this.goods_sub_category = goods_sub_category;
	}

	public String getGoods_state() {
		return goods_state;
	}

	public void setGoods_state(String goods_state) {
		this.goods_state = goods_state;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String getGoods_fileName() {
		return goods_fileName;
	}

	public void setGoods_fileName(String goods_fileName) {
		this.goods_fileName = goods_fileName;
	}

}
