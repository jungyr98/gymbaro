package com.myspring.gymbaro02.cart.controller;

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

import com.myspring.gymbaro02.cart.service.CartService;
import com.myspring.gymbaro02.cart.vo.CartVO;
import com.myspring.gymbaro02.member.vo.MemberVO;


@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl implements CartController {
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private CartService cartService;
	
	
	@RequestMapping(value= "/goodsCart.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		session.setAttribute("section", 1);
		session.setAttribute("pageNum", 1);
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}

	@Override
	@RequestMapping(value="/addGoodsInCart.do", method= RequestMethod.POST,produces="application/text; charset=utf-8")
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goods_id,  HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		int uid = memberVO.getUid();
		System.out.println("######");
		cartVO.setUid(uid);
		cartVO.setGoods_id(goods_id);
		boolean isAlreadyExisted = cartService.findCartGoods(cartVO); //상품번호가 장바구니에 있는지 조회
		System.out.println("isAlreadyExisted: " + isAlreadyExisted);
		if(isAlreadyExisted==true) {
			return "already_existed";
		}else {
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
		
	}
	
	@Override
	@RequestMapping(value="/myCartList.do", method=RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		int uid = memberVO.getUid();
		cartVO.setUid(uid);
		Map<String,List> cartMap = cartService.myCartList(cartVO);
		session.setAttribute("cartMap", cartMap);
		return mav;
		
		
	}
	
}
