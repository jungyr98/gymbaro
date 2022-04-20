package com.myspring.gymbaro02.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
