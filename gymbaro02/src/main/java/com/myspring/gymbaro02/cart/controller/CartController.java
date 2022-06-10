package com.myspring.gymbaro02.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goods_id, @RequestParam("goods_qty") int goods_qty, 
			@RequestParam("option_name") String option_name, @RequestParam("add_price") int add_price, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String  modifyCartQty(@RequestParam("cart_id") int cart_id,
            @RequestParam("cart_goods_qty") int cart_goods_qty,
             HttpServletRequest request, HttpServletResponse response)  throws Exception; // 장바구니 상품 수량 수정
	public ModelAndView removeCartGoods(HttpServletRequest request, HttpServletResponse response)  throws Exception; // 장바구니 상품 삭제
}
