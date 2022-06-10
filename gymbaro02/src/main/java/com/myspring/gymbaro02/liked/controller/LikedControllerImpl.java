package com.myspring.gymbaro02.liked.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.myspring.gymbaro02.liked.service.LikedService;
import com.myspring.gymbaro02.liked.vo.LikedVO;
import com.myspring.gymbaro02.member.vo.MemberVO;

@Controller("controller")
@RequestMapping(value="/liked")
public class LikedControllerImpl implements LikedController{
	@Autowired
	private LikedService likedService;
	
	// 찜한 시설 추가하기
	@Override
	@RequestMapping(value= "/addNewLiked.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody String addNewLiked(@RequestParam("gym_id") String gym_id, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String message="";
		if(session.getAttribute("memberInfo") != null) {
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		int uid = memberVO.getUid();
		
		LikedVO likedVO = new LikedVO();
		likedVO.setGym_id(Integer.parseInt(gym_id));
		likedVO.setUid(uid);
		
		likedService.addNewLiked(likedVO);		
		
		message = "addSuccess";
		}else {
			message ="doLogin";
		}
		
		return message;
	}
	
	// 찜한 시설 조회하기
	@Override
	@RequestMapping(value= "/listMyLiked.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listMyLiked(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		if(session.getAttribute("memberInfo") != null) {
			MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			List<LikedVO> listMyLiked = likedService.listMyLikedList(uid);
			session.setAttribute("listMyLiked", listMyLiked);
			mav.setViewName(viewName);
		}else {
			mav.setViewName("redirect:/member/loginForm.do");
		}
		
		return mav;
	}
	
	// 찜한 시설 삭제하기
	@Override
	@RequestMapping(value= "/deleteLikedItem.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody String deleteLikedItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		List<LikedVO> deleteList = new ArrayList<LikedVO>();
		String message = "";
		if(session.getAttribute("memberInfo") != null) {
			MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			String[] gym_id = request.getParameterValues("gym_id");
			for(int i=0; i<gym_id.length; i++) {
				LikedVO likedVO = new LikedVO();
				likedVO.setGym_id(Integer.parseInt(gym_id[i]));
				likedVO.setUid(uid);
				deleteList.add(likedVO);
			}
			likedService.deleteLikedItem(deleteList);
			message="delSuccess";
		}else {
			message="login";
		}
		
		return message;
	}
}
