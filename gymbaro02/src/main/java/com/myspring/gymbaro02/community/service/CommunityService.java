package com.myspring.gymbaro02.community.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;

public interface CommunityService {
	public void newArticle(Map newArticleMap) throws Exception;
	public List<BoardVO> viewAll() throws Exception;
	public BoardVO readArticle(Map readArticleMap) throws Exception;
	public void increaseViewCnt(Map readArticleMap) throws Exception;
	public void updateCommentCnt(Map readArticleMap) throws Exception;
	public void deleteArticle(String articleNo) throws Exception; 
	public BoardVO modifyArticle(Map modArticleMap) throws Exception;
	public void newComment(CommentVO commentVO) throws Exception;
	public List<CommentVO> viewComment(String articleNO) throws Exception;
	public CommentVO modifyComment(CommentVO commentVO) throws Exception; 
	public void deleteComment(String commentNo) throws Exception;
	public String getPrevArticle(String articleNo) throws Exception; 
	public String getNextArticle(String articleNo) throws Exception; 
}
