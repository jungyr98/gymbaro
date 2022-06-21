package com.myspring.gymbaro02.cs.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.cs.service.CsService;
import com.myspring.gymbaro02.cs.vo.CsCommentVO;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;
import com.myspring.gymbaro02.member.vo.MemberVO;

@Controller("csController")
@RequestMapping(value="/cs")
public class CsControllerImpl implements CsController {
	@Autowired
	private CsService csService;

	//문의글 목록 조회
			@Override
			@RequestMapping(value= "/csQnA.do" ,method={RequestMethod.POST,RequestMethod.GET})
			public ModelAndView csQnA(HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session;
				session = request.getSession();
				ModelAndView mav=new ModelAndView();
				String viewName=(String)request.getAttribute("viewName");
				List<CsVO> csList = csService.selectCS();
				session.setAttribute("csList", csList);
				mav.setViewName(viewName);
				return mav;
			}
			
			//1:1문의
			@Override
			@RequestMapping(value= "/personalQ.do" ,method={RequestMethod.POST,RequestMethod.GET})
			public ModelAndView personalQ(HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session;
				session = request.getSession();
				ModelAndView mav=new ModelAndView();
				String viewName=(String)request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			
			//문의글 추가
			@Override
			@RequestMapping(value="/addNewcs.do", method= {RequestMethod.POST})
			public ModelAndView addNewcs(@RequestParam Map<String,Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session = request.getSession();
				ModelAndView mav = new ModelAndView();
				String viewName = (String)request.getAttribute("viewName");
				String txtContent = (String)map.get("txtContent");
				if(session.getAttribute("memberInfo") != null) {
					MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
					int uid = memberVO.getUid();
					String writer = memberVO.getMember_name();
					map.put("uid", uid);
					map.put("writer", writer);
					if(session.getAttribute("goodsVO") != null) {
						GoodsVO goodsVO = (GoodsVO)session.getAttribute("goodsVO");
						int goods_id = goodsVO.getGoods_id();
						map.put("goods_id", goods_id);
					}else if(session.getAttribute("goodsVO") == null) {
						map.put("goods_id",0);
					}
					csService.addcsList(map);
					System.out.println(map.get("secret"));
					mav.setViewName("redirect:/cs/csQnA.do");
				}
				return mav;
			}
			
			//문의글 상세 
			@Override
			@RequestMapping(value="/csDetail.do", method= {RequestMethod.GET, RequestMethod.POST})
			public ModelAndView csDetail(@RequestParam("csNO") String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session;
				session = request.getSession();
				ModelAndView mav = new ModelAndView();
				String viewName = (String)request.getAttribute("viewName");
				CsVO csDetail = csService.csDetail(csNO);
				
				CsCommentVO commentList = csService.cscommentlist(csNO);
				CsCommentVO commentVO  = (CsCommentVO) request.getAttribute("commentVO");
				
				session.setAttribute("csDetail",csDetail);
				session.setAttribute("commentList", commentList);
				mav.setViewName(viewName);
				return mav;
			}
			
			//문의글 수정
			@Override
			@RequestMapping(value="/updateCS.do", method= {RequestMethod.GET, RequestMethod.POST})
			public ModelAndView updateCS(@RequestParam Map<String,Object> CsMap, String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session;
				session = request.getSession();
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				
				csService.updateCS(CsMap); 
				mav.addObject("csNO", csNO);
				session.setAttribute("CsMap", CsMap);
				mav.setViewName("redirect:/cs/csDetail.do?csNO=" + csNO);
				return mav;
			}
			
			//문의글 작성
			@Override
			@RequestMapping(value="/updateForm.do", method={RequestMethod.GET, RequestMethod.POST})
			public ModelAndView updateForm(@RequestParam("csNO") String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session;
				session = request.getSession();
				ModelAndView mav = new ModelAndView();
				CsVO csDetail = csService.csDetail(csNO);
				String viewName = (String) request.getAttribute("viewName");
				session.setAttribute("csDetail", csDetail);
				mav.addObject("csNO", csNO);
				mav.setViewName(viewName);
				return mav; 
			}
			
			//문의글 삭제 
			@Override
			@RequestMapping(value="/deleteCS.do", method= {RequestMethod.GET, RequestMethod.POST})
			public ModelAndView deleteCS(@RequestParam("csNO") String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session;
				session = request.getSession();
				ModelAndView mav = new ModelAndView();
				csService.deleteCS(csNO);
				System.out.println("###"+csNO);
				String viewName = (String) request.getAttribute("viewName");
				mav.addObject("csNO", csNO);
				mav.setViewName("redirect:/cs/csQnA.do");
				return mav;
			}
			
			//답변 작성
			@Override
			@RequestMapping(value="/insertCsComment.do", method= {RequestMethod.GET, RequestMethod.POST})
			public ModelAndView insertCsComment(@RequestParam("csNO_2") String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session;
				session = request.getSession();
				String viewName = (String)request.getAttribute("viewName");
				ModelAndView mav = new ModelAndView();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
				int uid = memberVO.getUid(); 
				String writer = memberVO.getMember_name(); 
				System.out.println("test:" + csNO);
				CsCommentVO commentVO = new CsCommentVO();
				String commentContent = (String) request.getParameter("commentContent");
				commentVO.setCsNO(Integer.parseInt(csNO));
				commentVO.setUid(uid);
				commentVO.setWriter(writer);
				commentVO.setCommentContent(commentContent);
				
				csService.insertCsComment(commentVO);
				
				mav.setViewName("redirect:/cs/csDetail.do?csNO="+csNO);
				return mav;
			}
			
			//답변 수정 
			@Override
			@RequestMapping(value="/updateCsComment.do", method= {RequestMethod.GET, RequestMethod.POST})
			public ModelAndView updateCsComment(@RequestParam Map<String,Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session;
				session = request.getSession();
				String viewName = (String)request.getAttribute("viewName");
				ModelAndView mav = new ModelAndView();
				CsCommentVO csCommentVO = new CsCommentVO();
				System.out.println("test: " + map.get("cs_commentNO") + ", " + map.get("csNO") + ", " + map.get("commentContent"));
				int cs_commentNO = (Integer.parseInt((String)map.get("cs_commentNO")));
				int csNO = (Integer.parseInt((String)map.get("csNO")));
				String commentContent = (String)map.get("commentContent");
				csCommentVO.setCs_commentNO(cs_commentNO);
				csCommentVO.setCsNO(csNO);
				csCommentVO.setCommentContent(commentContent);
				
				csService.csCommentModify(csCommentVO);
				session.setAttribute("csCommentVO", csCommentVO);
				mav.setViewName("redirect:/cs/csDetail.do?csNO="+csNO);
				return mav;
			}
			
			//답변 수정 폼 
			@Override
			@RequestMapping(value="/updateCsForm.do", method= {RequestMethod.GET, RequestMethod.POST})
			public ModelAndView updateCsForm(@RequestParam("csNO") String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
				HttpSession session;
				session = request.getSession();
				ModelAndView mav = new ModelAndView();
				CsCommentVO commentList = csService.cscommentlist(csNO);
				String viewName = (String) request.getAttribute("viewName");
				System.out.println("####"+csNO);

				session.setAttribute("commentList", commentList);
				mav.setViewName(viewName);
				return mav; 
			}
			
			//답변 삭제 
				@Override
				@RequestMapping(value="/csCommentDelete.do", method= {RequestMethod.GET, RequestMethod.POST})
				public ModelAndView csCommentDelete(@RequestParam("cs_commentNO") String cs_commentNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
					HttpSession session;
					session = request.getSession();
					ModelAndView mav = new ModelAndView();
					csService.csCommentDelete(cs_commentNO);
					System.out.println("###"+cs_commentNO);
					String viewName = (String) request.getAttribute("viewName");
					mav.addObject("cs_commentNO", cs_commentNO);
					mav.setViewName("redirect:/cs/csQnA.do");
					return mav;
				}
}
