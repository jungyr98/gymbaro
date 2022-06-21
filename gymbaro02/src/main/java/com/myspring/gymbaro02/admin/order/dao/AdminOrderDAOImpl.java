package com.myspring.gymbaro02.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.order.vo.OrderVO;

@Repository("adminOrderDAO")
public class AdminOrderDAOImpl implements AdminOrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 주문리스트 조회
	@Override
	public List<OrderVO> selectOrderList() throws DataAccessException {
		List<OrderVO> listOrder = sqlSession.selectList("mapper.admin.order.selectOrderList");
		return listOrder;
	}
	
	// 주문상태 변경하기
	@Override
	public void updateOrderState(Map<String, Object> updateMap) throws DataAccessException {
		sqlSession.selectList("mapper.admin.order.updateOrderState", updateMap);
	}

}
