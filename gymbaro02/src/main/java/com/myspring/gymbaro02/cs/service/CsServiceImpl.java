package com.myspring.gymbaro02.cs.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.gymbaro02.cs.dao.CsDAO;
import com.myspring.gymbaro02.cs.vo.CsCommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;

@Service("csService")
public class CsServiceImpl implements CsService {
	@Autowired
	private CsDAO csDAO;
	
		//문의글 추가
		@Override
		public void addcsList (Map<String,Object> map) throws Exception{
			map.get("uid");
			csDAO.addNewcs(map);

		}
		
		//글 목록 조회 
		@Override
		public List<CsVO> selectCS() throws Exception{
			List<CsVO> csList = csDAO.selectCS();
			return csList;
		}
		
		//문의글 상세 
		@Override
		public CsVO csDetail(String csNO) throws Exception{
			CsVO csDetail = csDAO.csDetail(csNO);
			return csDetail;
		}
		
		//문의글 수정
		@Override
		public void updateCS (Map<String,Object> CsMap) throws Exception{
			csDAO.updateCS(CsMap);
		}
		
		//문의글 삭제
		@Override
		public void deleteCS(String csNO) throws Exception{
			csDAO.deleteCS(csNO);
		}
		
		//답변 조회
		@Override
		public CsCommentVO cscommentlist(String csNO) throws Exception{
			return csDAO.cscommentlist(csNO);
		}
		
		//답변 등록 
		@Override
		public void insertCsComment(CsCommentVO cscommentVO) throws Exception{
			csDAO.insertCsComment(cscommentVO);
		}
		
		//답변 수정
		@Override
		public void csCommentModify(CsCommentVO cscommentVO) throws Exception{
			csDAO.csCommentModify(cscommentVO);
		}
		
		//답변 삭제 
		@Override
		public void csCommentDelete(String cs_commentNO) throws Exception{
			csDAO.csCommentDelete(cs_commentNO);
		}
}
