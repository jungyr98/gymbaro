package com.myspring.gymbaro02.admin.community.service;

import java.util.List;


import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.goods.vo.GoodsReviewVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;

public interface AdminCommunityService {
	public List<BoardVO> selectBoardList() throws Exception;
	public List<CommentVO> selectCommentList() throws Exception;
	public List<NoticeVO> selectNoticeList() throws Exception;
	public List<GoodsReviewVO> selectReviewList() throws Exception;
	public List<CsVO> selectCsList() throws Exception;
	public void updateBoardHidden(List<BoardVO> hiddenList) throws Exception;
	public void updateBoardView(int articleNo) throws Exception;
	public void updateCommentHidden(List<CommentVO> hiddenList) throws Exception;
	public void updateCommentView(int commentNo) throws Exception;
	public void deleteNotice(List<NoticeVO> deleteList) throws Exception;
	
}
