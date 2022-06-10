package com.myspring.gymbaro02.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member=(MemberVO)sqlSession.selectOne("mapper.member.login", loginMap);
	   return member;
	}
	
	@Override
	public String getSaltById(String id) throws DataAccessException {
		String salt = sqlSession.selectOne("mapper.member.getSaltbyId", id);
		return salt;
	}
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember", memberVO);
	}
	
	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID", id);
		return result;
	}
	
	@Override
	public String idFindSuccess(Map idByEmailMap) throws DataAccessException {
		String member_id = sqlSession.selectOne("mapper.member.idFindSuccess", idByEmailMap);
		return member_id;
	}
	
	@Override 
	public String idFindSuccessByNum(Map idByNumMap) throws DataAccessException {
		String myIdByNum = sqlSession.selectOne("mapper.member.idFindSuccessByNum", idByNumMap);
		return myIdByNum;
	}
	
	@Override
	public String newPwdForm(Map findPwdMap) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.newPwdForm", findPwdMap);
		return result; // member_name
	}
	
	@Override 
	public int pwdFindSuccess(Map pwdMap) throws DataAccessException {
		return sqlSession.update("mapper.member.pwdFindSuccess", pwdMap);
	}
	
	@Override
	public String findMemberName(String member_id) throws DataAccessException{
		String member_name = sqlSession.selectOne("mapper.member.findMemberName", member_id);
		return member_name;
	}
	
	// 스케줄러 테스트
	public List<MemberVO> selectDeletedMember() throws DataAccessException{
		return sqlSession.selectList("mapper.member.selectDeletedMember");
	}
	
	public int deletedMemberUpdate(MemberVO memberVO) throws DataAccessException {
		return sqlSession.update("deletedMemberUpdate", memberVO);
	}
}
