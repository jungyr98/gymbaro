package com.myspring.gymbaro02.admin.gym.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminGymController {
	public ModelAndView selectGymList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateGymState(@RequestParam Map<String,Object> updateStateMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateRecommand(@RequestParam Map<String,Object> updateRecommandMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
