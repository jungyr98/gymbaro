package com.myspring.gymbaro02.admin.membership.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.membership.vo.MembershipVO;

public interface AdminMembershipDAO {
	public List<MembershipVO> listMembership() throws DataAccessException;
	public void deleteMembership(List<MembershipVO> deleteList) throws DataAccessException;
	public void updateMembershipState(Map<String,Object> updateMembershipMap) throws DataAccessException;
}
