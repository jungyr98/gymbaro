package com.myspring.gymbaro02.order.controller;

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

import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.order.service.OrderService;
import com.myspring.gymbaro02.order.vo.OrderVO;

@Controller("orderController")
@RequestMapping(value="/order")
public class OrderControllerImpl implements OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderVO orderVO;
	
	@Override
	@RequestMapping(value= "/order_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView order_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value="/orderEachGoods.do" , method = RequestMethod.POST)
	public ModelAndView orderEachGoods(@RequestParam Map<String,String> orderMap,
            HttpServletRequest request, HttpServletResponse response)  throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		session=request.getSession();
		
		// 받아온 값 orderVO 객체로 삽입
		String goods_name = orderMap.get("goods_name");
		int goods_qty=0;
		int total_price=0;
		if(orderMap.get("goods_qty")!=null && orderMap.get("total_price")!=null) {
		goods_qty = Integer.parseInt(orderMap.get("goods_qty"));
		total_price = Integer.parseInt(orderMap.get("total_price"));
		}
		OrderVO _orderVO = new OrderVO();
		_orderVO.setGoods_id(Integer.parseInt(orderMap.get("goods_id")));
		_orderVO.setGoods_name(goods_name);
		_orderVO.setOption_name(orderMap.get("option_name"));
		_orderVO.setGoods_qty(goods_qty);
		_orderVO.setTotal_price(total_price);
		session.setAttribute("orderInfo", _orderVO);
		session.setAttribute("orderMap", orderMap);
		
		Boolean isLogOn=(Boolean)session.getAttribute("isLogOn");
		String action=(String)session.getAttribute("action");
		//로그인 여부 체크
		//이전에 로그인 상태인 경우는 주문과정 진행
		//로그아웃 상태인 경우 로그인 화면으로 이동
		if(isLogOn==null || isLogOn==false){
			session.setAttribute("orderInfo", _orderVO);
			session.setAttribute("action", "/order/orderEachGoods.do");
			return new ModelAndView("redirect:/member/loginForm.do");
		}else{
			 if(action!=null && action.equals("/order/orderEachGoods.do")){
				orderVO=(OrderVO)session.getAttribute("orderInfo");
				session.removeAttribute("action");
			 }else {
				 orderVO=_orderVO;
			 }
		 }
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<OrderVO> myOrderList=new ArrayList<OrderVO>();
		myOrderList.add(orderVO);

		MemberVO memberInfo=(MemberVO)session.getAttribute("memberInfo");
		
		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("memberInfo", memberInfo);
		return mav;
	}
	
	@Override
	@RequestMapping(value= "/payToOrderGoods.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView payToOrderGoods(@RequestParam Map<String, String> receiverMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		session=request.getSession();
		
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		int uid = memberVO.getUid();
		String orderer_name=memberVO.getMember_name();
		List<OrderVO> myOrderList=(List<OrderVO>)session.getAttribute("myOrderList");
		Boolean isLogOn=(Boolean)session.getAttribute("isLogOn");
		
		// 포인트 사용했을 시 차감하는 함수 실행
				if(receiverMap.get("point")!=null) {
					String usePoint = receiverMap.get("point");
					Map<String,Object> pointMap = new HashMap<String, Object>();
					pointMap.put("uid", uid);
					pointMap.put("usePoint", usePoint);
					orderService.minusUsePoint(pointMap);
				}
		
		for(int i=0; i<myOrderList.size();i++){
			OrderVO orderVO=(OrderVO)myOrderList.get(i);
			orderVO.setUid(uid);
			orderVO.setOrderer_name(orderer_name);
			
			if(isLogOn == true) {
				orderVO.setMember_yn("Y");
			} else {
				orderVO.setMember_yn("N");
			}
			
			orderVO.setGoods_qty(Integer.parseInt(receiverMap.get("goods_qty")));
			orderVO.setReceiver_name(receiverMap.get("receiver_name"));			
			orderVO.setReceiver_phone_number(receiverMap.get("receiver_phone_number"));
			orderVO.setReceiver_zipcode(receiverMap.get("receiver_zipcode"));
			orderVO.setReceiver_roadAddress(receiverMap.get("receiver_roadAddress"));
			orderVO.setPayment(receiverMap.get("payment"));
			orderVO.setTotal_price(Integer.parseInt(receiverMap.get("total_price")));
			orderVO.setDelivery_memo(receiverMap.get("delivery_memo"));
			
			myOrderList.set(i, orderVO); //각 orderVO에 주문자 정보를 세팅한 후 다시 myOrderList에 저장한다.
		}//end for
		
	    String order_id = orderService.addNewOrder(myOrderList);
	    receiverMap.put("order_id", order_id);
		mav.addObject("myOrderInfo",receiverMap);//OrderVO로 주문결과 페이지에  주문자 정보를 표시한다.
		mav.addObject("myOrderList", myOrderList);
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping("/order_coupon.do")
	public ModelAndView order_coupon(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
}
