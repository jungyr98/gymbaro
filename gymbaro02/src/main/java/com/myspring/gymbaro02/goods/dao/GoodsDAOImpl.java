package com.myspring.gymbaro02.goods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.cs.vo.CsCommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsReviewVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 상품 목록 카테고리별로 조회
	@Override
	public List<GoodsVO> selectGoodsList(String goodsStatus, Map<String,Object> condMap) throws DataAccessException {
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		if(goodsStatus.equals("all")) {
			goodsList = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsListALL", condMap);
		}else {
			goodsList = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsList", goodsStatus);
		}
		return goodsList;
	}
	
	// 상품 상세 조회
	@Override
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException{
		GoodsVO goodsVO=(GoodsVO)sqlSession.selectOne("mapper.goods.selectGoodsDetail",goods_id);
		return goodsVO;
	}
	
	// 상품 상세 옵션 조회
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
	
	// 가장 많이 팔린 상품 4개 조회
	@Override
	public List<GoodsVO> selectRankingList() throws DataAccessException {
		List<GoodsVO> rankingList = sqlSession.selectList("mapper.goods.selectRankingList");
		return rankingList;
	}
	
	
	@Override
	public void addNewReview(GoodsReviewVO goodsReviewVO) throws DataAccessException {
		sqlSession.insert("mapper.goods.addNewReview", goodsReviewVO);
	}
	
	@Override
	public List<GoodsReviewVO> viewAll(String goods_id) throws DataAccessException {
		return sqlSession.selectList("mapper.goods.viewAll", goods_id);
	}
	
	@Override
	public double getScoreAvg(String goods_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.goods.getScoreAvg", goods_id);
	}
	
	@Override
	public int getReviewCount(String goods_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.goods.getReviewCount", goods_id);
	}
	
	
	@Override
	public int countScore1(String goods_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.goods.countScore1", goods_id);
	}
	
	@Override
	public int countScore2(String goods_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.goods.countScore2", goods_id);
	}
	
	@Override
	public int countScore3(String goods_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.goods.countScore3", goods_id);
	}
	
	@Override
	public int countScore4(String goods_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.goods.countScore4", goods_id);
	}
	
	@Override
	public int countScore5(String goods_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.goods.countScore5", goods_id);
	}
	
	@Override
	public void updateReviewState(Map updateReviewStateMap) throws DataAccessException {
		sqlSession.update("mapper.goods.updateReviewState", updateReviewStateMap);
	}
	
	@Override
	public String getReviewInfo(Map reviewInfoMap) throws DataAccessException {
		return sqlSession.selectOne("mapper.goods.getReviewInfo", reviewInfoMap);
	}
	
	//문의글 목록 조회 
	@Override
	public List<CsVO> selectGoodsCS(String goods_id) throws DataAccessException{
		List<CsVO> goodsCsList = sqlSession.selectList("mapper.goods.selectGoodsCS",goods_id);
		return goodsCsList;
	}
	
	//상품문의 답변 
	@Override
	public List<CsCommentVO> GoodsCsComment() throws DataAccessException{
		List<CsCommentVO> commentList = sqlSession.selectList("mapper.goods.goodsCsComment");
		return commentList;
				
	}

}
