package com.myspring.gymbaro02.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("goodsController")
@EnableAspectJAutoProxy
public class GoodsControllerImpl implements GoodsController {

	@RequestMapping(value= "/goods/searchGoods.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchGoods(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		session.setAttribute("section", 1);
		session.setAttribute("pageNum", 1);
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/goods/goodsInfo.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView goodsInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
}
