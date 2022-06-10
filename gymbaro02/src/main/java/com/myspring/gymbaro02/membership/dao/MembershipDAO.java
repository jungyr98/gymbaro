package com.myspring.gymbaro02.membership.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface MembershipDAO {
	public String insertNewMembership(Map<String, Object> membershipMap) throws DataAccessException;
}
