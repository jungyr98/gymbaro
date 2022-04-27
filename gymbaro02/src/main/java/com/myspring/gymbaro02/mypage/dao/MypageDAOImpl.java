package com.myspring.gymbaro02.mypage.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.member.vo.MemberVO;

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
