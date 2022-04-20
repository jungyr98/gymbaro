package com.myspring.gymbaro02.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

public interface OrderController {

	public ModelAndView order_01(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView order_02(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView order_03(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
