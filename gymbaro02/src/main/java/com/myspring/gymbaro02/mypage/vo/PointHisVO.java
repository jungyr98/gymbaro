package com.myspring.gymbaro02.mypage.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("pointHisVO")
public class PointHisVO {
	private int history_id;
	private String point_state;
	private Date creDate;
	private int point;
	private String his_contents;
	private String order_id;
	private int uid;
	
	public PointHisVO() {
		
	}
	
	public int getHistory_id() {
		return history_id;
	}
	public void setHistory_id(int history_id) {
		this.history_id = history_id;
	}
	public String getPoint_state() {
		return point_state;
	}
	public void setPoint_state(String point_state) {
		this.point_state = point_state;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getHis_contents() {
		return his_contents;
	}
	public void setHis_contents(String his_contents) {
		this.his_contents = his_contents;
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

}
