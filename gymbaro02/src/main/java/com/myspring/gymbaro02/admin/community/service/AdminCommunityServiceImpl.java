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
	
	// 게시글 조회
	@Override
	public List<BoardVO> selectBoardList() throws Exception {
		List<BoardVO> boardList = adminCommunityDAO.selectBoardList();
		return boardList;
	}
	
	// 댓글 조회
	@Override
	public List<CommentVO> selectCommentList() throws Exception{
		List<CommentVO> commentList = adminCommunityDAO.selectCommentList();
		return commentList;
	}
	
	// 공지글 조회
	@Override
	public List<NoticeVO> selectNoticeList() throws Exception{
		List<NoticeVO> noticeList = adminCommunityDAO.selectNoticeList();
		return noticeList;
	}
	
	// 리뷰 조회
	@Override
	public List<GoodsReviewVO> selectReviewList() throws Exception {
		List<GoodsReviewVO> reviewList = adminCommunityDAO.selectReviewList();
		return reviewList;
	}
	
	// 문의글 조회
	@Override
	public List<CsVO> selectCsList() throws Exception {
		List<CsVO> csList = adminCommunityDAO.selectCsList();
		return csList;
	}
	
	// 게시글 숨김 처리하기
	@Override
	public void updateBoardHidden(List<BoardVO> hiddenList) throws Exception {
		adminCommunityDAO.updateBoardHidden(hiddenList);
	}
	
	// 게시글 숨김 해제하기
	@Override
	public void updateBoardView(int articleNo) throws Exception{
		adminCommunityDAO.updateBoardView(articleNo);
	}
	
	// 댓글 숨김 처리하기
	@Override
	public void updateCommentHidden(List<CommentVO> hiddenList) throws Exception {
		adminCommunityDAO.updateCommentHidden(hiddenList);
	}
	
	// 댓글 숨김 해제하기
	@Override
	public void updateCommentView(int commentNo) throws Exception {
		adminCommunityDAO.updateCommentView(commentNo);
	}
	
	// 공지글 삭제하기
	@Override
	public void deleteNotice(List<NoticeVO> deleteList) throws Exception {
		adminCommunityDAO.deleteNoticeImage(deleteList);
		adminCommunityDAO.deleteNotice(deleteList);
	}
	
}
