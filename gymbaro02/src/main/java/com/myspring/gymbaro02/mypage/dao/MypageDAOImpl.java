package com.myspring.gymbaro02.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.member.vo.MemberVO;
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
		int section = Integer.parseInt((String)condMap.get("section"));
		int pageNum = Integer.parseInt((String)condMap.get("pageNum"));
		int first_limit = (section-1)*100 + (pageNum-1)*10;
		condMap.put("first_limit", first_limit);
		List<OrderVO> myOrderList = sqlSession.selectList("mapper.mypage.selectMyOrderHistory", condMap);
		return myOrderList;
	}
	
	//포인트 내역 조회
	@Override
	public List<PointHisVO> selectMyPointHistory(Map condMap) throws DataAccessException {
		int section = Integer.parseInt((String)condMap.get("section"));
		int pageNum = Integer.parseInt((String)condMap.get("pageNum"));
		int first_limit = (section-1)*100 + (pageNum-1)*10;
		condMap.put("first_limit", first_limit);
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
}
