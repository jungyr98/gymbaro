package com.myspring.gymbaro02.community.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;

public interface CommunityDAO {
	public void newArticle(Map<String, Object> newArticleMap) throws DataAccessException;
	public List<BoardVO> viewAll() throws DataAccessException;
	public BoardVO readArticle(Map readArticleMap) throws DataAccessException;
	public void increaseViewCnt(Map readArticleMap) throws DataAccessException;
	public void updateCommentCnt(Map readArticleMap) throws DataAccessException;
	public void deleteArticle(String articleNo) throws DataAccessException;
	public BoardVO modifyArticle(Map modArticleMap) throws DataAccessException;
	public void newComment(CommentVO commentVO) throws DataAccessException;
	public List<CommentVO> viewComment(String articleNo) throws DataAccessException; 
	public CommentVO modifyComment(CommentVO commentVO) throws DataAccessException;
	public void deleteComment(String commentNo) throws DataAccessException;
	public String getPrevArticle(String articleNo) throws DataAccessException;
	public String getNextArticle(String articleNo) throws DataAccessException;
}
