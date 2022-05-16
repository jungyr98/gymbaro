package com.myspring.gymbaro02.gym.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.gym.vo.GymImageFileVO;
import com.myspring.gymbaro02.gym.vo.GymVO;

@Repository("gymDAO")
public class GymDAOImpl implements GymDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GymVO> selectRecommandGymsList() throws DataAccessException {
		List<GymVO> gymList = new ArrayList<GymVO>();
		gymList = (ArrayList) sqlSession.selectList("mapper.gym.selectRecommandGymList");		
		return gymList;
	}
	
	@Override
	public List<GymVO> selectLocationGymsList(String address) throws DataAccessException {
		List<GymVO> gymList = new ArrayList<GymVO>();
		gymList = (ArrayList) sqlSession.selectList("mapper.gym.selectLocationGymList", address);		
		return gymList;
	}
	
	@Override
	public GymVO selectGymDetail(String gym_id) throws DataAccessException {
		GymVO gymVO = sqlSession.selectOne("mapper.gym.selectGymDetail", gym_id);
		return gymVO;
	}
	
	@Override
	public List<GymImageFileVO> selectGymDetailImage(String gym_id) throws DataAccessException {
		List<GymImageFileVO> imageList = sqlSession.selectList("mapper.gym.selectGymDetailImage", gym_id);
		return imageList;
	}
}
