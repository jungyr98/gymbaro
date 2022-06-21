package com.myspring.gymbaro02.admin.event.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.event.vo.EventVO;

public interface AdminEventDAO {
	public List<EventVO> selectEventList() throws DataAccessException;
	public void addNewEvent(EventVO eventVO) throws DataAccessException;
	public void updateEvent(EventVO eventVO) throws DataAccessException;
	public void updateThisGoods(int event_id) throws DataAccessException;
	public void deleteEvent(List<EventVO> eventList) throws DataAccessException;
	public void deleteGoodsDiscount(List<EventVO> eventList) throws DataAccessException;
}
