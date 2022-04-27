package com.myspring.gymbaro02.mypage.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.member.vo.MemberVO;

public interface MypageDAO {

	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
	public String getSaltById(String id) throws DataAccessException;
	public boolean confirmOldPwd(String member_pwd) throws DataAccessException;
}
