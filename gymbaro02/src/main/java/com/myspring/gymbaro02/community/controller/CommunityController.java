package com.myspring.gymbaro02.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

public interface CommunityController {
	
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView communityDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView communityWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
