package com.myspring.gymbaro02.gym.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.gym.vo.GymVO;

public interface GymService {
	public Map<String,List<GymVO>> listGym(String address) throws Exception;
	public Map<String,Object> GymDetail(String gym_id, int uid) throws Exception;
}
