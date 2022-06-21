package com.myspring.gymbaro02.admin.sales.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.admin.sales.vo.SalesVO;

public interface AdminSalesDAO {
	public List<SalesVO> selectMemberCount() throws DataAccessException;
	public List<SalesVO> selectOrderCount() throws DataAccessException;
	public List<SalesVO> selectMembershipCount() throws DataAccessException;
	public List<SalesVO> selectAllSales() throws DataAccessException;
	public List<SalesVO> selectOrderSales() throws DataAccessException;
	public List<SalesVO> selectMembershipSales() throws DataAccessException;
	public List<SalesVO> selectOrderDaySales() throws DataAccessException;
	public List<SalesVO> selectMembershipDaySales() throws DataAccessException;
}
