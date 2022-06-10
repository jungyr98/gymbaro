package com.myspring.gymbaro02.goods.controller;

import java.util.ArrayList;
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
		addGoodsInQuick(goods_id,goodsVO,session); //조회한 상품정보를 퀵메뉴에 표시하기 위해 전달 
		
		session.setAttribute("goodsVO", goodsVO);
		session.setAttribute("optionList", goodsMap.get("optionList"));
		session.setAttribute("imageList", goodsMap.get("imageList"));

		mav.setViewName(viewName);

		return mav;
	}
	
	private void addGoodsInQuick(String goods_id,GoodsVO goodsVO, HttpSession session) {
		boolean already_existed = false;
		List<GoodsVO> quickGoodsList;
		quickGoodsList = (ArrayList<GoodsVO>)session.getAttribute("quickGoodsList");
		//세션에 저장된 가장 최근 본 상품 목록을 가져옴 
		if(quickGoodsList != null) { //최근 본 상품이 있는 경우 
			if(quickGoodsList.size() < 10) { //상품 목록이 4개 이하인 경우 
				for(int i =0; i<quickGoodsList.size(); i++) {
					GoodsVO goodsBean = (GoodsVO)quickGoodsList.get(i);
					if(goods_id.equals(goodsBean.getGoods_id())) {
						already_existed = true;
						break;
					}
				}//상품목을 가져와 이미 존재하는 상품인지 비교 
				if(already_existed == false) {
					quickGoodsList.add(goodsVO);
				}//false면 상품정보를 목록에 저장 
			}
		}else {
			quickGoodsList = new ArrayList<GoodsVO>();
			quickGoodsList.add(goodsVO);
			//최근 본 상품목록이 없으면 생성하여 상품 정보를 저장 
		}
		session.setAttribute("quickGoodsList", quickGoodsList); //상품목록 세션에 저장 
		session.setAttribute("quickGoodsListNum", quickGoodsList.size()); //상품개수 세션에 저장 
	}
}
