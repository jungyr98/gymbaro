package com.myspring.gymbaro02.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.cs.vo.CsCommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsReviewVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

public interface GoodsDAO {
	
	public List<GoodsVO> selectGoodsList(String goodsStatus, Map<String,Object> condMap) throws DataAccessException;
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException;
	public List<GoodsOptionVO> selectGoodsOption(String goods_id) throws DataAccessException;
	public List<GoodsImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException;
	public List<GoodsVO> selectRankingList() throws DataAccessException;
	public void addNewReview(GoodsReviewVO goosReviewVO) throws DataAccessException;
	public List<GoodsReviewVO> viewAll(String goods_id) throws DataAccessException;
	public double getScoreAvg(String goods_id) throws DataAccessException; 
	public int getReviewCount(String goods_id) throws DataAccessException;
	public int countScore1(String goods_id) throws DataAccessException;
	public int countScore2(String goods_id) throws DataAccessException;
	public int countScore3(String goods_id) throws DataAccessException;
	public int countScore4(String goods_id) throws DataAccessException;
	public int countScore5(String goods_id) throws DataAccessException;
	public void updateReviewState(Map<String, Object> updateReviewStateMap) throws DataAccessException;
	public String getReviewInfo(Map<String, Object> reviewInfoMap) throws DataAccessException;
	public List<CsVO> selectGoodsCS(String goods_id) throws DataAccessException;
	public List<CsCommentVO> GoodsCsComment() throws DataAccessException;
}
