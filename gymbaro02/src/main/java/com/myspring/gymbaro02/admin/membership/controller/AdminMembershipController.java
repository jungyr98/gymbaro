package com.myspring.gymbaro02.admin.membership.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminMembershipController {
	public ModelAndView listMembership(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void updateMembershipState(@RequestParam Map<String,Object> updateMembershipMap, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	public void deleteMembership(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
