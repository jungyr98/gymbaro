package com.myspring.gymbaro02.admin.goods.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.event.vo.EventVO;
import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

public interface AdminGoodsService {
	public List<GoodsVO> selectGoodsList() throws Exception;
	public List<EventVO> selectEventList() throws Exception;
	public int addNewGoods(Map<String, Object> goodsMap) throws Exception;
	public void updateGoodsState(Map<String,Object> updateGoodsMap) throws Exception;
	public void deleteGoods(List<GoodsVO> deleteList) throws Exception;
	public Map<String, Object> detailGoodsInfo (int goods_id) throws Exception;
	public void modifyGoodsInfo(Map<String,Object> goodsMap) throws Exception;
	public void addGoodsOption(GoodsOptionVO goodsOptionVO) throws Exception;
	public void modifyOption(GoodsOptionVO goodsOptionVO) throws Exception;
	public void modifyGoodsImage(GoodsImageFileVO goodsImageFileVO) throws Exception;
	public void deleteOption(int option_id) throws Exception;
	public void updateGoodsEvent(Map<String, Object> updateGoodsMap) throws Exception;
	public void deleteGoodsEvent(List<GoodsVO> deleteList) throws Exception;
}
