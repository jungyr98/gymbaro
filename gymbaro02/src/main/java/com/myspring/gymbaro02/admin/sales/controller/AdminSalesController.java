package com.myspring.gymbaro02.admin.sales.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdminSalesController {
	public ModelAndView selectSalesList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
