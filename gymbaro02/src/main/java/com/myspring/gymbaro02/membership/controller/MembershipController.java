package com.myspring.gymbaro02.membership.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

public interface MembershipController {
	
	public ModelAndView membershipForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView membershipResult(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
