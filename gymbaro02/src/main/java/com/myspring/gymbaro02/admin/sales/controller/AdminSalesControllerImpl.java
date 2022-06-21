package com.myspring.gymbaro02.admin.sales.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.admin.sales.service.AdminSalesService;

@Controller("adminSalesController")
@RequestMapping(value="/admin/sales")
public class AdminSalesControllerImpl implements AdminSalesController {
	@Autowired
	private AdminSalesService adminSalesServie;
	
	@Override
	@RequestMapping(value="/selectSalesList.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView selectSalesList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		if(request.getParameter("sales_type")!=null) {
			String sales_type = request.getParameter("sales_type");
			mav.addObject("sales_type", sales_type);
		}
		
		Map<String, Object> salesMap = adminSalesServie.selectSalesList();
		mav.addObject("salesMap", salesMap);
		
		mav.setViewName(viewName);
		return mav;
	}
}
