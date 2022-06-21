package com.myspring.gymbaro02.admin.community.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.goods.vo.GoodsReviewVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;

public interface AdminCommunityDAO {
	public List<BoardVO> selectBoardList() throws DataAccessException;
	public List<CommentVO> selectCommentList() throws DataAccessException;
	public List<NoticeVO> selectNoticeList() throws DataAccessException;
	public List<GoodsReviewVO> selectReviewList() throws DataAccessException;
	public List<CsVO> selectCsList() throws DataAccessException;
	public void updateBoardHidden(List<BoardVO> hiddenList) throws DataAccessException;
	public void updateBoardView(int articleNo) throws DataAccessException;
	public void updateCommentHidden(List<CommentVO> hiddenList) throws DataAccessException;
	public void updateCommentView(int commentNo) throws DataAccessException;
	public void deleteNotice(List<NoticeVO> deleteList) throws DataAccessException;
	public void deleteNoticeImage(List<NoticeVO> deleteList) throws DataAccessException;
}
