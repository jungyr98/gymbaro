package com.myspring.gymbaro02.admin.event.service;

import java.util.List;

import com.myspring.gymbaro02.event.vo.EventVO;

public interface AdminEventService {
	public List<EventVO> listEvent() throws Exception;
	public void addNewEvent(EventVO eventVO) throws Exception;
	public void updateEvent(EventVO eventVO, String discount_update) throws Exception;
	public void deleteEvent(List<EventVO> eventList) throws Exception;
}
