package com.myspring.gymbaro02.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.cs.vo.CsCommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.goods.dao.GoodsDAO;
import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsReviewVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

@Service("goodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	//상품 리스트
	@Override
	public Map<String,List<GoodsVO>> listGoods(Map<String,Object> condMap) throws Exception {
		Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
		List<GoodsVO> goodsList = goodsDAO.selectGoodsList("all", condMap);
		goodsMap.put("all", goodsList);
		// 헬스 용품 리스트
		goodsList = goodsDAO.selectGoodsList("헬스", condMap);
		goodsMap.put("health", goodsList);
		// 필라테스 용품 리스트
		goodsList=goodsDAO.selectGoodsList("필라테스", condMap);
		goodsMap.put("yoga",goodsList);
		// 복싱 용품 리스트
		goodsList=goodsDAO.selectGoodsList("복싱", condMap);
		goodsMap.put("boxing",goodsList);
		// 수영 용품 리스트
		goodsList=goodsDAO.selectGoodsList("수영", condMap);
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
		List<CsVO> goodsCsList = goodsDAO.selectGoodsCS(_goods_id); //문의글
		goodsMap.put("goodsCsList", goodsCsList);
		List<CsCommentVO> commentList = goodsDAO.GoodsCsComment(); //답변 
		goodsMap.put("commentList", commentList);
		return goodsMap;
	}
	
	@Override
	public void addNewReview(GoodsReviewVO goodsReviewVO) throws Exception {
		goodsDAO.addNewReview(goodsReviewVO);
	}
	
	@Override
	public List<GoodsReviewVO> viewAll(String goods_id) throws Exception {
		return goodsDAO.viewAll(goods_id);
	}
	
	@Override
	public double getScoreAvg(String goods_id) throws Exception {
		return goodsDAO.getScoreAvg(goods_id);
	}
	
	@Override
	public int getReviewCount(String goods_id) throws Exception {
		return goodsDAO.getReviewCount(goods_id);
	}
	
	@Override
	public int countScore1(String goods_id) throws Exception {
		return goodsDAO.countScore1(goods_id);
	}
	@Override
	public int countScore2(String goods_id) throws Exception {
		return goodsDAO.countScore2(goods_id);
	}
	@Override
	public int countScore3(String goods_id) throws Exception {
		return goodsDAO.countScore3(goods_id);
	}
	@Override
	public int countScore4(String goods_id) throws Exception {
		return goodsDAO.countScore4(goods_id);
	}
	@Override
	public int countScore5(String goods_id) throws Exception {
		return goodsDAO.countScore5(goods_id);
	}
	
	@Override
	public void updateReviewState(Map updateReviewStateMap) throws Exception {
		goodsDAO.updateReviewState(updateReviewStateMap);
	}
	
	@Override
	public String getReviewInfo(Map reviewInfoMap) throws Exception {
		return goodsDAO.getReviewInfo(reviewInfoMap);
	}

}
