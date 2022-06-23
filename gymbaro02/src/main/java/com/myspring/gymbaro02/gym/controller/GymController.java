package com.myspring.gymbaro02.gym.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GymController {

	public ModelAndView searchGym(@RequestParam(value="limit", defaultValue="12") String limit, @RequestParam Map<String,Object> condMap, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView gymsInfo(@RequestParam("gym_id") String gym_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchMap(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView newReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteGymReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
