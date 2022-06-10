package com.myspring.gymbaro02.community.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.community.service.CommunityService;
import com.myspring.gymbaro02.community.vo.BoardVO;
import com.myspring.gymbaro02.community.vo.CommentVO;
import com.myspring.gymbaro02.member.vo.MemberVO;

@Controller("communityController")
@EnableAspectJAutoProxy
public class CommunityControllerImpl implements CommunityController {
	@Autowired
	private CommunityService boardService;
	
	
	// 커뮤니티  
			@Override
			@RequestMapping(value= "/community/community.do" ,method={RequestMethod.POST,RequestMethod.GET})
			public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session = request.getSession();
				
				session.setAttribute("section", 1);
				session.setAttribute("pageNum", 1);
				
				ModelAndView mav = new ModelAndView();
				
				List<BoardVO> viewAll = boardService.viewAll();
				String viewName=(String)request.getAttribute("viewName");		
				
				mav.setViewName(viewName);
				mav.addObject("viewAll", viewAll);		
				
				return mav;
			}
	
	// 커뮤니티 게시물 상세조회, 댓글 조회
	@Override
	@RequestMapping(value= "/community/communityDetail.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView communityDetail(@RequestParam Map <String, Object> readArticleMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mav=new ModelAndView();
				
		String viewName=(String)request.getAttribute("viewName");
		
		boardService.increaseViewCnt(readArticleMap); // 조회수 증가 
		boardService.updateCommentCnt(readArticleMap); // 댓글 개수 업데이트
		
		mav.addObject("readArticle", boardService.readArticle(readArticleMap));
		
		String articleNo = (String) readArticleMap.get("articleNo");
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		List<CommentVO> viewComment = boardService.viewComment(articleNo);
		CommentVO commentVO = (CommentVO) request.getAttribute("commentVO");
		
		String prevArticleNo = boardService.getPrevArticle(articleNo); // 이전 글 번호 가져오기
		String nextArticleNo = boardService.getNextArticle(articleNo); // 다음 글 번호 가져오기 
		 
		mav.addObject("prevArticleNo", prevArticleNo); 
		mav.addObject("nextArticleNo", nextArticleNo);
		mav.addObject("commentVO", commentVO);
		mav.addObject("viewComment", viewComment);
		mav.setViewName(viewName);
		return mav;
	}
	
	// 커뮤니티 글 작성 
		@Override
		@RequestMapping(value= "/community/communityWrite.do", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView communityWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			
			return mav;
		}
		
		private String relaceParameter(String param) {
			
			String result = param;
			
			if(param != null) {
				result = result.replaceAll("<", "&lt;");
				result = result.replaceAll(">", "&gt;");
				result = result.replaceAll("&", "&amp;");
				result = result.replaceAll("\"", "&quot;");
			}
			return result;
		}

	// 커뮤니티 글 작성
		@Override
		@RequestMapping(value= "/community/addNewArticle.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView newArticle(@RequestParam Map <String, Object> newArticleMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
			HttpSession session = request.getSession();
			ModelAndView mav=new ModelAndView();
		
			String article_category = (String) newArticleMap.get("article_category");
			String title = (String) newArticleMap.get("title");
			// 臾몄옄�뿴 �븘�꽣 �뀒�뒪�듃
			title = this.relaceParameter(title);
			
			String txtContent = (String) newArticleMap.get("txtContent");
			
			MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
			String writer = memberVO.getMember_name();
			int uid = memberVO.getUid();
			int articleNo = 0;
			int view_cnt = 0;
			int comment_cnt = 0;
		
			if (title != null) {
				newArticleMap.put("articleNo", articleNo);
				newArticleMap.put("article_category", article_category);
				newArticleMap.put("title", title);
				newArticleMap.put("txtContent", txtContent);
				newArticleMap.put("writer", writer);
				newArticleMap.put("uid", uid);
				newArticleMap.put("view_cnt", view_cnt);
				newArticleMap.put("comment_cnt", comment_cnt);
				boardService.newArticle(newArticleMap); 
				mav.setViewName("redirect:community.do");
			} else {
				mav.setViewName("/community/addNewArticle");
			}				
			return mav;
		}

	// 커뮤니티 게시물 삭제
	@Override
		@RequestMapping(value="/community/deleteArticle.do", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView deleteArticle(@RequestParam("articleNo") String articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			ModelAndView mav = new ModelAndView();
			
			boardService.deleteArticle(articleNo);
			MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
			
			mav.setViewName("redirect:community.do");
			return mav;
		}
	// 커뮤니티 게시물 수정 
	@RequestMapping(value="/community/modifyForm.do", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView modifyForm(@RequestParam Map<String, Object> modArticleMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
		
			BoardVO boardVO = boardService.readArticle(modArticleMap); 
			
			mav.addObject("boardVO", boardVO);
			mav.setViewName("/community/communityWrite");
			return mav;	
		}

	// 커뮤니티 댓글 작성
	@Override
		@RequestMapping(value="/community/addNewComment.do", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView newComment(@RequestParam Map<String, Object> readArticleMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			ModelAndView mav = new ModelAndView();
			
			String comment_content = request.getParameter("comment_content");
			
			MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
			int uid = memberVO.getUid(); 

			String comment_writer = memberVO.getMember_name(); 	
			
			BoardVO boardVO = boardService.readArticle(readArticleMap); 
			int articleNo = boardVO.getArticleNo();
			
			CommentVO commentVO = new CommentVO();
			commentVO.setArticleNo(articleNo);
			commentVO.setUid(uid); 
			commentVO.setComment_writer(comment_writer);
			commentVO.setComment_content(comment_content);
			
			boardService.newComment(commentVO);
			
			mav.addObject("commentVO", commentVO);
			System.out.println(commentVO.getUid());
			mav.setViewName("redirect:communityDetail.do?articleNo=" + readArticleMap.get("articleNo"));
			
			return mav;
		}

	// 커뮤니티 댓글 삭제 
		@Override
		@RequestMapping(value="/community/deleteComment.do", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView deleteComment(@RequestParam("commentNo") String commentNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			ModelAndView mav = new ModelAndView();
			
			CommentVO commentVO = (CommentVO) session.getAttribute("commentVO");
			
			String articleNo = request.getParameter("articleNo");
		
			boardService.deleteComment(commentNo);
			
			mav.addObject("commentVO", commentVO);
			mav.setViewName("redirect:communityDetail.do?articleNo=" + articleNo);
			return mav;
		}

}

