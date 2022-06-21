package com.myspring.gymbaro02.admin.sales.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.admin.sales.vo.SalesVO;

public interface AdminSalesService {
	public Map<String, List<SalesVO>> shopGraphData() throws Exception;
	public Map<String, Object> selectSalesList() throws Exception;
}
