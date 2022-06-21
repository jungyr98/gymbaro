package com.myspring.gymbaro02.admin.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface AdminMemberController {
	public ModelAndView login(@RequestParam Map<String, Object> loginMap,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView selectMemberList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String updateMemberLevel(@RequestParam Map<String,Object> updateLevelMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String updateMemberPoint(@RequestParam Map<String,Object> updatePointMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String deleteMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView selectMemberDetail(@RequestParam("uid") String uid, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
