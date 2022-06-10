package com.myspring.gymbaro02.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.goods.dao.GoodsDAO;
import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

@Service("goodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	//상품 리스트
	@Override
	public Map<String,List<GoodsVO>> listGoods() throws Exception {
		Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
		List<GoodsVO> goodsList = goodsDAO.selectGoodsList("all");
		goodsMap.put("all", goodsList);
		// 헬스 용품 리스트
		goodsList = goodsDAO.selectGoodsList("헬스");
		goodsMap.put("health", goodsList);
		// 필라테스 용품 리스트
		goodsList=goodsDAO.selectGoodsList("필라테스");
		goodsMap.put("yoga",goodsList);
		// 복싱 용품 리스트
		goodsList=goodsDAO.selectGoodsList("복싱");
		goodsMap.put("boxing",goodsList);
		// 수영 용품 리스트
		goodsList=goodsDAO.selectGoodsList("수영");
		goodsMap.put("swim",goodsList);
		// 랭킹 상품 리스트
		goodsList=goodsDAO.selectRankingList();
		goodsMap.put("ranking", goodsList);
		return goodsMap;
	}
	
	//상품 상세
	@Override
	public Map goodsDetail(String _goods_id) throws Exception {
		Map goodsMap=new HashMap();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(_goods_id); // 상품 상세정보 가져오기
		goodsMap.put("goodsVO", goodsVO);
		List<GoodsOptionVO> optionList = goodsDAO.selectGoodsOption(_goods_id); // 상품 해당 옵션 가져오기
		goodsMap.put("optionList", optionList);
		List<GoodsImageFileVO> imageList =goodsDAO.selectGoodsDetailImage(_goods_id); // 상품 상세이미지 가져오기
		goodsMap.put("imageList", imageList);
		return goodsMap;
	}

}
