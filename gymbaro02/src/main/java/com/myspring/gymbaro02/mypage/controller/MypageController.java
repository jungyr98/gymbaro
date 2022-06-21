package com.myspring.gymbaro02.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.membership.vo.MembershipVO;

public interface MypageController {

	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, Object> condMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listMyPointHistory(@RequestParam Map<String, Object> condMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myMembership(@RequestParam Map<String,Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listMyBoardHistory(@RequestParam Map<String, Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listMyCsHistory(@RequestParam Map<String,Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView outMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			@RequestParam("value")  String value, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myGymInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addNewGymForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addNewGym(@RequestParam Map<String, Object> gymMap, @RequestParam List<String> service,
			MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listMyOrderDetail(@RequestParam("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listMyMembershipDetail(@RequestParam("membership_id") String membership_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listMyGymMembership(@RequestParam Map<String, Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myGymSales(@RequestParam Map<String, Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
