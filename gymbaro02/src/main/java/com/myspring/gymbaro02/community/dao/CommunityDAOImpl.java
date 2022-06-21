package com.myspring.gymbaro02.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;

@Repository("communityDAO")
public class CommunityDAOImpl implements CommunityDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 글 개수
	@Override
	public int selectBoardListCnt(Map<String, Object> condMap) throws DataAccessException {
		int listCnt = sqlSession.selectOne("mapper.board.selectBoardListCnt", condMap);
		return listCnt;
	}
	
	@Override
	public void newArticle(Map newArticleMap) throws DataAccessException {
		sqlSession.insert("mapper.board.newArticle", newArticleMap);
	} 
	
	@Override
	public List<BoardVO> viewAll(Map<String, Object> condMap) throws DataAccessException {
		return sqlSession.selectList("mapper.board.viewAll", condMap); 	
	}
	
	// 중요 공지글 조회하기
	@Override
	public List<NoticeVO> selectNoticeList() throws DataAccessException {
		List<NoticeVO> noticeList = sqlSession.selectList("mapper.board.selectNoticeList");
		return noticeList;
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
	public List<CommentVO> replyComment(String articleNo) throws DataAccessException {
		return sqlSession.selectList("mapper.board.replyComment", articleNo);
	}
	
	@Override
	public void modifyComment(CommentVO commentVO) throws DataAccessException {
		sqlSession.update("mapper.board.modifyComment", commentVO);
	}
	
	@Override
	public void deleteComment(String commentNo) throws DataAccessException {
		sqlSession.update("mapper.board.deleteComment", commentNo);
		
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
