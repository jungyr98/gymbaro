package com.myspring.gymbaro02.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.member.vo.MemberVO;

public interface AdminMemberDAO {
	public List<MemberVO> listMember() throws DataAccessException;
	public void updateMemberLevel(Map<String, Object> updateLevelMap) throws DataAccessException;
	public void updateMemberPoint(Map<String, Object> updatePointMap) throws DataAccessException;
	public void deleteMember(List<MemberVO> deleteList) throws DataAccessException;
	public MemberVO selectMemberDetail(int uid) throws DataAccessException;
}
