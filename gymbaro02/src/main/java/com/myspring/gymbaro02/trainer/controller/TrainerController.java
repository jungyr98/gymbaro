package com.myspring.gymbaro02.trainer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface TrainerController {

	public ModelAndView searchGoods(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
