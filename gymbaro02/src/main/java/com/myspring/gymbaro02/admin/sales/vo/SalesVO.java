package com.myspring.gymbaro02.admin.sales.vo;

import org.springframework.stereotype.Component;

@Component("salesVO")
public class SalesVO {
	private int count;
	private int total_price;
	private String date;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
