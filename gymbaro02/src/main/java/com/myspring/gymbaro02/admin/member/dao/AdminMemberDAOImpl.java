package com.myspring.gymbaro02.admin.member.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.member.vo.MemberVO;

@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 로그인
	@Override
	public MemberVO adminLogin(Map<String,Object> loginMap) throws DataAccessException {
		MemberVO memberVO = sqlSession.selectOne("mapper.admin.member.adminLogin", loginMap);
		return memberVO;
	}
	
	// 로그인하는 아이디 데이터에 있으면 솔트값 확인
	@Override
	public String getSaltById(String id) throws DataAccessException {
		String salt = sqlSession.selectOne("mapper.member.getSaltbyId", id);
		return salt;
	}
	
	// 회원 리스트 조회
	@Override
	public List<MemberVO> listMember() throws DataAccessException {
		List<MemberVO> listMember = new ArrayList<MemberVO>();
		listMember = sqlSession.selectList("mapper.admin.member.selectMemberList");
		return listMember;
	}
	
	// 회원 등급 수정하기(고유번호, 수정할 등급)
	@Override
	public void updateMemberLevel(Map<String, Object> updateLevelMap) throws DataAccessException {
		sqlSession.update("mapper.admin.member.updateMemberLevel", updateLevelMap);
	}
	
	// 회원 포인트 추가하기(고유번호, 추가할 적립금)
	@Override
	public void updateMemberPoint(Map<String, Object> updatePointMap) throws DataAccessException {
		sqlSession.update("mapper.admin.member.updateMemberPoint", updatePointMap);
		sqlSession.insert("mapper.admin.member.adminAddPoint", updatePointMap);
	}
	
	// 회원 삭제(탈퇴) - 탈퇴여부 Y로 변경
	@Override
	public void deleteMember(List<MemberVO> deleteList) throws DataAccessException {
		for(int i=0; i<deleteList.size(); i++) {
			System.out.println("진입");
			MemberVO memberVO = deleteList.get(i);
			int uid = memberVO.getUid();
			sqlSession.update("mapper.admin.member.deleteMember", uid); // 탈퇴여부 Y로 변경시 트리거 발동
			sqlSession.update("mapper.admin.member.deleteMemberInfo", uid); // 트리거 발동 후 일반 회원 테이블에서 개인정보 삭제 프로시저 실행
		}
	}
	
	// 해당 회원 정보 상세
	@Override
	public MemberVO selectMemberDetail(int uid) throws DataAccessException {
		MemberVO memberVO = new MemberVO();
		memberVO = sqlSession.selectOne("mapper.admin.member.selectMemberDetail", uid);
		return memberVO;
	}

}
