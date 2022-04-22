package com.myspring.gymbaro02.cart.vo;

import java.util.Date;

public class CartVO {
	private int cart_id;
	private int goods_id;
	private int uid;
	private int goods_qty;
	private Date creDate;
	
	public CartVO() {
		
	}
	public CartVO(int cart_id, int goods_id, int uid, int goods_qty, Date creDate) {
		this.cart_id = cart_id;
		this.goods_id = goods_id;
		this.uid = uid;
		this.goods_qty = goods_qty;
		this.creDate = creDate;
	}
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	
	
}
