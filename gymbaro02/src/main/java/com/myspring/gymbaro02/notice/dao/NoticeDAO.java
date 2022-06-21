package com.myspring.gymbaro02.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.gymbaro02.notice.vo.NoticeImageFileVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;

public interface NoticeDAO {
	public int selectNoticeListCnt(Map<String, Object> condMap) throws DataAccessException;
	public int newNotice(Map<String, Object> newNoticeMap) throws DataAccessException;
	public void newNoticeImage(List<NoticeImageFileVO> imageFileList)throws DataAccessException;
	public List<NoticeVO> viewAll(Map<String, Object> condMap) throws DataAccessException;
	public Map<String, Object> readNotice(Map readNoticeMap) throws DataAccessException;
	public void increaseViewCnt(Map readNoticeMap) throws DataAccessException;
	public List<NoticeImageFileVO> selectNoticeImage(Map readNoticeMap) throws DataAccessException;
	public void deleteNotice(String noticeNo) throws DataAccessException;
	public String getPrevNotice(String noticeNo) throws DataAccessException;
	public String getNextNotice(String noticeNo) throws DataAccessException;
}
