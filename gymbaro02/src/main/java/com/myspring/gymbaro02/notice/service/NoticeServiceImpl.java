package com.myspring.gymbaro02.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.gymbaro02.notice.dao.NoticeDAO;
import com.myspring.gymbaro02.notice.vo.NoticeImageFileVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;

@Service("noticeService")
@Transactional(propagation=Propagation.REQUIRED)
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	
	// 전체 글 개수 조회
	@Override
	public int selectNoticeListCnt(Map<String, Object> condMap) throws Exception {
		int listCnt = noticeDAO.selectNoticeListCnt(condMap);
		return listCnt;
	}
	
	@Override
	public int newNotice(Map newNoticeMap) throws Exception {
		int noticeNo = noticeDAO.newNotice(newNoticeMap);
		//List<NoticeImageFileVO> noticeImageList = (List<NoticeImageFileVO>) newNoticeMap.get("noticeImageList");
		//for(int i=0; i< noticeImageList.size(); i++) { 
		//	NoticeImageFileVO noticeImageFileVO = noticeImageList.get(i);
		//	noticeImageFileVO.setNoticeNo(noticeNo);
		//}
		//noticeDAO.newNoticeImage(noticeImageList);
		return noticeNo;
	}
	
	@Override
	public List<NoticeVO> viewAll(Map<String, Object> condMap) throws Exception {
		return noticeDAO.viewAll(condMap);
	}
	
	@Override
	public Map<String, Object> readNotice(Map readNoticeMap) throws Exception {
		Map noticeMap = noticeDAO.readNotice(readNoticeMap);
		
		noticeMap.put("noticeMap", noticeMap);
		
		List<NoticeImageFileVO> noticeImageList = noticeDAO.selectNoticeImage(readNoticeMap);
		noticeMap.put("noticeImageList", noticeImageList);
		
		return noticeMap;
	}
	
	@Override
	public void increaseViewCnt(Map readNoticeMap) throws Exception {
		noticeDAO.increaseViewCnt(readNoticeMap);
	}
	
	@Override
	public void deleteNotice(String noticeNo) throws Exception {
		noticeDAO.deleteNotice(noticeNo);
	}
	
	@Override
	public String getPrevNotice(String noticeNo) throws Exception {
		return noticeDAO.getPrevNotice(noticeNo);
	}
	
	@Override
	public String getNextNotice(String noticeNo) throws Exception {
		return noticeDAO.getNextNotice(noticeNo);
	}
}
