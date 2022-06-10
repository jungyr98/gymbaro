package com.myspring.gymbaro02.membership.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.membership.vo.MembershipVO;

public interface MembershipController {
	
	public ModelAndView membershipForm(@RequestParam Map<String, Object> optionMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addNewMembership(@RequestParam Map<String, Object> membershipMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
