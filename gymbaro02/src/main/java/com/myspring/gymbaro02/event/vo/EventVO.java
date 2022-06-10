package com.myspring.gymbaro02.event.vo;

import org.springframework.stereotype.Component;

@Component("eventVO")
public class EventVO {
	private int event_id;
	private String event_name;
	private int discount;
	
	public EventVO() {
		
	}

	public int getEvent_id() {
		return event_id;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public String getEvent_name() {
		return event_name;
	}

	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	
}
