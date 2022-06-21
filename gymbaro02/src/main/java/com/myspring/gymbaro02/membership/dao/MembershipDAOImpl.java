package com.myspring.gymbaro02.membership.dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.membership.vo.MembershipVO;

@Repository("membershipDAO")
public class MembershipDAOImpl implements MembershipDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 예약하려는 시설에 이전 예약내역이 있는지 조회하기 (달력에서 해당날짜를 선택제외 해주기 위해)
	@Override
	public MembershipVO selectMembershipHistory(Map<String, Object> infoMap) throws DataAccessException {
		MembershipVO minDate = sqlSession.selectOne("mapper.membership.selectMembershipHistory", infoMap);
		return minDate;
	}
	
	// 회원권 추가하기
	@Override
	public String insertNewMembership(Map<String, Object> membershipMap) throws DataAccessException {
		String membership_id = selectMembershipID(); // 회원권 번호 생성 후 맵에 추가
		membershipMap.put("membership_id", membership_id);
		sqlSession.insert("mapper.membership.insertNewMembership", membershipMap);
		
		return membership_id;
	}
	
	// 회원권 아이디 조회 후 생성
	private String selectMembershipID() throws DataAccessException{
		return sqlSession.selectOne("mapper.membership.selectMembershipID");		
	}

}
