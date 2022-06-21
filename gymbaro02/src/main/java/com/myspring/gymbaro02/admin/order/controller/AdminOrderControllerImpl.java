package com.myspring.gymbaro02.admin.order.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.admin.order.service.AdminOrderService;
import com.myspring.gymbaro02.order.vo.OrderVO;

@Controller("adminOrderController")
@RequestMapping(value="/admin/order")
public class AdminOrderControllerImpl implements AdminOrderController {
	@Autowired
	private AdminOrderService adminOrderService;
	
	@Override
	@RequestMapping(value="/selectOrderList.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView listOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		List<OrderVO> listOrder = adminOrderService.listOrder();
		session.setAttribute("listOrder", listOrder);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// 주문상태 변경하기
	@Override
	@RequestMapping(value="/updateOrderState.do", method={RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String updateOrderState(@RequestParam Map<String, Object> updateMap, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		
		adminOrderService.updateOrderState(updateMap);
		message = "modifySuccess";
		
		return message;
	}
}
