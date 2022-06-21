package com.myspring.gymbaro02.cs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.cs.vo.CsCommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;

@Repository("csDAO")
public class CsDAOImpl implements CsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//문의글 추가
		@Override
		public void addNewcs(Map<String,Object> map) throws DataAccessException{
			sqlSession.insert("mapper.cs.addNewcs",map);
		}
		
		//문의글 목록 조회 
		@Override
		public List<CsVO> selectCS() throws DataAccessException{
			List<CsVO> csList = sqlSession.selectList("mapper.cs.selectCS");
			return csList;
		}
		
		//문의글 상세
		@Override
		public CsVO csDetail(String csNO) throws DataAccessException{
			CsVO csDetail = sqlSession.selectOne("mapper.cs.csDetail", csNO);
			return csDetail;
		}
		
		//문의글 수정
		@Override
		public void updateCS(Map<String,Object> CsMap) throws DataAccessException{
			sqlSession.update("mapper.cs.updateCS",CsMap);
			
		}
		
		//문의글 삭제
		@Override
		public void deleteCS(String csNO) throws DataAccessException{
			sqlSession.delete("mapper.cs.deleteCS",csNO);
		}
		
		// 답변 조회
		@Override
		public CsCommentVO cscommentlist(String csNO) throws Exception{
			return sqlSession.selectOne("mapper.cs.commentList", csNO);
		}
		
		//답변 등록 
		@Override
		public void insertCsComment(CsCommentVO cscommentVO) throws DataAccessException{
			sqlSession.insert("mapper.cs.insertCsComment", cscommentVO);
		}
		
		//답변 수정
		@Override
		public void csCommentModify(CsCommentVO cscommentVO) throws Exception{
			sqlSession.update("mapper.cs.csCommentModify", cscommentVO);
		}
		
		//답변 삭제
		@Override
		public void csCommentDelete(String cs_commentNO) throws Exception{
			sqlSession.delete("mapper.cs.csCommentDelete", cs_commentNO);
		}

}
