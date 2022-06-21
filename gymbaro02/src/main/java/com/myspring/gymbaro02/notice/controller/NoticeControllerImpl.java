package com.myspring.gymbaro02.notice.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.common.base.BaseController;
import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.notice.service.NoticeService;
import com.myspring.gymbaro02.notice.vo.NoticeImageFileVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;
import com.myspring.gymbaro02.pagination.Pagination;


@Controller("noticeController")
@RequestMapping(value="/notice")
public class NoticeControllerImpl extends BaseController implements NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private static final String CURR_IMAGE_REPO_PATH_NOTICE = "C:\\gymbaro_img\\notice";
	
	// 공지사항 목록 창 진입
	@Override
	@RequestMapping(value= "/notice.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView notice(@RequestParam(value="curPage", defaultValue="1") int curPage, @RequestParam Map<String, Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mav=new ModelAndView();
		
		// 전체리스트 개수
        int listCnt = noticeService.selectNoticeListCnt(condMap);
        Pagination pagination = new Pagination(listCnt, curPage);
        condMap.put("startIndex", pagination.getStartIndex());
        condMap.put("pageSize", pagination.getPageSize());
        System.out.println("test: " + pagination.getStartIndex() + ", " + pagination.getPageSize());
		
		List<NoticeVO> viewAll = noticeService.viewAll(condMap);
		mav.addObject("viewAll", viewAll);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagination", pagination);
		mav.addObject("condMap", condMap);
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

			
		return mav;
	}
		
	// 공지사항 작성 폼 진입
	@RequestMapping(value= "/noticeWrite.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mav=new ModelAndView();
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
	
		return mav;
	}
		
		// 공지사항 상세 조회
		@Override
		@RequestMapping(value= "/noticeDetail.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView noticeDetail(@RequestParam Map<String, Object> readNoticeMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
			HttpSession session = request.getSession();
			ModelAndView mav=new ModelAndView();
			String viewName=(String)request.getAttribute("viewName");
			String noticeNo = (String) readNoticeMap.get("noticeNo");
			Map noticeMap = (Map) noticeService.readNotice(readNoticeMap); // newNoticeMap > readNoticeMap > noticeMap(작성정보 + 이미지)
			
			List<NoticeImageFileVO> noticeImageList = (List<NoticeImageFileVO>) noticeMap.get("noticeImageList");

			session.setAttribute("noticeImageList", noticeMap.get("noticeImageList")); // 공지사항 이미지 리스트를 세션에 저장	
			noticeService.increaseViewCnt(readNoticeMap); // 조회수 
			
			String prevNoticeNo = noticeService.getPrevNotice(noticeNo); // 이전 글 번호 
			String nextNoticeNo = noticeService.getNextNotice(noticeNo); // 다음 글 번호
			
			
			mav.setViewName(viewName);
			mav.addObject("readNotice", noticeMap);
			mav.addObject("prevNoticeNo", prevNoticeNo);
			mav.addObject("nextNoticeNo", nextNoticeNo);
			return mav;
		}
		
		// 공지사항 새 글 작성 후 DB에 저장
		@RequestMapping(value= "/newNotice.do", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView newNotice(@RequestParam Map<String, Object> newNoticeMap, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
			HttpSession session = multipartRequest.getSession();
			ModelAndView mav = new ModelAndView();
				
			String title = (String) newNoticeMap.get("title");
			
			MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
			String notice_writer = memberVO.getMember_name();
			int uid = memberVO.getUid();
			int view_cnt = 0;
			
			String imageFileName = null;
			Enumeration enu = multipartRequest.getParameterNames();
			while(enu.hasMoreElements()) {
				String name = (String) enu.nextElement();
				String value = multipartRequest.getParameter(name);
				newNoticeMap.put(name, value);
			}
			
			List<NoticeImageFileVO> noticeImageList = uploadNotice(multipartRequest);
			newNoticeMap.put("noticeImageList", noticeImageList);
			
			System.out.println(noticeImageList);
			
			if (title != null) {
				newNoticeMap.put("title", title);
				newNoticeMap.put("uid", uid);
				newNoticeMap.put("notice_writer", notice_writer);
				newNoticeMap.put("view_cnt", view_cnt);
				mav.setViewName("redirect:notice.do");
			} else {
				mav.setViewName("/notice/newNotice");
			}
			
			
			try {
				int noticeNo = noticeService.newNotice(newNoticeMap);
				if (noticeImageList != null &&noticeImageList.size() != 0) {
					for(NoticeImageFileVO imageFileVO:noticeImageList) {
						imageFileName = imageFileVO.getImageFileName();
						File srcFile = new File(CURR_IMAGE_REPO_PATH_NOTICE + "\\" + "temp" + "\\" + imageFileName);
						File destDir = new File(CURR_IMAGE_REPO_PATH_NOTICE + "\\" + noticeNo);
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
						
					}
				}			
			} catch (Exception e) {
				if(noticeImageList != null && noticeImageList.size() != 0) {
					for(NoticeImageFileVO imageFileVO:noticeImageList) {
						imageFileName = imageFileVO.getImageFileName();
						File srcFile = new File(CURR_IMAGE_REPO_PATH_NOTICE + "\\" + "temp" + "\\" + imageFileName);
						srcFile.delete();
					}
				}
				
				
			}
			return mav;
		}
		
		// 공지사항 삭제 
		@Override
		@RequestMapping(value="/deleteNotice.do", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView deleteNotice(@RequestParam("noticeNo") String noticeNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			ModelAndView mav = new ModelAndView();
			MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
			
			noticeService.deleteNotice(noticeNo);
			
			mav.setViewName("redirect:notice.do");
			
			return mav;
		}
}
