package com.myspring.gymbaro02.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.member.vo.MemberVO;

public interface MemberController {

	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView idpwdFind(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView idFindSuccess(@RequestParam Map<String, String> idByEmail, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView idFindSuccessByNum(@RequestParam Map<String, String> idByNumMap, HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ModelAndView newPwdForm(@RequestParam Map<String, String> findPwdMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView pwdFindSuccess(@RequestParam Map<String, String> pwdMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView joinTypeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView agreeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView userJoinForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView gymJoinForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@RequestParam("hp") String hp, @RequestParam("email1") String email1, @RequestParam("join_type") String join_type, @RequestParam("email2") String email2, @ModelAttribute("memberVO") MemberVO _memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String callback(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}
