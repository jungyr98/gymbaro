package com.myspring.gymbaro02.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
