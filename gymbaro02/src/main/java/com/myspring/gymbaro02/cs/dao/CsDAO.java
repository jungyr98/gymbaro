package com.myspring.gymbaro02.cs.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.cs.vo.CsCommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;

public interface CsDAO {
	public void addNewcs(Map<String,Object> map) throws DataAccessException; //문의글 추가 
	public List<CsVO> selectCS() throws DataAccessException; //문의글 목록 조회
	public CsVO csDetail(String csNO) throws DataAccessException; //문의글 상세
	public void updateCS(Map<String,Object> CsMap) throws DataAccessException; //문의글 수정
	public void deleteCS(String csNO) throws DataAccessException; //문의글 삭제 
	public CsCommentVO cscommentlist(String csNO) throws Exception; //답변 조회 
	public void insertCsComment(CsCommentVO cscommentVO) throws DataAccessException; //답변 등록
	public void csCommentModify(CsCommentVO cscommentVO) throws Exception; //답변 수정 
	public void csCommentDelete(String cs_commentNO) throws Exception; //답변 삭제 
}
