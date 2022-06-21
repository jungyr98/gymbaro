package com.myspring.gymbaro02.admin.community.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.admin.community.service.AdminCommunityService;
import com.myspring.gymbaro02.community.service.CommunityService;
import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.goods.vo.GoodsReviewVO;
import com.myspring.gymbaro02.notice.vo.NoticeVO;

@Controller("adminCommunityController")
@RequestMapping(value="/admin/community")
public class AdminCommunityControllerImpl implements AdminCommunityController {
	@Autowired
	private AdminCommunityService adminCommunityService;
	@Autowired
	private CommunityService communityService;
	@Autowired
	private static final String CURR_IMAGE_REPO_PATH_NOTICE = "C:\\gymbaro_img\\notice";
	
	// 게시물 조회
	@Override
	@RequestMapping(value="/selectArticleList.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView selectArticleList(@RequestParam("article_type") String article_type, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("article_type:" + article_type);
		if(article_type.equals("board")) {
			List<BoardVO> boardList = adminCommunityService.selectBoardList();
			session.setAttribute("boardList", boardList);
		}else if(article_type.equals("comment")) {
			List<CommentVO> commentList = adminCommunityService.selectCommentList();
			session.setAttribute("commentList", commentList);
		}else if(article_type.equals("notice")) {
			List<NoticeVO> noticeList = adminCommunityService.selectNoticeList();
			session.setAttribute("noticeList", noticeList);
		}else if(article_type.equals("review")) {
			List<GoodsReviewVO> reviewList = adminCommunityService.selectReviewList();
			session.setAttribute("reviewList", reviewList);
		}else if(article_type.equals("cs")) {
			List<CsVO> csList = adminCommunityService.selectCsList();
			session.setAttribute("csList", csList);
		}
		
		mav.addObject("article_type", article_type);
		mav.setViewName(viewName);
		return mav;
	}
	
	// 게시글 숨김 처리 하기
	@Override
	@RequestMapping(value="/updateBoardHidden.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/text; charset=utf-8")
	public @ResponseBody String updateBoardHidden(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		
		List<BoardVO> hiddenList = new ArrayList<BoardVO>();
		String[] articleNo = request.getParameterValues("articleNo");
		
		for(int i=0; i<articleNo.length; i++) {
			BoardVO boardVO = new BoardVO();
			System.out.println("진입: articleNO:" + articleNo[i]);
			boardVO.setArticleNo(Integer.parseInt(articleNo[i]));
			hiddenList.add(boardVO);
		}
	
		adminCommunityService.updateBoardHidden(hiddenList);
		message = "hiddenSuccess";
		
		return message;
	}
	
	// 게시글 숨김 해제 하기
	@Override
	@RequestMapping(value="/updateBoardView.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/text; charset=utf-8")
	public @ResponseBody String updateBoardView(@RequestParam("articleNo") int articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String message = "";
		
		adminCommunityService.updateBoardView(articleNo);
		message = "updateSuccess";
		return message;
	}
	
	// 댓글 숨김 처리 하기
	@Override
	@RequestMapping(value="/updateCommentHidden.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/text; charset=utf-8")
	public @ResponseBody String updateCommentHidden(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		
		List<CommentVO> hiddenList = new ArrayList<CommentVO>();
		String[] commentNo = request.getParameterValues("commentNo");
		
		for(int i=0; i<commentNo.length; i++) {
			CommentVO commentVO = new CommentVO();
			commentVO.setCommentNo(Integer.parseInt(commentNo[i]));
			hiddenList.add(commentVO);
		}
	
		adminCommunityService.updateCommentHidden(hiddenList);
		message = "hiddenSuccess";
		
		return message;
	}
	
	// 댓글 숨김 해제하기
	@Override
	@RequestMapping(value="/updateCommentView.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/text; charset=utf-8")
	public @ResponseBody String updateCommentView(@RequestParam("commentNo") int commentNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		
		adminCommunityService.updateCommentView(commentNo);
		message = "updateSuccess";
		
		return message;
	}
	
	// 공지글 삭제하기
	@Override
	@RequestMapping(value="/deleteNotice.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/text; charset=utf-8")
	public @ResponseBody String deleteNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		
		List<NoticeVO> deleteList = new ArrayList<NoticeVO>();
		String[] noticeNo = request.getParameterValues("noticeNo");
		
		for(int i=0; i<noticeNo.length; i++) {
			NoticeVO noticeVO = new NoticeVO();
			noticeVO.setNoticeNo(Integer.parseInt(noticeNo[i]));
			deleteList.add(noticeVO);
			
			// 기존 이미지 파일에서 삭제하기
			try{
				File srcFile = new File(CURR_IMAGE_REPO_PATH_NOTICE+"\\"+noticeNo[i]);
				srcFile.delete();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	
		adminCommunityService.deleteNotice(deleteList);
		message = "delSuccess";
		
		return message;
	}
	
	// 새 공지 등록창
	@Override
	@RequestMapping(value="/addNewNotice.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView addNewNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// 게시글 상세창
	@Override
	@RequestMapping(value="/selectArticleDetail.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView selectArticleDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		Map readArticleMap = new HashMap();
		String articleNo = request.getParameter("articleNo");
		readArticleMap.put("articleNo", articleNo);
		
		BoardVO boardVO = communityService.readArticle(readArticleMap);
		mav.addObject("readArticle", boardVO);
		List<CommentVO> viewComment = communityService.viewComment(articleNo);
		List<CommentVO> replyComment = communityService.replyComment(articleNo);
		mav.addObject("viewComment", viewComment);
		mav.addObject("replyComment", replyComment);
		
		mav.setViewName(viewName);
		return mav;
	}
}
