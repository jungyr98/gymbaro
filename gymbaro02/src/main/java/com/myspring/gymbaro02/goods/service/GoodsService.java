package com.myspring.gymbaro02.goods.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.goods.vo.GoodsReviewVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

public interface GoodsService {

	public Map<String,List<GoodsVO>> listGoods(Map<String,Object> condMap) throws Exception;
	public Map goodsDetail(String _goods_id) throws Exception;
	public void addNewReview(GoodsReviewVO goodsReviewVO) throws Exception;
	public List<GoodsReviewVO> viewAll(String goods_id) throws Exception;
	public double getScoreAvg(String goods_id) throws Exception;
	public int getReviewCount(String goods_id) throws Exception;
	public int countScore1(String goods_id) throws Exception;
	public int countScore2(String goods_id) throws Exception;
	public int countScore3(String goods_id) throws Exception;
	public int countScore4(String goods_id) throws Exception;
	public int countScore5(String goods_id) throws Exception;
	public void updateReviewState(Map updateReviewStateMap) throws Exception;
	public String getReviewInfo(Map reviewInfoMap) throws Exception; 
	
}
