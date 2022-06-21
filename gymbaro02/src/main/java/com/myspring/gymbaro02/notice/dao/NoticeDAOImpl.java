package com.myspring.gymbaro02.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.gymbaro02.notice.vo.NoticeImageFileVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;

@Repository("noiceDAO")
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 글 개수
	@Override
	public int selectNoticeListCnt(Map<String, Object> condMap) throws DataAccessException {
		int listCnt = sqlSession.selectOne("mapper.notice.selectNoticeListCnt", condMap);
		return listCnt;
	}
	
	@Override
	public int newNotice(Map<String, Object> newNoticeMap) throws DataAccessException {
		int noticeNo = selectNoticeNo();
		newNoticeMap.put("noticeNo", noticeNo);
		sqlSession.insert("mapper.notice.newNotice", newNoticeMap);
		return noticeNo;
	}
	
	@Override
	public void newNoticeImage(List<NoticeImageFileVO> imageFileList)throws DataAccessException {
		for(int i=0; i<imageFileList.size(); i++) {
			NoticeImageFileVO noticeImageFileVO = imageFileList.get(i);
			sqlSession.insert("mapper.notice.insertNewNoticeImage", noticeImageFileVO);
		}
	}
	
	@Override
	public List<NoticeVO> viewAll(Map<String, Object> condMap) throws DataAccessException {
		return sqlSession.selectList("mapper.notice.viewAll", condMap);
	}
	
	@Override
	public Map<String, Object> readNotice(Map readNoticeMap) throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.readNotice", readNoticeMap);
	}
	
	@Override
	public void increaseViewCnt(Map readNoticeMap) throws DataAccessException {
		sqlSession.update("mapper.notice.increaseViewCnt", readNoticeMap);
	}
	
	private int selectNoticeNo() throws DataAccessException {
		int noticeNo = sqlSession.selectOne("mapper.notice.selectNoticeNo");
		return noticeNo;
	}
	
	@Override
	public List<NoticeImageFileVO> selectNoticeImage(Map readNoticeMap) throws DataAccessException {
		List<NoticeImageFileVO> noticeImageList = sqlSession.selectList("mapper.notice.selectNoticeImage", readNoticeMap);
		return noticeImageList;
	}
	
	@Override
	public void deleteNotice(String noticeNo) throws DataAccessException {
		sqlSession.delete("mapper.notice.deleteNotice", noticeNo);
	}
	
	@Override
	public String getPrevNotice(String noticeNo) throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.getPrevNotice", noticeNo);	
	}
	
	@Override
	public String getNextNotice(String noticeNo) throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.getNextNotice", noticeNo);
	}
}
