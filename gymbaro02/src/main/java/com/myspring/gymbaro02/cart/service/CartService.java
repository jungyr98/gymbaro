package com.myspring.gymbaro02.cart.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.cart.vo.CartVO;

public interface CartService {
	public boolean findCartGoods(CartVO cartVO) throws Exception;
	public void addGoodsInCart(CartVO cartVO) throws Exception;
	public Map<String, List> myCartList(CartVO cartVO) throws Exception;
}
