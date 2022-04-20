package com.myspring.gymbaro02.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

public interface MemberController {

	public ModelAndView join01(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join02(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join03_1(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join03_2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join04(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
