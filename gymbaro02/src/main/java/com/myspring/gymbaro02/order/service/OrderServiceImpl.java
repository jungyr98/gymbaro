package com.myspring.gymbaro02.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.order.dao.OrderDAO;
import com.myspring.gymbaro02.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public String addNewOrder(List<OrderVO> myOrderList) throws Exception{
		String order_id = orderDAO.insertNewOrder(myOrderList); // 주문 테이블 데이터 추가
		return order_id;
	}
	
	@Override
	public void minusUsePoint(Map pointMap) throws Exception {
		orderDAO.minusUsePoint(pointMap);
	}
}
