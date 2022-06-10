package com.myspring.gymbaro02.admin.membership.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.gymbaro02.admin.membership.dao.AdminMembershipDAO;
import com.myspring.gymbaro02.membership.vo.MembershipVO;

@Service("adminMembershipService")
public class AdminMembershipServiceImpl implements AdminMembershipService {
	@Autowired
	private AdminMembershipDAO adminMembershipDAO;
	
	// 회원권 목록 가져오기
	public List<MembershipVO> listMembership() throws Exception {
		List<MembershipVO> listMembership = adminMembershipDAO.listMembership();
		return listMembership;
	}
	
	// 회원권 상태 수정하기
	@Override
	public void updateMembershipState(Map<String,Object> updateMembershipMap) throws Exception {
		adminMembershipDAO.updateMembershipState(updateMembershipMap);
	}
		
	// 회원권 삭제하기
	@Override
	public void deleteMembership(List<MembershipVO> deleteList) throws Exception {
		adminMembershipDAO.deleteMembership(deleteList);
	}
	
}
