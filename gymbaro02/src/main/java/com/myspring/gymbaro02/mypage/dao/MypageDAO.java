package com.myspring.gymbaro02.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.mypage.vo.PointHisVO;
import com.myspring.gymbaro02.order.vo.OrderVO;

public interface MypageDAO {

	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
	public String getSaltById(String id) throws DataAccessException;
	public boolean confirmOldPwd(String member_pwd) throws DataAccessException;
	public List<OrderVO> selectMyOrderHistory(Map condMap) throws DataAccessException;
	public List<PointHisVO> selectMyPointHistory(Map condMap) throws DataAccessException;
}
