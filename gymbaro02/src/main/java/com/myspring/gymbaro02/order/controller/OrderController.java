package com.myspring.gymbaro02.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface OrderController {

	public ModelAndView order_01(@RequestParam Map<String,String> orderMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView order_02(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView order_03(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
