package com.myspring.gymbaro02.admin.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.goods.vo.GoodsReviewVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;

@Repository("adminCommunityDAO")
public class AdminCommunityDAOImpl implements AdminCommunityDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// °Ô½Ã±Û ÀüÃ¼ Á¶È¸
	@Override
	public List<BoardVO> selectBoardList() throws DataAccessException{
		List<BoardVO> boardList = sqlSession.selectList("mapper.admin.article.selectBoardList");
		return boardList;
	}
	
	// ´ñ±Û ÀüÃ¼ Á¶È¸
	@Override
	public List<CommentVO> selectCommentList() throws DataAccessException{
		List<CommentVO> commentList = sqlSession.selectList("mapper.admin.article.selectCommentList");
		return commentList;
	}
	
	// °øÁö±Û Á¶È¸
	@Override
	public List<NoticeVO> selectNoticeList() throws DataAccessException{
		List<NoticeVO> noticeList = sqlSession.selectList("mapper.admin.article.selectNoticeList");
		return noticeList;
	}
	
	// ¸®ºä Á¶È¸
	@Override
	public List<GoodsReviewVO> selectReviewList() throws DataAccessException {
		List<GoodsReviewVO> reviewList = sqlSession.selectList("mapper.admin.article.selectReviewList");
		return reviewList;
	}
	
	// ¹®ÀÇ±Û Á¶È¸
	@Override
	public List<CsVO> selectCsList() throws DataAccessException {
		List<CsVO> csList = sqlSession.selectList("mapper.admin.article.selectCsList");
		return csList;
	}
	
	// °Ô½Ã±Û ¼û±è Ã³¸®ÇÏ±â
	@Override
	public void updateBoardHidden(List<BoardVO> hiddenList) throws DataAccessException {
		sqlSession.update("mapper.admin.article.updateBoardHidden", hiddenList);
	}
	
	// °Ô½Ã±Û ¼û±è ÇØÁ¦ÇÏ±â
	@Override
	public void updateBoardView(int articleNo) throws DataAccessException {
		sqlSession.update("mapper.admin.article.updateBoardView", articleNo);
	}
	
	// ´ñ±Û ¼û±è Ã³¸®ÇÏ±â
	@Override
	public void updateCommentHidden(List<CommentVO> hiddenList) throws DataAccessException {
		sqlSession.update("mapper.admin.article.updateCommentHidden", hiddenList);
	}
	
	// ´ñ±Û ¼û±è ÇØÁ¦ÇÏ±â
	@Override
	public void updateCommentView(int commentNo) throws DataAccessException {
		sqlSession.update("mapper.admin.article.updateCommentView", commentNo);
	}
	
	// °øÁö±Û »èÁ¦ÇÏ±â
	@Override
	public void deleteNotice(List<NoticeVO> deleteList) throws DataAccessException {
		sqlSession.delete("mapper.admin.article.deleteNotice", deleteList);
	}
	
	// °øÁö±Û ÀÌ¹ÌÁö »èÁ¦ÇÏ±â
	@Override
	public void deleteNoticeImage(List<NoticeVO> deleteList) throws DataAccessException {
		sqlSession.delete("mapper.admin.article.deleteNoticeImage", deleteList);
	}
	
}
