package com.myspring.gymbaro02.membership.controller;

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

import com.myspring.gymbaro02.membership.service.MembershipService;

@Controller("membershipController")
@RequestMapping(value="/membership")
public class MembershipControllerImpl implements MembershipController {
	@Autowired
	private MembershipService membershipService;
	
	@Override
	@RequestMapping(value= "/membershipForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView membershipForm(@RequestParam Map<String, Object> optionMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		
		session.setAttribute("optionMap", optionMap);
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value= "/addNewMembership.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addNewMembership(@RequestParam Map<String, Object> membershipMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		
		membershipMap.put("membership_state", "활성화");
		String membership_id = membershipService.addNewMembership(membershipMap);
		
		membershipMap.put("membership_id", membership_id); // 회원권 구매 결과 화면에서 회원권 번호를 확인할 수 있게 맵에 데이터 추가
		session.setAttribute("membershipMap", membershipMap);
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
}
