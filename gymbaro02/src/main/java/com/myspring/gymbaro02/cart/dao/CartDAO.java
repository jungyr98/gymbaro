package com.myspring.gymbaro02.cart.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.cart.vo.CartVO;

public interface CartDAO {
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException;
	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException;
}
