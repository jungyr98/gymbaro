package com.myspring.gymbaro02.cart.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.cart.vo.CartVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException{
		String result = sqlSession.selectOne("mapper.cart.selectCountInCart", cartVO);
		return Boolean.parseBoolean(result);
	}
	
	// 장바구니 추가
	@Override
	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException{
		sqlSession.insert("mapper.cart.insertGoodsInCart", cartVO);
	}
	
	// 내 장바구니 리스트
	@Override
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException{
		List<CartVO> cartList = (List)sqlSession.selectList("mapper.cart.selectCartList",cartVO);
		return cartList;
	}
	
	// 내 장바구니에 해당하는 상품 리스트
	@Override
	public List<GoodsVO> selectGoodsList(List<CartVO> cartList) throws DataAccessException {
		List<GoodsVO> myGoodsList;
		myGoodsList = sqlSession.selectList("mapper.cart.selectGoodsList",cartList);
		return myGoodsList;
	}
	
	// 카트 수량 변경
	@Override
	public void updateCartGoodsQty(CartVO cartVO) throws DataAccessException{
		sqlSession.insert("mapper.cart.updateCartGoodsQty",cartVO);
	}
	
	// 카드 상품 삭제
	@Override
	public void deleteCartGoods(List<CartVO> deleteList) throws DataAccessException{
		for(int i=0; i<deleteList.size(); i++) {
			CartVO cartVO = deleteList.get(i);
			int cart_id = cartVO.getCart_id();
			sqlSession.delete("mapper.cart.deleteCartGoods", cart_id);
		}
	}
	
	// 비회원 장바구니 조회하기
	@Override
	public List<GoodsVO> selectNonCartList(List<CartVO> cartList) throws DataAccessException{
		List<GoodsVO> myGoodsList = new ArrayList<GoodsVO>();
		for(int i=0; i<cartList.size(); i++) {
			CartVO cartVO = cartList.get(i);
			GoodsVO goodsVO = new GoodsVO();
			goodsVO = sqlSession.selectOne("mapper.cart.non_selectGoodsList", cartVO);
			myGoodsList.add(goodsVO);
			System.out.println("goodsVO item:" + goodsVO.getGoods_fileName());
		}
		return myGoodsList;
	}
}
