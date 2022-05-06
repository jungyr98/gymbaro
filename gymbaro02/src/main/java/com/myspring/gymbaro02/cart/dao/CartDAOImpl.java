package com.myspring.gymbaro02.cart.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.cart.vo.CartVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException{
		String result = sqlSession.selectOne("mapper.cart.selectCountInCart", cartVO);
		return Boolean.parseBoolean(result);
	}
	
	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException{
		sqlSession.insert("mapper.cart.insertGoodsInCart", cartVO);
	}
}
