package com.myspring.gymbaro02.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

public interface GoodsDAO {
	
	public List<GoodsVO> selectGoodsList(String goodsStatus ) throws DataAccessException;
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException;
	public List<GoodsOptionVO> selectGoodsOption(String goods_id) throws DataAccessException;
	public List<GoodsImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException;
	public List<GoodsVO> selectRankingList() throws DataAccessException;
}
