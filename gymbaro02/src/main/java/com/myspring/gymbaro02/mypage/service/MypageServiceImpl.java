package com.myspring.gymbaro02.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.admin.sales.vo.SalesVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.gym.vo.GymVO;
import com.myspring.gymbaro02.member.service.SHA256Util;
import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.membership.vo.MembershipVO;
import com.myspring.gymbaro02.mypage.dao.MypageDAO;
import com.myspring.gymbaro02.mypage.vo.PointHisVO;
import com.myspring.gymbaro02.order.vo.OrderVO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO myPageDAO;
	
	@Override
	public MemberVO selectMyInfo(String member_id) throws Exception {
		MemberVO memberVO = myPageDAO.selectMyDetailInfo(member_id);
		return memberVO;
	}
	
	@Override
	public MemberVO modifyMyInfo(Map memberMap) throws Exception{
		 String member_id=(String)memberMap.get("member_id");
		 if(memberMap.get("member_pwd")!=null) {
			 String salt = myPageDAO.getSaltById(member_id);
			 String member_pwd = (String)memberMap.get("member_pwd");
			 member_pwd = SHA256Util.getEncrypt(member_pwd, salt);
			 
			 boolean confirmPwd = myPageDAO.confirmOldPwd(member_pwd);
			 if(confirmPwd == true) {
				 String newPwd = (String)memberMap.get("newPwd");
				 member_pwd = SHA256Util.getEncrypt(newPwd, salt);
				 memberMap.put("member_pwd", member_pwd);
				 myPageDAO.updateMyInfo(memberMap);
			 }
		 }else {
			 myPageDAO.updateMyInfo(memberMap); 
		 }
		 return myPageDAO.selectMyDetailInfo(member_id);
	}
	
	// 주문내역 조회
	@Override
	public List<OrderVO> listMyOrderHistory(Map condMap) throws Exception {
		List<OrderVO> myOrderList = myPageDAO.selectMyOrderHistory(condMap);
		return myOrderList;
	}
	
	// 포인트 내역 조회
	@Override
	public List<PointHisVO> listMyPointHistory(Map<String, Object> condMap) throws Exception {
		List<PointHisVO> myPointList = myPageDAO.selectMyPointHistory(condMap);
		return myPointList;
	}
	
	// 내 시설 조회
	@Override
	public List<GymVO> listMyGym(int uid) throws Exception {
		List<GymVO> gymInfo = myPageDAO.selectMyGymList(uid);
		
		// 내 시설 회원 수 구하기
		for(int i=0; i<gymInfo.size(); i++) {
		GymVO gymVO = gymInfo.get(i);
		int gym_id = gymVO.getGym_id();
		int allMember = myPageDAO.countMyGymMember(gym_id);
		gymVO.setMember_count(allMember);
		}
		
		return gymInfo;
	}
	
	// 시설 등록하기
	@Override
	public int addNewGym(Map<String, Object> gymMap) throws Exception {
		int gym_id = myPageDAO.insertNewGym(gymMap);
		myPageDAO.insertNewGymImage(gymMap, gym_id);
		return gym_id;
	}
	
	// 내 회원권 내역 조회
	@Override
	public List<MembershipVO> listMyMembership(Map<String, Object> condMap) throws Exception {
		List<MembershipVO> membershipList = myPageDAO.selectMyMembership(condMap);
		return membershipList;
	}
	
	// 주문내역 상세 조회
	@Override
	public List<OrderVO> listMyOrderDetail(String order_id) throws Exception {
		List<OrderVO> orderDetailList = myPageDAO.selectOrderDetail(order_id);
		return orderDetailList;
	}
	
	// 회원권 예약 내역 상세 조회
	@Override
	public MembershipVO listMyMembershipDetail(String membership_id) throws Exception {
		MembershipVO membershipVO = myPageDAO.selectMembershipDetail(membership_id);
		return membershipVO;
	}
	
	// 내 게시물 조회하기 (조건에 따라 댓글, 게시글, 리뷰 따로 가져옴)
	@Override
	public List<Object> listMyBoardItem(Map<String, Object> condMap) throws Exception {
		List myBoardItem = new ArrayList();
		if(condMap.get("search_type").equals("comment")) {
			myBoardItem = myPageDAO.selectMyComment(condMap);
		}else if(condMap.get("search_type").equals("article")) {
			myBoardItem = myPageDAO.selectMyArticle(condMap);
		}else if(condMap.get("search_type").equals("review")) {
			myBoardItem = myPageDAO.selectMyReview(condMap);
		}
		
		return myBoardItem;
	}
	
	//1:1문의 내역
	@Override
	public List<CsVO> listMyCsHistory(Map<String, Object> condMap) throws Exception{
		List<CsVO> myCsList = myPageDAO.listMyCsHistory(condMap);
		return myCsList;
	}
	
	// (시설회원) 내 시설 회원 목록 조회
	@Override
	public List<MembershipVO> listMyGymMembership(Map<String, Object> condMap) throws Exception {
		List<MembershipVO> myGymMemberList = myPageDAO.listMyGymMembership(condMap);
		return myGymMemberList;
	}
	
	// (시설회원) 내 시설 매출 조회하기
	@Override
	public Map<String, List<SalesVO>> myGymSales(Map<String, Object> condMap) throws Exception {
		Map<String, List<SalesVO>> salesMap = new HashMap<String, List<SalesVO>>();
		List<SalesVO> listMonthSales = myPageDAO.listMonthSales(condMap);
		List<SalesVO> listDaySales = myPageDAO.listDaySales(condMap);
		salesMap.put("listMonthSales", listMonthSales);
		salesMap.put("listDaySales", listDaySales);
		return salesMap;
	}
	
}
