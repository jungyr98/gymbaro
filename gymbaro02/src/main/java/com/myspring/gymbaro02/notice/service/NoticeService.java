package com.myspring.gymbaro02.notice.service;

import java.util.List;
import java.util.Map;

import com.myspring.gymbaro02.notice.vo.NoticeVO;

public interface NoticeService {
	public int selectNoticeListCnt(Map<String, Object> condMap) throws Exception;
	public int newNotice(Map newNoticeMap) throws Exception;
	public List<NoticeVO> viewAll(Map<String, Object> condMap) throws Exception;
	public Map<String, Object> readNotice(Map readNoticeMap) throws Exception;
	public void increaseViewCnt(Map readNoticeMap) throws Exception;
	public void deleteNotice(String noticeNo) throws Exception;
	public String getPrevNotice(String noticeNo) throws Exception;
	public String getNextNotice(String noticeNo) throws Exception;
}
