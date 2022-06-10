package com.myspring.gymbaro02.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.cart.vo.CartVO;
import com.myspring.gymbaro02.order.vo.OrderVO;

public interface OrderDAO {

	public String insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException; // 주문 테이블에 데이터 추가
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException; // 내 주문내역 보기
	public void minusUsePoint(Map pointMap) throws DataAccessException; // 포인트 사용했을시 차감하기
	public void deleteCartItem(List<CartVO> deleteList) throws DataAccessException; // 주문 테이블에서 주문 성공했을시 장바구니에서 상품 제거
}
