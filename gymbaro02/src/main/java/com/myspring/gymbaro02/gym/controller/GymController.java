package com.myspring.gymbaro02.gym.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GymController {

	public ModelAndView searchGym(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView gymsInfo(@RequestParam("gym_id") String gym_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView insertGym_01(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView insertGym_02(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView insertGym_03(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchMap(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
