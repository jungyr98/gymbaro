package com.myspring.gymbaro02.admin.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.admin.community.dao.AdminCommunityDAO;
import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.goods.vo.GoodsReviewVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;

@Service("adminCommunityService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminCommunityServiceImpl implements AdminCommunityService {
	@Autowired
	private AdminCommunityDAO adminCommunityDAO;
	
	// °Ô½Ã±Û Á¶È¸
	@Override
	public List<BoardVO> selectBoardList() throws Exception {
		List<BoardVO> boardList = adminCommunityDAO.selectBoardList();
		return boardList;
	}
	
	// ´ñ±Û Á¶È¸
	@Override
	public List<CommentVO> selectCommentList() throws Exception{
		List<CommentVO> commentList = adminCommunityDAO.selectCommentList();
		return commentList;
	}
	
	// °øÁö±Û Á¶È¸
	@Override
	public List<NoticeVO> selectNoticeList() throws Exception{
		List<NoticeVO> noticeList = adminCommunityDAO.selectNoticeList();
		return noticeList;
	}
	
	// ¸®ºä Á¶È¸
	@Override
	public List<GoodsReviewVO> selectReviewList() throws Exception {
		List<GoodsReviewVO> reviewList = adminCommunityDAO.selectReviewList();
		return reviewList;
	}
	
	// ¹®ÀÇ±Û Á¶È¸
	@Override
	public List<CsVO> selectCsList() throws Exception {
		List<CsVO> csList = adminCommunityDAO.selectCsList();
		return csList;
	}
	
	// °Ô½Ã±Û ¼û±è Ã³¸®ÇÏ±â
	@Override
	public void updateBoardHidden(List<BoardVO> hiddenList) throws Exception {
		adminCommunityDAO.updateBoardHidden(hiddenList);
	}
	
	// °Ô½Ã±Û ¼û±è ÇØÁ¦ÇÏ±â
	@Override
	public void updateBoardView(int articleNo) throws Exception{
		adminCommunityDAO.updateBoardView(articleNo);
	}
	
	// ´ñ±Û ¼û±è Ã³¸®ÇÏ±â
	@Override
	public void updateCommentHidden(List<CommentVO> hiddenList) throws Exception {
		adminCommunityDAO.updateCommentHidden(hiddenList);
	}
	
	// ´ñ±Û ¼û±è ÇØÁ¦ÇÏ±â
	@Override
	public void updateCommentView(int commentNo) throws Exception {
		adminCommunityDAO.updateCommentView(commentNo);
	}
	
	// °øÁö±Û »èÁ¦ÇÏ±â
	@Override
	public void deleteNotice(List<NoticeVO> deleteList) throws Exception {
		adminCommunityDAO.deleteNoticeImage(deleteList);
		adminCommunityDAO.deleteNotice(deleteList);
	}
	
}
