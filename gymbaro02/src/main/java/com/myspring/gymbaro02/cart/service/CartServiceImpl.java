package com.myspring.gymbaro02.cart.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.cart.dao.CartDAO;
import com.myspring.gymbaro02.cart.vo.CartVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;


@Service("cartService")
@Transactional(propagation = Propagation.REQUIRED)
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public boolean findCartGoods(CartVO cartVO) throws Exception{
		return cartDAO.selectCountInCart(cartVO);
	}
	
	@Override
	public void addGoodsInCart(CartVO cartVO) throws Exception{
		cartDAO.insertGoodsInCart(cartVO);
	}
	
	@Override
	public Map<String, List> myCartList(CartVO cartVO) throws Exception{
		Map<String, List> cartMap = new HashMap<String,List>();
		List<CartVO> myCartList = cartDAO.selectCartList(cartVO);
		if(myCartList.size()==0) {
			return null;
		}
		List<GoodsVO> myGoodsList = cartDAO.selectGoodsList(myCartList);
		System.out.println("test:" + myGoodsList.get(0).getGoods_fileName());
		cartMap.put("myCartList", myCartList);
		cartMap.put("myGoodsList", myGoodsList);
		return cartMap;
	}
}
