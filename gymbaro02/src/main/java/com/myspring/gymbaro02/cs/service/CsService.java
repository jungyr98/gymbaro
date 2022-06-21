package com.myspring.gymbaro02.cs.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.cs.vo.CsCommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;

public interface CsService {
	public void addcsList (Map<String,Object> map) throws Exception; //문의글 추가
	public List<CsVO> selectCS() throws Exception; //글 목록 조회 
	public CsVO csDetail(String csNO) throws Exception; //문의글 상세
	public void updateCS (Map<String,Object> CsMap) throws Exception; //문의글 수정
	public void deleteCS(String csNO) throws Exception; //문의글 삭제
	public CsCommentVO cscommentlist(String csNO) throws Exception; //답변 조회
	public void insertCsComment(CsCommentVO cscommentVO) throws Exception; //답변 등록
	public void csCommentModify(CsCommentVO cscommentVO) throws Exception; //답변 수정
	public void csCommentDelete(String cs_commentNO) throws Exception; //답변 삭제
}
