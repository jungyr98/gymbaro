package com.myspring.gymbaro02.admin.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.admin.event.dao.AdminEventDAO;
import com.myspring.gymbaro02.event.vo.EventVO;

@Service("adminEventService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminEventServiceImpl implements AdminEventService {
	@Autowired
	private AdminEventDAO adminEventDAO;
	
	// 이벤트 리스트 조회
	@Override
	public List<EventVO> listEvent() throws Exception {
		List<EventVO> listEvent = adminEventDAO.selectEventList();
		return listEvent;
	}
	
	// 새 이벤트 추가하기
	@Override
	public void addNewEvent(EventVO eventVO) throws Exception{
		adminEventDAO.addNewEvent(eventVO);
	}
	
	// 이벤트 변경하기(할인율도 변경되었다면, 해당 이벤트가 적용된 상품의 할인율도 변경시켜준다)
	@Override
	public void updateEvent(EventVO eventVO, String discount_update) throws Exception {
		adminEventDAO.updateEvent(eventVO);
		if(discount_update.equals("Y")) {
			int event_id = eventVO.getEvent_id();
			adminEventDAO.updateThisGoods(event_id);
		}
	}
	
	// 이벤트 삭제하기
	@Override
	public void deleteEvent(List<EventVO> eventList) throws Exception {
		adminEventDAO.deleteGoodsDiscount(eventList); // 이벤트 삭제전 이벤트 아이디가 포린키로 적용된 상품의 이벤트를 해제시켜준다
		adminEventDAO.deleteEvent(eventList); // 상품 이벤트 적용 해제 후, 이벤트를 테이블에서 삭제한다
	}
	
}
