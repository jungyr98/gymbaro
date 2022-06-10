package com.myspring.gymbaro02.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.event.vo.EventVO;
import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

public interface AdminGoodsDAO {
	public List<GoodsVO> selectGoodsList() throws DataAccessException;
	public List<EventVO> selectEventList() throws DataAccessException;
	public int insertNewGoods(Map<String,Object> goodsMap) throws DataAccessException;
	public void insertNewGoodsOption(Map<String,Object> goodsMap, int goods_id) throws DataAccessException;
	public void insertNewGoodsImage(Map<String,Object> goodsMap, int goods_id) throws DataAccessException;
	public void updateGoodsState(Map<String,Object> updateGoodsMap) throws DataAccessException;
	public void deleteGoods(List<GoodsVO> deleteList) throws DataAccessException;
	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException;
	public List<GoodsOptionVO> selectGoodsOption(int goods_id) throws DataAccessException;
	public List<GoodsImageFileVO> selectGoodsImage(int goods_id) throws DataAccessException;
	public void updateGoodsInfo(Map<String, Object> goodsMap) throws DataAccessException;
	public void addGoodsOption(GoodsOptionVO goodsOptionVO) throws DataAccessException;
	public void updateOption(GoodsOptionVO goodsOptionVO) throws DataAccessException;
	public void updateGoodsImage(GoodsImageFileVO goodsImageFileVO) throws DataAccessException;
	public void deleteOption(int option_id) throws DataAccessException;
	public void updateGoodsEvent(Map<String, Object> updateGoodsMap) throws DataAccessException;
	public void deleteGoodsEvent(List<GoodsVO> deleteList) throws DataAccessException;
}
