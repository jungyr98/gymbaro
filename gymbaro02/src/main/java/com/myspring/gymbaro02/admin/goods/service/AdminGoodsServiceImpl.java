package com.myspring.gymbaro02.admin.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.admin.goods.dao.AdminGoodsDAO;
import com.myspring.gymbaro02.event.vo.EventVO;
import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

@Service("adminGoodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminGoodsServiceImpl implements AdminGoodsService {
	@Autowired
	private AdminGoodsDAO adminGoodsDAO;
	
	// 상품 리스트 가져오기
	@Override
	public List<GoodsVO> selectGoodsList() throws Exception {
		List<GoodsVO> listGoods = adminGoodsDAO.selectGoodsList();
		return listGoods;
	}
	
	// 상품에 적용할 이벤트 리스트 가져오기
	@Override
	public List<EventVO> selectEventList() throws Exception {
		List<EventVO> listEvent = adminGoodsDAO.selectEventList();
		return listEvent;
	}
	
	// 상품 상세 조회하기
	@Override
	public Map<String, Object> detailGoodsInfo (int goods_id) throws Exception {
		Map<String, Object> goodsMap = new HashMap<String, Object>(); // 상품 정보 담을 맵 생성
		GoodsVO goodsVO = adminGoodsDAO.selectGoodsDetail(goods_id);
		List<GoodsOptionVO> optionList = adminGoodsDAO.selectGoodsOption(goods_id);
		List<GoodsImageFileVO> imageList = adminGoodsDAO.selectGoodsImage(goods_id);
		goodsMap.put("goodsVO", goodsVO);
		goodsMap.put("optionList", optionList);
		goodsMap.put("imageList", imageList);
		
		return goodsMap;
	}
	
	// 새상품 등록하기
	public int addNewGoods(Map<String, Object> goodsMap) throws Exception {
		int goods_id = adminGoodsDAO.insertNewGoods(goodsMap); // 상품 정보 등록
		adminGoodsDAO.insertNewGoodsOption(goodsMap, goods_id); // 상품 옵션 등록
		adminGoodsDAO.insertNewGoodsImage(goodsMap, goods_id); // 상품 이미지 등록
		return goods_id;
	}
	
	// 상품 상태 수정하기
	@Override
	public void updateGoodsState(Map<String,Object> updateGoodsMap) throws Exception {
		adminGoodsDAO.updateGoodsState(updateGoodsMap);
	}
	
	// 상품 삭제하기
	@Override
	public void deleteGoods(List<GoodsVO> deleteList) throws Exception {
		adminGoodsDAO.deleteGoods(deleteList);
	}
	
	// 상품 정보 수정하기
	@Override
	public void modifyGoodsInfo(Map<String,Object> goodsMap) throws Exception {
		adminGoodsDAO.updateGoodsInfo(goodsMap);
	}
	
	// 상품 정보 수정창에서 옵션 추가하기
	@Override
	public void addGoodsOption(GoodsOptionVO goodsOptionVO) throws Exception {
		adminGoodsDAO.addGoodsOption(goodsOptionVO);
	}
	
	// 상품 옵션 수정하기
	@Override
	public void modifyOption(GoodsOptionVO goodsOptionVO) throws Exception {
		adminGoodsDAO.updateOption(goodsOptionVO);
	}
	
	// 상품 이미지 수정하기
	@Override
	public void modifyGoodsImage(GoodsImageFileVO goodsImageFileVO) throws Exception {
		adminGoodsDAO.updateGoodsImage(goodsImageFileVO);
	}
	
	// 상품 옵션 삭제하기
	@Override
	public void deleteOption(int option_id) throws Exception {
		adminGoodsDAO.deleteOption(option_id);
	}
	
	// 상품 이벤트 적용하기
	@Override
	public void updateGoodsEvent(Map<String, Object> updateGoodsMap) throws Exception {
		adminGoodsDAO.updateGoodsEvent(updateGoodsMap);
	}
	
	// 상품 이벤트 적용 취소하기
	@Override
	public void deleteGoodsEvent(List<GoodsVO> deleteList) throws Exception {
		adminGoodsDAO.deleteGoodsEvent(deleteList);
	}
}
