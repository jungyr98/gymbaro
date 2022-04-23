package com.myspring.gymbaro02.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MemberController {

	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView idpwdFind(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView idFindSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView newPwdForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView pwdFindSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join01(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join02(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join03_1(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join03_2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join04(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
