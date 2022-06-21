package com.myspring.gymbaro02.admin.event.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.event.vo.EventVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

@Repository("adminEventDAO")
public class AdminEventDAOImpl implements AdminEventDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	// 이벤트 리스트 조회
	@Override
	public List<EventVO> selectEventList() throws DataAccessException {
		List<EventVO> listEvent = sqlSession.selectList("mapper.admin.event.selectEventList");
		return listEvent;
	}
	
	// 새 이벤트 추가하기
	@Override
	public void addNewEvent(EventVO eventVO) throws DataAccessException {
		sqlSession.insert("mapper.admin.event.addNewEvent", eventVO);
	}
	
	// 이벤트 변경하기
	@Override
	public void updateEvent(EventVO eventVO) throws DataAccessException{
		sqlSession.update("mapper.admin.event.updateEvent", eventVO);
	}
	
	// 이벤트 할인율 변경 여부 Y일때, 적용된 상품의 할인율도 변경해주는 프로시저 호출
	@Override
	public void updateThisGoods(int event_id) throws DataAccessException{
		List<GoodsVO> goodsList = sqlSession.selectList("mapper.admin.event.selectThisEventGoods", event_id);
		for(int i=0; i<goodsList.size(); i++) {
			GoodsVO goodsVO = goodsList.get(i);
			int goods_id = goodsVO.getGoods_id();
			sqlSession.update("mapper.admin.goods.updateGoodsDiscount", goods_id);
		}
	}
	
	// 이벤트 삭제하기 (이 함수 실행하기 전에 먼저 해당 이벤트가 적용된 상품의 할인가격 및 이벤트 아이디를 null로 변경해준다)
	public void deleteEvent(List<EventVO> eventList) throws DataAccessException {
		sqlSession.delete("mapper.admin.event.deleteEvent", eventList);
	}
	
	// 이벤트 삭제전 상품에 적용된 이벤트 먼저 해제 시키기
	public void deleteGoodsDiscount(List<EventVO> eventList) throws DataAccessException {
		for(int i=0; i<eventList.size(); i++) {
			EventVO eventVO = eventList.get(i);
			int event_id = eventVO.getEvent_id();
			List<GoodsVO> goodsList = sqlSession.selectList("mapper.admin.event.selectThisEventGoods", event_id);
			if(goodsList.size() != 0) {
				sqlSession.update("mapper.admin.goods.deleteGoodsEvent", goodsList);
			}
		}
	}
}
