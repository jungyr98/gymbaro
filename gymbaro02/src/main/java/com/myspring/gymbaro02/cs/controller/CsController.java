package com.myspring.gymbaro02.cs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CsController {
	
	public ModelAndView csQnA(HttpServletRequest request, HttpServletResponse response) throws Exception; //문의글 목록 조회 
	public ModelAndView personalQ(HttpServletRequest request, HttpServletResponse response) throws Exception; //문의글 등록폼
	public ModelAndView addNewcs(@RequestParam Map<String,Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception; //문의글 추가
	public ModelAndView csDetail(@RequestParam("csNO") String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception; //문의글 상세 
	public ModelAndView updateCS(@RequestParam Map<String,Object> CsMap, String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception; //문의글 수정
	public ModelAndView updateForm(@RequestParam("csNO")  String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception; //문의글 작성
	public ModelAndView deleteCS(@RequestParam("csNO") String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception; //문의글 삭제
	public ModelAndView insertCsComment(@RequestParam String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception; //답변 작성 
	public ModelAndView updateCsComment(@RequestParam Map<String,Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception; //답변 수정 
	public ModelAndView updateCsForm(@RequestParam("csNO") String csNO, HttpServletRequest request, HttpServletResponse response) throws Exception; //답변 수정 폼 
	public ModelAndView csCommentDelete(@RequestParam("cs_commentNO") String cs_commentNO, HttpServletRequest request, HttpServletResponse response) throws Exception; //답변 삭제
	
}
