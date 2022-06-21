package com.myspring.gymbaro02.goods.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.myspring.gymbaro02.goods.vo.GoodsReviewVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;
import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.order.vo.OrderVO;

@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl implements GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@Override
	@RequestMapping(value= "/searchGoods.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchGoods(@RequestParam(value="limit", defaultValue="12") String limit, @RequestParam Map<String,Object> condMap, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		List<String> subItemList = new ArrayList<String>();
		System.out.println("limit:" + limit);
		condMap.put("limit", Integer.parseInt(limit));
		if(request.getParameterValues("sub_item")!=null) {
			String[] sub_item = request.getParameterValues("sub_item");
			for(int i=0; i<sub_item.length; i++) {
				subItemList.add(sub_item[i]);
			}
			condMap.put("subItemList", subItemList);
		}

		Map<String,List<GoodsVO>> goodsMap = goodsService.listGoods(condMap);
		
		session.setAttribute("goodsMap", goodsMap);
		session.setAttribute("condMap", condMap);
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
		
		// 탭메뉴 변경
		if(request.getParameter("tab")!=null) {
			String tab = request.getParameter("tab");
			mav.addObject("tab", tab);
		}
		
		
		Map goodsMap = goodsService.goodsDetail(goods_id);
		GoodsVO goodsVO = (GoodsVO) goodsMap.get("goodsVO");
		addGoodsInQuick(goods_id,goodsVO,session); //조회한 상품정보를 퀵메뉴에 표시하기 위해 전달 
		
		session.setAttribute("goodsVO", goodsVO);
		session.setAttribute("optionList", goodsMap.get("optionList"));
		session.setAttribute("imageList", goodsMap.get("imageList"));

		List<GoodsReviewVO> viewAll = goodsService.viewAll(goods_id); // 전체 리뷰 조회
		mav.addObject("viewAll", viewAll);
	
		if (viewAll != null) {
		int reviewCount = goodsService.getReviewCount(goods_id); // 리뷰 개수 카운트 
		int countScore1 = goodsService.countScore1(goods_id); // 1점 개수 카운트
		int countScore2 = goodsService.countScore2(goods_id); // 2점 개수 카운트
		int countScore3 = goodsService.countScore3(goods_id); // 3점 개수 카운트 
		int countScore4 = goodsService.countScore4(goods_id); // 4점 개수 카운트
		int countScore5 = goodsService.countScore5(goods_id); // 5점 개수 카운트
		double scoreAvg = goodsService.getScoreAvg(goods_id); // 평균 별점 출력
		
		// 로그인 후 마이페이지 경로를 통해서만 리뷰 작성할 수 있게 함	
		if (session.getAttribute("memberInfo") != null) { // 비로그인 상태 방지
			if(session.getAttribute("orderDetailList") != null) { // 로그인 후 바로 상품 페이지 들어갔을 때 작성 창 노출 방지
				List<OrderVO> orderList = (List<OrderVO>) session.getAttribute("orderDetailList"); 
		
					for(int i=0; i<orderList.size(); i++) {
						String order_id = orderList.get(i).getOrder_id(); 
						String option_name = request.getParameter("option_name");	
						Map<String, Object> reviewInfoMap = new HashMap();
						reviewInfoMap.put("goods_id", goods_id);
						reviewInfoMap.put("order_id", order_id);
						reviewInfoMap.put("option_name", option_name);
			
						String reviewState = goodsService.getReviewInfo(reviewInfoMap); // order_id + goods_id에 해당하는 review_yn 정보 가져옴 Y or N 
						
						session.setAttribute("reviewState", reviewState);
					}
				}
			}
		
		// 마이페이지에서 리뷰 입력시 겟방식으로 보낸 주문번호 받아오기
		if(request.getParameter("order_id")!=null && request.getParameter("option_name")!=null) {
			String order_id = request.getParameter("order_id");
			String option_name = request.getParameter("option_name");
			System.out.println("goodsInfo.do: " + order_id +"," + option_name);
			mav.addObject("myOrder_id", order_id);
			mav.addObject("myOption_name", option_name);
		}
		
		session.setAttribute("goodsCsList", goodsMap.get("goodsCsList"));
		session.setAttribute("commentList", goodsMap.get("commentList"));
		
		mav.addObject("reviewCount", reviewCount);
		mav.addObject("countScore1", countScore1);
		mav.addObject("countScore2", countScore2);
		mav.addObject("countScore3", countScore3);
		mav.addObject("countScore4", countScore4);
		mav.addObject("countScore5", countScore5);
		mav.addObject("scoreAvg", scoreAvg);
		mav.addObject("viewAll", viewAll);
		
		} else {
			mav.addObject("viewAll", viewAll);
		}
		
		mav.setViewName(viewName);

		return mav;
	}
	
	// 마이페이지에서 리뷰 작성 폼으로 진입
		@RequestMapping(value="/newReviewForm.do", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView newReviewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			
			List<OrderVO> orderList = (List<OrderVO>) session.getAttribute("orderDetailList"); // 주문 정보가 들어있는 리스트를 세션에서 받아옴
			
			String goods_id = request.getParameter("goods_id");
			String order_id = request.getParameter("order_id");
			String option_name = request.getParameter("option_name");

			mav.setViewName("redirect:/goods/goodsInfo.do?goods_id=" + goods_id + "&order_id="+order_id+"&option_name="+option_name);
					
			return mav;
		}
		
		// 리뷰 작성 후 데이터베이스에 저장
		@Override
		@RequestMapping(value="/addNewReview.do", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView addNewReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			ModelAndView mav = new ModelAndView();
			
			GoodsReviewVO goodsReviewVO = new GoodsReviewVO();
				
			MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			int member_level = memberVO.getMember_level();
			String review_writer = memberVO.getMember_name();
			
			String content = request.getParameter("content");
			int score = Integer.parseInt(request.getParameter("score"));
			
			String goods_id = request.getParameter("goods_id");
			String order_id = request.getParameter("order_id");
			String option_name = request.getParameter("option_name");
			
			Map<String, Object> updateReviewStateMap = new HashMap<String, Object>();
			updateReviewStateMap.put("goods_id", goods_id);
			updateReviewStateMap.put("order_id", order_id);
			updateReviewStateMap.put("option_name", option_name);
			
			goodsReviewVO.setGoods_id(goods_id);
			goodsReviewVO.setUid(uid);
			goodsReviewVO.setReview_writer(review_writer);
			goodsReviewVO.setContent(content);
			goodsReviewVO.setScore(score);
			goodsReviewVO.setMember_level(member_level);
			goodsReviewVO.setOrder_id(order_id);
			goodsReviewVO.setOption_name(option_name);
			
			
		
			goodsService.addNewReview(goodsReviewVO);
			goodsService.updateReviewState(updateReviewStateMap);
			
			session.setAttribute("goodsReviewVO", goodsReviewVO);
		
			mav.setViewName("redirect:goodsInfo.do?tab=review&goods_id=" + goods_id);
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
