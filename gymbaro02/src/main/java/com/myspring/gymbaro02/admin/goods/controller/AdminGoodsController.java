package com.myspring.gymbaro02.admin.goods.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface AdminGoodsController {
	public ModelAndView selectGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addNewGoodsForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addNewGoods(@RequestParam Map<String,Object> goodsMap, MultipartHttpServletRequest multipartRequest, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void updateGoodsState(@RequestParam Map<String,Object> updateGoodsMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void deleteGoods(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateGoodsForm(@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modifyGoodsInfo(@RequestParam("attribute") String attribute, @RequestParam("value") String value,
			@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addGoodsOption(@RequestParam("goods_id") String goods_id, @RequestParam("value") String value, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modifyOption(@RequestParam("option_id") String option_id, @RequestParam("value") String value,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateGoodsImage(@RequestParam Map<String,Object> imageMap, MultipartHttpServletRequest multipartRequest, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity deleteOption(@RequestParam("option_id") String option_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String updateGoodsEvent(@RequestParam("event_id") int event_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String deleteGoodsEvent(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
