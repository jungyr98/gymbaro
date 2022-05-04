package com.myspring.gymbaro02.goods.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.goods.service.GoodsService;
import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl implements GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@Override
	@RequestMapping(value= "/searchGoods.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchGoods(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		session.setAttribute("section", 1);
		session.setAttribute("pageNum", 1);
		ModelAndView mav=new ModelAndView();
		Map<String,List<GoodsVO>> goodsMap = goodsService.listGoods();
		
		session.setAttribute("goodsMap", goodsMap);
		//session.setAttribute("all", goodsMap.get("all"));
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value= "/goodsInfo.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		
		Map goodsMap = goodsService.goodsDetail(goods_id);
		GoodsVO goodsVO = (GoodsVO) goodsMap.get("goodsVO");
		
		session.setAttribute("goodsVO", goodsVO);
		session.setAttribute("optionList", goodsMap.get("optionList"));
		session.setAttribute("imageList", goodsMap.get("imageList"));

		mav.setViewName(viewName);

		return mav;
	}
}
