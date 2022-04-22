package com.myspring.gymbaro02.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.order.vo.OrderVO;

public interface OrderDAO {

	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException;
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException;
	
}
