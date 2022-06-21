package com.myspring.gymbaro02.admin.member.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.member.vo.MemberVO;

public interface AdminMemberService {
	
	public MemberVO adminLogin(Map<String, Object> loginMap) throws Exception;
	public List<MemberVO> listMember() throws Exception;
	public void updateMemberLevel(Map<String, Object> updateLevelMap) throws Exception;
	public void updateMemberPoint(Map<String, Object> updatePointMap) throws Exception;
	public void deleteMember(List<MemberVO> deleteList) throws Exception;
	public MemberVO selectMemberDetail(int uid) throws Exception;
	
}
