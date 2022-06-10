package com.myspring.gymbaro02.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.gymbaro02.community.dao.CommunityDAO;
import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDAO boardDAO;
	
	@Override
	public void newArticle(Map newArticleMap) throws Exception {
		boardDAO.newArticle(newArticleMap);
	} 
	
	@Override
	public List<BoardVO> viewAll() throws Exception {
		return boardDAO.viewAll();
	}
	
	@Override
	public BoardVO readArticle(Map readArticleMap) throws Exception {
		return boardDAO.readArticle(readArticleMap);
	} 
	
	@Override
	public void increaseViewCnt(Map readArticleMap) throws Exception {
		boardDAO.increaseViewCnt(readArticleMap);
	}
	
	@Override
	public void updateCommentCnt(Map readArticleMap) throws Exception {
		boardDAO.updateCommentCnt(readArticleMap);
	}
	
	@Override
	public void deleteArticle(String articleNo) throws Exception {
		boardDAO.deleteArticle(articleNo);
	}
	
	@Override
	public BoardVO modifyArticle(Map modArticleMap) throws Exception {
		boardDAO.modifyArticle(modArticleMap);
		return boardDAO.readArticle(modArticleMap);
	}
	
	@Override
	public void newComment(CommentVO commentVO) throws Exception {
		boardDAO.newComment(commentVO);		
	}
	
	@Override
	public List<CommentVO> viewComment(String articleNo) throws Exception {
		return boardDAO.viewComment(articleNo);
	}
	
	
	@Override
	public CommentVO modifyComment(CommentVO commentVO) throws Exception {
		boardDAO.modifyComment(commentVO);
		String articleNo = "";
		return (CommentVO) boardDAO.viewComment(articleNo);
	}
	
	@Override
	public void deleteComment(String commentNo) throws Exception {
		boardDAO.deleteComment(commentNo);
	}
	
	@Override
	public String getPrevArticle(String articleNo) throws Exception {
		return boardDAO.getPrevArticle(articleNo);
	}
	
	@Override
	public String getNextArticle(String articleNo) throws Exception {
		return boardDAO.getNextArticle(articleNo);
	}

}
