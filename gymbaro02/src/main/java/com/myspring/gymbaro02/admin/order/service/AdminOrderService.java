package com.myspring.gymbaro02.admin.order.service;

import java.util.List;

import com.myspring.gymbaro02.order.vo.OrderVO;

public interface AdminOrderService {
	public List<OrderVO> listOrder() throws Exception;
}
