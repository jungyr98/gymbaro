package com.myspring.gymbaro02.goods.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsController {

	public ModelAndView searchGoods(@RequestParam(value="limit", defaultValue="10") String limit, 
			@RequestParam Map<String,Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addNewReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
