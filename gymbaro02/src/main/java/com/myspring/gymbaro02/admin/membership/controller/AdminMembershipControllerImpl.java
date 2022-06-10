package com.myspring.gymbaro02.admin.membership.controller;

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

import com.myspring.gymbaro02.admin.membership.service.AdminMembershipService;
import com.myspring.gymbaro02.membership.vo.MembershipVO;

@Controller("adminMembershipController")
@RequestMapping(value="/admin/membership")
public class AdminMembershipControllerImpl implements AdminMembershipController {
	@Autowired
	private AdminMembershipService adminMembershipService;
	
	// 회원권 리스트 조회
	@Override
	@RequestMapping(value="/listMembership.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView listMembership(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session;
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		List<MembershipVO> listMembership = adminMembershipService.listMembership();
		session.setAttribute("listMembership", listMembership);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// 상품 상태 변경
	@Override
	@RequestMapping(value="/updateMembershipState.do", method={RequestMethod.POST, RequestMethod.GET})
	public void updateMembershipState(@RequestParam Map<String,Object> updateMembershipMap, HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		adminMembershipService.updateMembershipState(updateMembershipMap);
	}
		
	// 상품 삭제
	@Override
	@RequestMapping(value="/deleteMembership.do", method={RequestMethod.POST, RequestMethod.GET})
	public void deleteMembership(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<MembershipVO> deleteList = new ArrayList<MembershipVO>();
		String[] membership_id = request.getParameterValues("membership_id");
		for(int i=0; i<membership_id.length; i++) {
			MembershipVO membershipVO = new MembershipVO();
			String _membership_id = membership_id[i];
			membershipVO.setMembership_id(_membership_id);
			deleteList.add(membershipVO);
		}
		adminMembershipService.deleteMembership(deleteList);
	}
		
}
