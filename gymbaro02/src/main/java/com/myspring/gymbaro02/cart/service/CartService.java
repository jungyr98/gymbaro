package com.myspring.gymbaro02.cart.service;

import com.myspring.gymbaro02.cart.vo.CartVO;

public interface CartService {
	public boolean findCartGoods(CartVO cartVO) throws Exception;
	public void addGoodsInCart(CartVO cartVO) throws Exception;
}
