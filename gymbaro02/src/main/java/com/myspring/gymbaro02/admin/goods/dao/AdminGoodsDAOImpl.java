package com.myspring.gymbaro02.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.event.vo.EventVO;
import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

@Repository("adminGoodsDAO")
public class AdminGoodsDAOImpl implements AdminGoodsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 상품 리스트 가져오기
	@Override
	public List<GoodsVO> selectGoodsList() throws DataAccessException {
		List<GoodsVO> listGoods = sqlSession.selectList("mapper.admin.goods.selectGoodsList");
		return listGoods;
	}
	
	// 상품에 적용할 이벤트 리스트 가져오기
	@Override
	public List<EventVO> selectEventList() throws DataAccessException {
		List<EventVO> listEvent = sqlSession.selectList("mapper.admin.goods.selectEventList");
		return listEvent;
	}
	
	// 새상품 등록하기
	@Override
	public int insertNewGoods(Map<String,Object> goodsMap) throws DataAccessException {
		GoodsVO goodsVO = (GoodsVO) goodsMap.get("goodsVO");
		sqlSession.insert("mapper.admin.goods.insertNewGoods", goodsVO);
		int goods_id = goodsVO.getGoods_id();
		return goods_id;
	}
	
	// 새상품 옵션 등록하기
	@Override
	public void insertNewGoodsOption(Map<String,Object> goodsMap, int goods_id) throws DataAccessException {
		List<GoodsOptionVO> goodsOptionList = (List<GoodsOptionVO>) goodsMap.get("goodsOptionList");
		for(int i=0; i<goodsOptionList.size(); i++) {
			GoodsOptionVO goodsOptionVO = goodsOptionList.get(i);
			goodsOptionVO.setGoods_id(goods_id);
			sqlSession.insert("mapper.admin.goods.insertNewGoodsOption", goodsOptionVO);
		}
	}
	
	// 새상품 이미지 등록하기
	@Override
	public void insertNewGoodsImage(Map<String,Object> goodsMap, int goods_id) throws DataAccessException {
		List<GoodsImageFileVO> imageFileList = (List<GoodsImageFileVO>) goodsMap.get("goodsImageList");
		for(int i=0; i<imageFileList.size(); i++) {
			GoodsImageFileVO goodsImageFileVO = imageFileList.get(i);
			goodsImageFileVO.setGoods_id(goods_id);
			sqlSession.insert("mapper.admin.goods.insertNewGoodsImage", goodsImageFileVO);
		}
	}
	
	// 상품 상태 수정하기
	@Override
	public void updateGoodsState(Map<String,Object> updateGoodsMap) throws DataAccessException {
		sqlSession.update("mapper.admin.goods.updateGoodsState", updateGoodsMap);
	}
	
	// 상품 삭제하기
	@Override
	public void deleteGoods(List<GoodsVO> deleteList) throws DataAccessException {
		for(int i=0; i<deleteList.size(); i++) {
			GoodsVO goodsVO = deleteList.get(i);
			int goods_id = goodsVO.getGoods_id();
			sqlSession.delete("mapper.admin.goods.deleteGoods", goods_id);
		}
	}
	
	// 상품 상세 조회하기
	@Override
	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException {
		GoodsVO goodsVO = sqlSession.selectOne("mapper.admin.goods.selectGoodsDetail", goods_id);
		return goodsVO;
	}
	
	// 상품 상세 옵션 조회하기
	@Override
	public List<GoodsOptionVO> selectGoodsOption(int goods_id) throws DataAccessException {
		List<GoodsOptionVO> optionList = sqlSession.selectList("mapper.admin.goods.selectGoodsOption", goods_id);
		return optionList;
	}
	
	// 상품 상세이미지 조회하기
	@Override
	public List<GoodsImageFileVO> selectGoodsImage(int goods_id) throws DataAccessException {
		List<GoodsImageFileVO> imageList = sqlSession.selectList("mapper.admin.goods.selectGoodsDetailImage", goods_id);
		return imageList;
	}
	
	// 상품 정보 수정하기
	@Override
	public void updateGoodsInfo(Map<String, Object> goodsMap) throws DataAccessException {
		sqlSession.update("mapper.admin.goods.updateGoodsInfo", goodsMap);
	}
	
	// 상품 수정창 -> 옵션 추가하기
	@Override
	public void addGoodsOption(GoodsOptionVO goodsOptionVO) throws DataAccessException {
		sqlSession.insert("mapper.admin.goods.insertNewGoodsOption", goodsOptionVO);
	}
	
	// 상품 옵션 수정하기
	@Override
	public void updateOption(GoodsOptionVO goodsOptionVO) throws DataAccessException {
		sqlSession.update("mapper.admin.goods.updateOption", goodsOptionVO);
	}
	
	// 상품 이미지 수정하기
	@Override
	public void updateGoodsImage(GoodsImageFileVO goodsImageFileVO) throws DataAccessException {
		sqlSession.update("mapper.admin.goods.updateGoodsImage", goodsImageFileVO);
	}
	
	// 상품 옵션 삭제하기
	@Override
	public void deleteOption(int option_id) throws DataAccessException {
		sqlSession.delete("mapper.admin.goods.deleteOption", option_id);
	}
	
	// 상품 이벤트 적용하기 (event_id 컬럼 변경)
	@Override
	public void updateGoodsEvent(Map<String, Object> updateGoodsMap) throws DataAccessException {
		sqlSession.update("mapper.admin.goods.updateGoodsEvent", updateGoodsMap);
		List<GoodsVO> goodsList = (List<GoodsVO>) updateGoodsMap.get("goodsList"); // 상품 테이블에서 이벤트 아이디 값 수정해주기
		for(int i=0; i<goodsList.size(); i++) { // 이벤트 값의 할인율에 따라 상품의 할인가격이 설정되는 프로시저 호출
			GoodsVO goodsVO = goodsList.get(i);
			int goods_id = goodsVO.getGoods_id();
			sqlSession.update("mapper.admin.goods.updateGoodsDiscount", goods_id);
		}
	}
	
	// 상품 이벤트 적용 취소하기 (event_id, goods_discount 값 삭제)
	@Override
	public void deleteGoodsEvent(List<GoodsVO> deleteList) throws DataAccessException {
		 sqlSession.update("mapper.admin.goods.deleteGoodsEvent", deleteList);
	}
}
