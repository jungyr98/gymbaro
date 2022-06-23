package com.myspring.gymbaro02.gym.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.gym.vo.GymImageFileVO;
import com.myspring.gymbaro02.gym.vo.GymReviewVO;
import com.myspring.gymbaro02.gym.vo.GymVO;
import com.myspring.gymbaro02.liked.vo.LikedVO;

public interface GymDAO {
	public List<GymVO> selectRecommandGymsList() throws DataAccessException;
	public List<GymVO> selectLocationGymsList(Map<String, Object> condMap) throws DataAccessException;
	public GymVO selectGymDetail(String gym_id) throws DataAccessException;
	public List<GymImageFileVO> selectGymDetailImage(String gym_id) throws DataAccessException;
	public int likedState(LikedVO likedVO) throws DataAccessException;
	public void newReview(GymReviewVO gymReviewVO) throws DataAccessException;
	public List<GymReviewVO> viewAll(String gym_id) throws DataAccessException;
	public double getGymAvg(String gym_id) throws DataAccessException;
	public double getInstructorAvg(String gym_id) throws DataAccessException;
	public double getAccessAvg(String gym_id) throws DataAccessException;
	public double getPersonalScoreAvg_gym(Map personalScoreMap) throws DataAccessException;
	public double getPersonalScoreAvg_instructor(Map personalScoreMap) throws DataAccessException;
	public double getPersonalScoreAvg_access(Map personalScoreMap) throws DataAccessException;
	public String getReviewCount(String gym_id) throws DataAccessException;
	public void deleteReview(int review_id) throws DataAccessException;
	public int getMembershipInfo(Map membershipInfoMap) throws DataAccessException;
	public void updateReviewState(Map updateReviewMap) throws DataAccessException;
	public void deleteGymReview(Map deleteReviewMap) throws DataAccessException;
}
