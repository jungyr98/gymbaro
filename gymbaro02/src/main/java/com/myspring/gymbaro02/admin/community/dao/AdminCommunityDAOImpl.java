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
	
	// 게시글 전체 조회
	@Override
	public List<BoardVO> selectBoardList() throws DataAccessException{
		List<BoardVO> boardList = sqlSession.selectList("mapper.admin.article.selectBoardList");
		return boardList;
	}
	
	// 댓글 전체 조회
	@Override
	public List<CommentVO> selectCommentList() throws DataAccessException{
		List<CommentVO> commentList = sqlSession.selectList("mapper.admin.article.selectCommentList");
		return commentList;
	}
	
	// 공지글 조회
	@Override
	public List<NoticeVO> selectNoticeList() throws DataAccessException{
		List<NoticeVO> noticeList = sqlSession.selectList("mapper.admin.article.selectNoticeList");
		return noticeList;
	}
	
	// 리뷰 조회
	@Override
	public List<GoodsReviewVO> selectReviewList() throws DataAccessException {
		List<GoodsReviewVO> reviewList = sqlSession.selectList("mapper.admin.article.selectReviewList");
		return reviewList;
	}
	
	// 문의글 조회
	@Override
	public List<CsVO> selectCsList() throws DataAccessException {
		List<CsVO> csList = sqlSession.selectList("mapper.admin.article.selectCsList");
		return csList;
	}
	
	// 게시글 숨김 처리하기
	@Override
	public void updateBoardHidden(List<BoardVO> hiddenList) throws DataAccessException {
		sqlSession.update("mapper.admin.article.updateBoardHidden", hiddenList);
	}
	
	// 게시글 숨김 해제하기
	@Override
	public void updateBoardView(int articleNo) throws DataAccessException {
		sqlSession.update("mapper.admin.article.updateBoardView", articleNo);
	}
	
	// 댓글 숨김 처리하기
	@Override
	public void updateCommentHidden(List<CommentVO> hiddenList) throws DataAccessException {
		sqlSession.update("mapper.admin.article.updateCommentHidden", hiddenList);
	}
	
	// 댓글 숨김 해제하기
	@Override
	public void updateCommentView(int commentNo) throws DataAccessException {
		sqlSession.update("mapper.admin.article.updateCommentView", commentNo);
	}
	
	// 공지글 삭제하기
	@Override
	public void deleteNotice(List<NoticeVO> deleteList) throws DataAccessException {
		sqlSession.delete("mapper.admin.article.deleteNotice", deleteList);
	}
	
	// 공지글 이미지 삭제하기
	@Override
	public void deleteNoticeImage(List<NoticeVO> deleteList) throws DataAccessException {
		sqlSession.delete("mapper.admin.article.deleteNoticeImage", deleteList);
	}
	
}
