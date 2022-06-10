package com.myspring.gymbaro02.admin.membership.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.membership.vo.MembershipVO;

public interface AdminMembershipService {
	public List<MembershipVO> listMembership() throws Exception;
	public void updateMembershipState(Map<String,Object> updateMembershipMap) throws Exception;
	public void deleteMembership(List<MembershipVO> deleteList) throws Exception;
}
