package com.myspring.gymbaro02.admin.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.order.vo.OrderVO;

public interface AdminOrderDAO {
	public List<OrderVO> selectOrderList() throws DataAccessException;
}
