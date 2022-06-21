package com.myspring.gymbaro02.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.order.vo.OrderVO;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public String getSaltById(String id) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public String idFindSuccess(Map idByEmailMap) throws DataAccessException;
	public String idFindSuccessByNum(Map idByNumMap) throws DataAccessException;
	public String newPwdForm(Map findPwdForm) throws DataAccessException;
	public int pwdFindSuccess(Map pwdMap) throws DataAccessException;
	public String findMemberName(String member_id) throws DataAccessException;
	public List<OrderVO> nonMemberOrderDetail (OrderVO orderVO) throws DataAccessException;
}
