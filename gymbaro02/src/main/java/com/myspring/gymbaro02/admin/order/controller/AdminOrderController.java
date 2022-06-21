package com.myspring.gymbaro02.admin.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface AdminOrderController {
	public ModelAndView listOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String updateOrderState(@RequestParam Map<String, Object> updateMap, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}
