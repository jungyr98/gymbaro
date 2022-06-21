package com.myspring.gymbaro02.mypage.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.admin.sales.vo.SalesVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.gym.vo.GymVO;
import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.membership.vo.MembershipVO;
import com.myspring.gymbaro02.mypage.vo.PointHisVO;
import com.myspring.gymbaro02.order.vo.OrderVO;

public interface MypageService {
	public MemberVO selectMyInfo(String member_id) throws Exception;
	public MemberVO modifyMyInfo(Map memberMap) throws Exception;
	public List<OrderVO> listMyOrderHistory(Map condMap) throws Exception;
	public List<PointHisVO> listMyPointHistory(Map<String, Object> condMap) throws Exception;
	public List<GymVO> listMyGym(int uid) throws Exception;
	public int addNewGym(Map<String, Object> gymMap) throws Exception;
	public List<MembershipVO> listMyMembership(Map<String, Object> condMap) throws Exception;
	public List<OrderVO> listMyOrderDetail(String order_id) throws Exception;
	public MembershipVO listMyMembershipDetail(String membership_id) throws Exception;
	public List<Object> listMyBoardItem(Map<String, Object> condMap) throws Exception;
	public List<CsVO> listMyCsHistory(Map<String, Object> condMap) throws Exception;
	public List<MembershipVO> listMyGymMembership(Map<String, Object> condMap) throws Exception;
	public Map<String, List<SalesVO>> myGymSales(Map<String, Object> condMap) throws Exception;
}
