package com.myspring.gymbaro02.membership.service;

import java.util.Map;


import com.myspring.gymbaro02.membership.vo.MembershipVO;

public interface MembershipService {
	public MembershipVO selectMembershipHistory(Map<String, Object> infoMap) throws Exception;
	public String addNewMembership(Map<String,Object> membershipMap) throws Exception;
}
