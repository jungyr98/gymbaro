package com.myspring.gymbaro02.admin.gym.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.gym.vo.GymVO;

public interface AdminGymService {
	public List<GymVO> selectGymList() throws Exception;
	public void updateGymState(Map<String, Object> updateStateMap) throws Exception;
	public void updateRecommand(Map<String, Object> updateRecommandMap) throws Exception;
}
