package com.myspring.gymbaro02.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;
import com.myspring.gymbaro02.gym.vo.GymVO;
import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.membership.vo.MembershipVO;
import com.myspring.gymbaro02.mypage.vo.PointHisVO;
import com.myspring.gymbaro02.order.vo.OrderVO;

public interface MypageDAO {

	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
	public String getSaltById(String id) throws DataAccessException;
	public boolean confirmOldPwd(String member_pwd) throws DataAccessException;
	public List<OrderVO> selectMyOrderHistory(Map condMap) throws DataAccessException;
	public List<PointHisVO> selectMyPointHistory(Map<String, Object> condMap) throws DataAccessException;
	public List<GymVO> selectMyGymList(int uid) throws DataAccessException;
	public int countMyGymMember(int gym_id) throws DataAccessException;
	public int insertNewGym(Map<String,Object> gymMap) throws DataAccessException;
	public void insertNewGymImage(Map<String, Object> gymMap, int gym_id) throws DataAccessException;
	public List<MembershipVO> selectMyMembership(Map<String, Object> condMap) throws DataAccessException;
	public List<OrderVO> selectOrderDetail(String order_id) throws DataAccessException;
	public MembershipVO selectMembershipDetail(String membership_id) throws DataAccessException;
	public List<CommentVO> selectMyComment(Map<String, Object> condMap) throws DataAccessException;
	public List<BoardVO> selectMyArticle(Map<String, Object> condMap) throws DataAccessException;
	
}
