package com.myspring.gymbaro02.admin.gym.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.gym.vo.GymVO;

public interface AdminGymDAO {
	public List<GymVO> selectGymList() throws DataAccessException;
	public void updateGymState(Map<String, Object> updateStateMap) throws DataAccessException;
	public void updateRecommand(Map<String, Object> updateRecommandMap) throws DataAccessException;
}
