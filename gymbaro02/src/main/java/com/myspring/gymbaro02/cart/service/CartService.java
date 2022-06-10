package com.myspring.gymbaro02.cart.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.cart.vo.CartVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

public interface CartService {
	public boolean findCartGoods(CartVO cartVO) throws Exception;
	public void addGoodsInCart(CartVO cartVO) throws Exception;
	public Map<String, List> myCartList(CartVO cartVO) throws Exception;
	public boolean modifyCartQty(CartVO cartVO) throws Exception;
	public void removeCartGoods(List<CartVO> deleteList) throws Exception;
	public List<GoodsVO> nonCartList(List<CartVO> cartList) throws Exception;
}
