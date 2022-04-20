package com.myspring.gymbaro02.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

public interface MypageController {

	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myPage02(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myPage03(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myPage04(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myPage05(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myPage06(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView outMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
