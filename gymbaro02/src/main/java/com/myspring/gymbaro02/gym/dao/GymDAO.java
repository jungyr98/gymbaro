package com.myspring.gymbaro02.gym.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.gym.vo.GymImageFileVO;
import com.myspring.gymbaro02.gym.vo.GymVO;

public interface GymDAO {
	public List<GymVO> selectRecommandGymsList() throws DataAccessException;
	public List<GymVO> selectLocationGymsList(String gymStatus) throws DataAccessException;
	public GymVO selectGymDetail(String gym_id) throws DataAccessException;
	public List<GymImageFileVO> selectGymDetailImage(String gym_id) throws DataAccessException;
}
