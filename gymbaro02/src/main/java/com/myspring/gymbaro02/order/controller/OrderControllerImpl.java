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

import com.myspring.gymbaro02.cart.vo.CartVO;
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
		
		// 장바구니에서 주문했다면, 카트에서 삭제할 데이터 저장해놓기
		if(orderMap.get("cart_id")!=null) {
			List<CartVO> deleteList = new ArrayList<CartVO>();
			CartVO cartVO = new CartVO();
			String cart_id = orderMap.get("cart_id");
			cartVO.setCart_id(Integer.parseInt(cart_id));
			deleteList.add(cartVO);
			session.setAttribute("deleteList", deleteList);
		}
		//
		
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
		_orderVO.setFileName(orderMap.get("fileName"));
		session.setAttribute("orderInfo", _orderVO);
		session.setAttribute("orderMap", orderMap);
		
		System.out.println("qty:" + _orderVO.getGoods_qty() + ", total_price: " + _orderVO.getTotal_price());
		orderVO=_orderVO;

		
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
	@RequestMapping(value="/orderCheckCartGoods.do" ,method = RequestMethod.POST)
	public void orderCheckCartGoods(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		
		List<OrderVO> myOrderList=new ArrayList<OrderVO>();
		
		String[] goods_id = request.getParameterValues("goods_id");
		String[] goods_name = request.getParameterValues("goods_name");
		String[] goods_price = request.getParameterValues("goods_price");
		String[] option_name = request.getParameterValues("option_name");
		String[] goods_qty = request.getParameterValues("goods_qty");
		String[] fileName = request.getParameterValues("fileName");
		
		if(request.getParameterValues("cart_id")!=null) {
			// 주문 후 장바구니 상품 삭제를 위한 데이터 저장
			String[] cart_id = request.getParameterValues("cart_id");
			List<CartVO> deleteList = new ArrayList<CartVO>();
			for(int i=0; i<cart_id.length; i++) {
				CartVO cartVO = new CartVO();
				cartVO.setCart_id(Integer.parseInt(cart_id[i]));
				deleteList.add(cartVO);
			}		
			session.setAttribute("deleteList", deleteList); // 주문 성공후 장바구니 상품 삭제해주기 위해 주문폼으로 데이터 바인딩
		}
		
		
		int total_price = 0;
		int order_goods_qty = 0;
		for(int i=0; i<goods_id.length; i++) {
			OrderVO orderVO = new OrderVO();
			orderVO.setGoods_id(Integer.parseInt(goods_id[i]));
			orderVO.setGoods_name(goods_name[i]);
			orderVO.setTotal_price(Integer.parseInt(goods_price[i]));
			total_price += Integer.parseInt(goods_price[i]);
			orderVO.setOption_name(option_name[i]);
			orderVO.setGoods_qty(Integer.parseInt(goods_qty[i]));
			order_goods_qty += Integer.parseInt(goods_qty[i]);
			orderVO.setFileName(fileName[i]);
			myOrderList.add(orderVO);
		}
		OrderVO _orderVO = new OrderVO();
		_orderVO.setTotal_price(total_price);
		_orderVO.setGoods_qty(order_goods_qty);
		session.setAttribute("orderInfo", _orderVO);
		session.setAttribute("myOrderList", myOrderList);

	}
	
	@Override
	@RequestMapping(value= "/orderGoodsForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView orderGoodsform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value= "/payToOrderGoods.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView payToOrderGoods(@RequestParam Map<String, String> receiverMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		session=request.getSession();
		int uid=0;
		String orderer_name="";
		
		if(session.getAttribute("memberInfo")!=null) {
			MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
			uid = memberVO.getUid();
			orderer_name=memberVO.getMember_name(); // 회원이면 주문자명은 회원 이름으로 값 지정
			
			// 포인트 사용했을 시 차감하는 함수 실행
			if(receiverMap.get("point")!="0") {
				String usePoint = receiverMap.get("point");
				Map<String,Object> pointMap = new HashMap<String, Object>();
				pointMap.put("uid", uid);
				pointMap.put("usePoint", usePoint);
				orderService.minusUsePoint(pointMap);
			}
		}else {
			orderer_name=receiverMap.get("orderer_name"); // 비회원이면 주문자는 사용자가 입력한 데이터로 값 지정
		}

		List<OrderVO> myOrderList = (List<OrderVO>)session.getAttribute("myOrderList");
		System.out.println("myOrderList.size:" + myOrderList.size());
		for(int i=0; i<myOrderList.size();i++){
			OrderVO orderVO=(OrderVO)myOrderList.get(i);
			orderVO.setOrderer_name(orderer_name);
			
			if(session.getAttribute("memberInfo")!=null) {
				orderVO.setUid(uid);
				orderVO.setMember_yn("Y");
			} else {
				orderVO.setMember_yn("N");
			}

			//orderVO.setGoods_qty(Integer.parseInt(receiverMap.get("goods_qty")));
			orderVO.setReceiver_name(receiverMap.get("receiver_name"));			
			orderVO.setReceiver_phone_number(receiverMap.get("receiver_phone_number"));
			orderVO.setReceiver_zipcode(receiverMap.get("receiver_zipcode"));
			orderVO.setReceiver_roadAddress(receiverMap.get("receiver_roadAddress"));
			orderVO.setReceiver_extraAddress(receiverMap.get("receiver_extraAddress"));
			orderVO.setPayment(receiverMap.get("payment"));
			orderVO.setTotal_price(Integer.parseInt(receiverMap.get("total_price")));
			orderVO.setDelivery_memo(receiverMap.get("delivery_memo"));
			
			myOrderList.set(i, orderVO); //각 orderVO에 주문자 정보를 세팅한 후 다시 myOrderList에 저장한다.
		}//end for
		
	    String order_id = orderService.addNewOrder(myOrderList);
	    
	    // 회원과 비회원이 장바구니에서 주문을 할 경우 주문 성공 후 장바구니에서 해당 상품들 삭제하기
	    if(session.getAttribute("deleteList")!=null) {
	    	List<CartVO> deleteList = (List<CartVO>)session.getAttribute("deleteList");
	    	orderService.deleteCartItem(deleteList); // 회원은 db에서 데이터 제거
	    }
	    if(session.getAttribute("non_cartMap")!=null) {
	    	System.out.println("여긴 들어오니 ..? for문 진입");
	    	Map<String,List> non_cartMap = (Map<String, List>) session.getAttribute("non_cartMap");
	    	List<CartVO> myCartList = non_cartMap.get("myCartList");
	    	for(int i=0; i<myOrderList.size(); i++) {
	    		OrderVO _orderVO = myOrderList.get(i);
	    		System.out.println("orderVO:" + _orderVO.getOption_name());
	    		for(int j=0; j<myCartList.size(); j++) {
	    			CartVO cartVO = myCartList.get(j);
	    			System.out.println("cartVO:" + cartVO.getOption_name());
	    			if(cartVO.getOption_name().equals(_orderVO.getOption_name())) {
	    				System.out.println("둘이 같을때 옵션명:" + cartVO.getOption_name() + ", " + _orderVO.getOption_name());
	    				if(i!=0 && j!=0) {
	    					myCartList.remove(j-1); // 여러개를 삭제할 때, 하나씩 remove 될 때마다 리스트의 인덱스는 갱신이 되므로, 삭제할 데이터가 두개 이상이라면 인덱스-1을 해준다.
						}else {
							myCartList.remove(j); // 하나만 삭제한다면 가져온 인덱스 값을 그대로 remove 해준다.
						}
	    			}
	    		}
	    		non_cartMap.put("myCartList", myCartList);
	    	}
	    	session.removeAttribute("non_cartMap");
	    	session.setAttribute("non_cartMap", non_cartMap);
	    }
	    //
	    
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
