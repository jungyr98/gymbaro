package com.myspring.gymbaro02.community.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;

public interface CommunityDAO {
	public int selectBoardListCnt(Map<String, Object> condMap) throws DataAccessException;
	public void newArticle(Map<String, Object> newArticleMap) throws DataAccessException;
	public List<BoardVO> viewAll(Map<String, Object> condMap) throws DataAccessException;
	public List<NoticeVO> selectNoticeList() throws DataAccessException;
	public BoardVO readArticle(Map readArticleMap) throws DataAccessException;
	public void increaseViewCnt(Map readArticleMap) throws DataAccessException;
	public void updateCommentCnt(Map readArticleMap) throws DataAccessException;
	public void deleteArticle(String articleNo) throws DataAccessException;
	public BoardVO modifyArticle(Map modArticleMap) throws DataAccessException;
	public void newComment(CommentVO commentVO) throws DataAccessException;
	public List<CommentVO> viewComment(String articleNo) throws DataAccessException;
	public List<CommentVO> replyComment(String articleNo) throws DataAccessException;
	public void modifyComment(CommentVO commentVO) throws DataAccessException;
	public void deleteComment(String commentNo) throws DataAccessException;
	public String getPrevArticle(String articleNo) throws DataAccessException;
	public String getNextArticle(String articleNo) throws DataAccessException;
}
