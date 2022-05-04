package com.myspring.gymbaro02.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("orderController")
@RequestMapping(value="/order")
public class OrderControllerImpl {

	@RequestMapping(value= "/order_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView order_01(@RequestParam Map<String,String> orderMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		session.setAttribute("orderMap", orderMap);
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/order_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView order_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/order_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView order_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping("/order_coupon.do")
	public ModelAndView order_coupon(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
}
