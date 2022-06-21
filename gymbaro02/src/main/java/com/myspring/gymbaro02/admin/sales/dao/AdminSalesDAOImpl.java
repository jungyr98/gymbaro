package com.myspring.gymbaro02.admin.sales.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.admin.sales.vo.SalesVO;

@Repository("adminSalesDAO")
public class AdminSalesDAOImpl implements AdminSalesDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 최근 4개월 월별 회원수 체크
	@Override
	public List<SalesVO> selectMemberCount() throws DataAccessException {
		List<SalesVO> memberCountList = sqlSession.selectList("mapper.admin.sales.selectMemberCount");
		return memberCountList;
	}
	
	// 최근 4개월 월별 주문량 체크
	@Override
	public List<SalesVO> selectOrderCount() throws DataAccessException {
		List<SalesVO> orderCountList = sqlSession.selectList("mapper.admin.sales.selectOrderCount");
		return orderCountList;
	}
	
	// 최근 4개월 월별 예약량 체크
	@Override
	public List<SalesVO> selectMembershipCount() throws DataAccessException {
		List<SalesVO> membershipCountList = sqlSession.selectList("mapper.admin.sales.selectMembershipCount");
		return membershipCountList;
	}
	
	// 최근 4개월 월별 통합 매출 체크
	@Override
	public List<SalesVO> selectAllSales() throws DataAccessException {
		List<SalesVO> allSalesList = sqlSession.selectList("mapper.admin.sales.selectAllSales");
		return allSalesList;
	}
	
	// 최근 4개월 월별 주문 매출 체크
	@Override
	public List<SalesVO> selectOrderSales() throws DataAccessException {
		List<SalesVO> orderSalesList = sqlSession.selectList("mapper.admin.sales.selectOrderSales");
		return orderSalesList;
	}
	
	// 최근 4개월 월별 예약 매출 체크
	@Override
	public List<SalesVO> selectMembershipSales() throws DataAccessException {
		List<SalesVO> membershipSalesList = sqlSession.selectList("mapper.admin.sales.selectMembershipSales");
		return membershipSalesList;
	}
	
	// 주문 일자별 매출 체크
	@Override
	public List<SalesVO> selectOrderDaySales() throws DataAccessException {
		List<SalesVO> orderDaySales = sqlSession.selectList("mapper.admin.sales.selectOrderDaySales");
		return orderDaySales;
	}
	
	// 예약 일자별 매출 체크
	@Override
	public List<SalesVO> selectMembershipDaySales() throws DataAccessException {
		List<SalesVO> membershipDaySales = sqlSession.selectList("mapper.admin.sales.selectMembershipDaySales");
		return membershipDaySales;
	}

}
