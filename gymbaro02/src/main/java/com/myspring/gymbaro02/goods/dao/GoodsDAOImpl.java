package com.myspring.gymbaro02.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GoodsVO> selectGoodsList(String goodsStatus) throws DataAccessException {
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		if(goodsStatus.equals("all")) {
			goodsList = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsListALL");
		}else {
			goodsList = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsList", goodsStatus);
		}
		return goodsList;
	}
	
	@Override
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException{
		GoodsVO goodsVO=(GoodsVO)sqlSession.selectOne("mapper.goods.selectGoodsDetail",goods_id);
		return goodsVO;
	}
	
	@Override
	public List<GoodsOptionVO> selectGoodsOption(String goods_id) throws DataAccessException {
		List<GoodsOptionVO> optionList = sqlSession.selectList("mapper.goods.selectGoodsOption", goods_id);
		return optionList;
	}
	
	// 상세 이미지 조회
	@Override
	public List<GoodsImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException{
		List<GoodsImageFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsDetailImage",goods_id);
		return imageList;
	}

}
