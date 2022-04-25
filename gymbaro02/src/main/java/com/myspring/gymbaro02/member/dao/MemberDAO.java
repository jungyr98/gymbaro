package com.myspring.gymbaro02.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public String getSaltById(String id) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
}
