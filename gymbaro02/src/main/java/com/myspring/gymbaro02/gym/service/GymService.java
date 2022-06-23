package com.myspring.gymbaro02.gym.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.gym.vo.GymReviewVO;
import com.myspring.gymbaro02.gym.vo.GymVO;

public interface GymService {
	public Map<String,List<GymVO>> listGym(Map<String, Object> condMap) throws Exception;
	public Map<String,Object> GymDetail(String gym_id, int uid) throws Exception;
	public void newReview(GymReviewVO gymReviewVO) throws Exception;
	public List<GymReviewVO> viewAll(String gym_id) throws Exception;
	public double getGymAvg(String gym_id) throws Exception;
	public double getInstructorAvg(String gym_id) throws Exception;
	public double getAccessAvg(String gym_id) throws Exception;
	public double getPersonalScoreAvg_gym(Map personalScoreMap) throws Exception;
	public double getPersonalScoreAvg_instructor(Map personalScoreMap) throws Exception;
	public double getPersonalScoreAvg_access(Map personalScoreMap) throws Exception;
	public String getReviewCount(String gym_id) throws Exception;
	public void deleteReview(int review_id) throws Exception;
	public int getMembershipInfo(Map<String, Object> membershipInfoMap) throws Exception;
	public void updateReviewState(Map updateReviewMap) throws Exception;
	public void deleteGymReview(Map deleteReviewMap) throws Exception;
}
