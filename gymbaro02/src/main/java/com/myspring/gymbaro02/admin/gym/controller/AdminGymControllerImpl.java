package com.myspring.gymbaro02.admin.gym.controller;

import java.util.ArrayList;
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

import com.myspring.gymbaro02.admin.gym.service.AdminGymService;
import com.myspring.gymbaro02.gym.vo.GymVO;

@Controller("adminGymController")
@RequestMapping(value="/admin/gym")
public class AdminGymControllerImpl implements AdminGymController {
	@Autowired
	private AdminGymService adminGymService;
	
	// 시설 리스트 조회
	@Override
	@RequestMapping(value= "/selectGymList.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView selectGymList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session;
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		List<GymVO> listGyms = new ArrayList<GymVO>();
		listGyms = adminGymService.selectGymList();
		session.setAttribute("listGyms", listGyms);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// 시설 상태 변경
	@Override
	@RequestMapping(value="/updateGymState.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateGymState(@RequestParam Map<String,Object> updateStateMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		adminGymService.updateGymState(updateStateMap); // 회원 등급 수정하기 위한 인자 전달
		
		mav.setViewName("redirect:/admin/gym/selectGymList.do"); // 수정 후 회원 리스트 화면으로 이동
		return mav;
	}
	
	// 시설 추천여부 변경
	@Override
	@RequestMapping(value="/updateRecommand.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateRecommand(@RequestParam Map<String,Object> updateRecommandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		adminGymService.updateRecommand(updateRecommandMap); // 회원 등급 수정하기 위한 인자 전달
		
		mav.setViewName("redirect:/admin/gym/selectGymList.do"); // 수정 후 회원 리스트 화면으로 이동
		return mav;
	}

}
