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
import com.myspring.gymbaro02.gym.vo.GymVO;

@Service("gymService")
@Transactional(propagation=Propagation.REQUIRED)
public class GymServiceImpl implements GymService {
	@Autowired
	private GymDAO gymDAO;
	
	//시설 리스트 추출
	@Override
	public Map<String,List<GymVO>> listGym(String address) throws Exception {
		Map<String,List<GymVO>> gymMap=new HashMap<String,List<GymVO>>();
		List<GymVO> gymRecommandList = gymDAO.selectRecommandGymsList();
		gymMap.put("recommandList", gymRecommandList);
		List<GymVO> gymLocationList = gymDAO.selectLocationGymsList(address);
		gymMap.put("locationList", gymLocationList);

		return gymMap;
	}
	
	//시설 상세페이지 추출
	@Override
	public Map<String,Object> GymDetail(String gym_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		GymVO gymVO = gymDAO.selectGymDetail(gym_id);
		map.put("gymVO", gymVO);
		List<GymImageFileVO> imageList = gymDAO.selectGymDetailImage(gym_id);
		map.put("imageList", imageList);
		return map;
	}
}
