package com.myspring.gymbaro02.membership.dao;


import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.membership.vo.MembershipVO;

public interface MembershipDAO {
	public String insertNewMembership(Map<String, Object> membershipMap) throws DataAccessException;
	public MembershipVO selectMembershipHistory(Map<String, Object> infoMap) throws DataAccessException;
}
