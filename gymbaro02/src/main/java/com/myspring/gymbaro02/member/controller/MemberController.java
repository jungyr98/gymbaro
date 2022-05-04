package com.myspring.gymbaro02.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.member.vo.MemberVO;

public interface MemberController {

	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView idpwdFind(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView idFindSuccess(@RequestParam Map<String, String> idByEmail, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView idFindSuccessByNum(@RequestParam Map<String, String> idByNumMap, HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ModelAndView newPwdForm(@RequestParam Map<String, String> findPwdMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView pwdFindSuccess(@RequestParam Map<String, String> pwdMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join01(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join02(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join03_1(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join03_2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join04(@RequestParam("hp") String hp, @RequestParam("email1") String email1, @RequestParam("join_type") String join_type, @RequestParam("email2") String email2, @ModelAttribute("memberVO") MemberVO _memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
