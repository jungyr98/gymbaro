package com.myspring.gymbaro02.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.admin.order.dao.AdminOrderDAO;
import com.myspring.gymbaro02.order.vo.OrderVO;

@Service("adminOrderService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminOrderServiceImpl implements AdminOrderService {
	@Autowired
	private AdminOrderDAO adminOrderDAO;
	
	// 주문리스트 조회
	@Override
	public List<OrderVO> listOrder() throws Exception {
		List<OrderVO> listOrder = adminOrderDAO.selectOrderList();
		return listOrder;
	}
	
	// 주문상태 변경하기
	@Override
	public void updateOrderState(Map<String, Object> updateMap) throws Exception {
		adminOrderDAO.updateOrderState(updateMap);
	}
}
