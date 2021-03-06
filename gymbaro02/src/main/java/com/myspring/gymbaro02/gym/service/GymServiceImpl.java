package com.myspring.gymbaro02.gym.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.gym.dao.GymDAO;
import com.myspring.gymbaro02.gym.vo.GymImageFileVO;
import com.myspring.gymbaro02.gym.vo.GymReviewVO;
import com.myspring.gymbaro02.gym.vo.GymVO;
import com.myspring.gymbaro02.liked.vo.LikedVO;

@Service("gymService")
@Transactional(propagation=Propagation.REQUIRED)
public class GymServiceImpl implements GymService {
	@Autowired
	private GymDAO gymDAO;
	
	//시설 리스트 추출
	@Override
	public Map<String,List<GymVO>> listGym(Map<String, Object> condMap) throws Exception {
		Map<String,List<GymVO>> gymMap=new HashMap<String,List<GymVO>>();
		List<GymVO> gymRecommandList = gymDAO.selectRecommandGymsList();
		gymMap.put("recommandList", gymRecommandList);
		List<GymVO> gymLocationList = gymDAO.selectLocationGymsList(condMap);
		gymMap.put("locationList", gymLocationList);

		return gymMap;
	}
	
	//시설 상세페이지 추출
	@Override
	public Map<String,Object> GymDetail(String gym_id, int uid) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		// 해당 시설 상세정보 조회
		GymVO gymVO = gymDAO.selectGymDetail(gym_id);
		map.put("gymVO", gymVO);
		//
		// 해당 시설 상세 이미지 조회
		List<GymImageFileVO> imageList = gymDAO.selectGymDetailImage(gym_id);
		map.put("imageList", imageList);
		//
		// 해당 시설 찜 여부 조회
		LikedVO likedVO = new LikedVO();
		likedVO.setGym_id(Integer.parseInt(gym_id));
		likedVO.setUid(uid);
		int likedState = gymDAO.likedState(likedVO);
		map.put("likedState", likedState);
		//
		return map;
	}
	
	@Override
	public void newReview(GymReviewVO gymReviewVO) {
		gymDAO.newReview(gymReviewVO);
	}
	
	@Override
	public List<GymReviewVO> viewAll(String gym_id) {
		return gymDAO.viewAll(gym_id);
	}
	
	@Override
	public double getGymAvg(String gym_id) {
		return gymDAO.getGymAvg(gym_id);
	}
	
	@Override
	public double getInstructorAvg(String gym_id) {
		return gymDAO.getInstructorAvg(gym_id);
	}
	
	@Override
	public double getAccessAvg(String gym_id) {
		return gymDAO.getAccessAvg(gym_id);
	}
	
	@Override
	public double getPersonalScoreAvg_gym(Map personalScoreMap) {
		return gymDAO.getPersonalScoreAvg_gym(personalScoreMap);
	}
	
	@Override
	public double getPersonalScoreAvg_instructor(Map personalScoreMap) {
		return gymDAO.getPersonalScoreAvg_instructor(personalScoreMap);
	}
	
	@Override
	public double getPersonalScoreAvg_access(Map personalScoreMap) {
		return gymDAO.getPersonalScoreAvg_access(personalScoreMap);
	}
	
	@Override
	public String getReviewCount(String gym_id) {
		return gymDAO.getReviewCount(gym_id);
	}
	
	@Override
	public void deleteReview(int review_id) {
		gymDAO.deleteReview(review_id);
	}
	
	@Override
	public int getMembershipInfo(Map membershipInfoMap) {
		return gymDAO.getMembershipInfo(membershipInfoMap);
	}
	
	@Override
	public void updateReviewState(Map updateReviewMap) {
		gymDAO.updateReviewState(updateReviewMap);
	}
	
	@Override
	public void deleteGymReview(Map deleteReviewMap) {
		gymDAO.deleteGymReview(deleteReviewMap);
	}
}
