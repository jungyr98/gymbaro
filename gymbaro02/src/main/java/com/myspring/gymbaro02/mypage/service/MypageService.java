package com.myspring.gymbaro02.mypage.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.mypage.vo.PointHisVO;
import com.myspring.gymbaro02.order.vo.OrderVO;

public interface MypageService {
	public MemberVO selectMyInfo(String member_id) throws Exception;
	public MemberVO modifyMyInfo(Map memberMap) throws Exception;
	public List<OrderVO> listMyOrderHistory(Map condMap) throws Exception;
	public List<PointHisVO> listMyPointHistory(Map condMap) throws Exception;
}
