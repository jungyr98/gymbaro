package com.myspring.gymbaro02.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;
import com.myspring.gymbaro02.gym.vo.GymImageFileVO;
import com.myspring.gymbaro02.gym.vo.GymVO;
import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.membership.vo.MembershipVO;
import com.myspring.gymbaro02.mypage.vo.PointHisVO;
import com.myspring.gymbaro02.order.vo.OrderVO;

@Repository("myPageDAO")
public class MypageDAOImpl implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void updateMyInfo(Map memberMap) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyInfo", memberMap);
	}
	
	@Override
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException{
		MemberVO memberVO=(MemberVO)sqlSession.selectOne("mapper.mypage.selectMyDetailInfo", member_id);
		return memberVO;
	}
	
	@Override
	public String getSaltById(String id) throws DataAccessException {
		String salt = sqlSession.selectOne("mapper.member.getSaltbyId", id);
		return salt;
	}
	
	//주문내역 조회
	@Override
	public List<OrderVO> selectMyOrderHistory(Map condMap) throws DataAccessException {
		List<OrderVO> myOrderList = sqlSession.selectList("mapper.mypage.selectMyOrderHistory", condMap);
		return myOrderList;
	}
	
	//포인트 내역 조회
	@Override
	public List<PointHisVO> selectMyPointHistory(Map<String, Object> condMap) throws DataAccessException {
		List<PointHisVO> myPointList = sqlSession.selectList("mapper.mypage.selectMyPointHistory", condMap);
		return myPointList;
	}
	
	@Override
	public boolean confirmOldPwd(String member_pwd) throws DataAccessException {
		int confirm = sqlSession.selectOne("mapper.mypage.confirmPwd", member_pwd);
		boolean confirmPwd;
		if(confirm == 1) {
			confirmPwd = true;
		}else {
			confirmPwd = false;
		}
		return confirmPwd;
	}
	
	// 내 시설 리스트 조회
	@Override
	public List<GymVO> selectMyGymList(int uid) throws DataAccessException {
		List<GymVO> gymInfo = sqlSession.selectList("mapper.mypage.selectMyGymList", uid);
		return gymInfo;
	}
	
	// 내 시설 회원수 조회
	@Override
	public int countMyGymMember(int gym_id) throws DataAccessException {
		int allMember = sqlSession.selectOne("mapper.mypage.countMyGymMember", gym_id);
		return allMember;
	}
	
	// 시설 등록하기
	@Override
	public int insertNewGym(Map<String,Object> gymMap) throws DataAccessException {
		GymVO gymVO = (GymVO) gymMap.get("gymVO");
		sqlSession.insert("mapper.mypage.insertNewGym", gymVO);
		int gym_id =  gymVO.getGym_id();
		return gym_id;
	}
	
	// 시설 이미지 등록하기
	@Override
	public void insertNewGymImage(Map<String, Object> gymMap, int gym_id) throws DataAccessException {
		List<GymImageFileVO> gymImageList = (List<GymImageFileVO>) gymMap.get("gymImageList");
		for(int i=0; i<gymImageList.size(); i++) {
			GymImageFileVO gymImageFileVO = gymImageList.get(i);
			gymImageFileVO.setGym_id(gym_id);
			sqlSession.insert("mapper.mypage.insertNewGymImage", gymImageFileVO);
		}
	}
	
	// 내 회원권 내역 조회
	@Override
	public List<MembershipVO> selectMyMembership(Map<String, Object> condMap) throws DataAccessException {
		List<MembershipVO> membershipList = sqlSession.selectList("mapper.mypage.selectMyMembership", condMap);
		return membershipList;
	}
	
	// 주문 내역 상세 조회
	@Override
	public List<OrderVO> selectOrderDetail(String order_id) throws DataAccessException {
		List<OrderVO> orderDetailList = sqlSession.selectList("mapper.mypage.selectOrderDetail", order_id);
		return orderDetailList;
	}
	
	// 회원권 예약 내역 상세 조회
	@Override
	public MembershipVO selectMembershipDetail(String membership_id) throws DataAccessException {
		MembershipVO membershipVO = sqlSession.selectOne("mapper.mypage.selectMembershipDetail", membership_id);
		return membershipVO;
	}
	
	// 내 댓글 내역 조회
	@Override
	public List<CommentVO> selectMyComment(Map<String, Object> condMap) throws DataAccessException {
		List<CommentVO> myCommentList = sqlSession.selectList("mapper.mypage.selectMyComment", condMap);
		return myCommentList;
	}
	
	// 내 게시글 내역 조회
	@Override
	public List<BoardVO> selectMyArticle(Map<String, Object> condMap) throws DataAccessException {
		List<BoardVO> myArticleList = sqlSession.selectList("mapper.mypage.selectMyArticle", condMap);
		return myArticleList;
	}
	
}
