package com.myspring.gymbaro02.admin.membership.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.membership.vo.MembershipVO;

@Repository("adminMembershipDAO")
public class AdminMembershipDAOImpl implements AdminMembershipDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	// 회원권 리스트 조회
	@Override
	public List<MembershipVO> listMembership() throws DataAccessException {
		List<MembershipVO> listMembership = sqlSession.selectList("mapper.admin.membership.selectMembershipList");
		return listMembership;
	}
	
	// 회원권 삭제
	@Override
	public void deleteMembership(List<MembershipVO> deleteList) throws DataAccessException {
		for(int i=0; i<deleteList.size(); i++) {
			MembershipVO membershipVO = deleteList.get(i);
			String membership_id = membershipVO.getMembership_id();
			sqlSession.delete("mapper.admin.membership.deleteMembership", membership_id);
		}
	}
	
	// 회원권 상태 수정
	@Override
	public void updateMembershipState(Map<String,Object> updateMembershipMap) throws DataAccessException {
		sqlSession.update("mapper.admin.membership.updateMembershipState", updateMembershipMap);
	}
	
}
