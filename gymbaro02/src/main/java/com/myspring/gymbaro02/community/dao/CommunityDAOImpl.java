package com.myspring.gymbaro02.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;

@Repository("communityDAO")
public class CommunityDAOImpl implements CommunityDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void newArticle(Map newArticleMap) throws DataAccessException {
		sqlSession.insert("mapper.board.newArticle", newArticleMap);
	} 
	
	@Override
	public List<BoardVO> viewAll() throws DataAccessException {
		return sqlSession.selectList("mapper.board.viewAll"); 	
	}
	
	@Override
	public BoardVO readArticle(Map readArticleMap) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.readArticle", readArticleMap);
		
	}
	
	@Override
	public void increaseViewCnt(Map readArticleMap) throws DataAccessException {
		sqlSession.update("mapper.board.increaseViewCnt", readArticleMap);
	}
	
	@Override
	public void updateCommentCnt(Map readArticleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateCommentCnt", readArticleMap);
	}
	
	@Override
	public void deleteArticle(String articleNo) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteArticle", articleNo);
		
	}
	
	@Override
	public BoardVO modifyArticle(Map modArticleMap) throws DataAccessException {
		 sqlSession.update("mapper.board.modifyArticle", modArticleMap);
		 return sqlSession.selectOne("mapper.board.readArticle", modArticleMap);
	}
	
	@Override
	public void newComment(CommentVO commentVO) throws DataAccessException {
		sqlSession.insert("mapper.board.newComment", commentVO);
		
	}
	
	@Override
	public List<CommentVO> viewComment(String articleNo) throws DataAccessException {
		return sqlSession.selectList("mapper.board.viewComment", articleNo);
	}

	
	@Override
	public CommentVO modifyComment(CommentVO commentVO) throws DataAccessException {
		sqlSession.update("mapper.board.modifyArticle", commentVO);
		return sqlSession.selectOne("mapper.board.viewComment");
	}
	
	@Override
	public void deleteComment(String commentNo) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteComment", commentNo);
		
	}
	
	@Override
	public String getPrevArticle(String articleNo) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.getPrevArticle", articleNo);
	}
	
	@Override
	public String getNextArticle(String articleNo) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.getNextArticle", articleNo);
	}
}
