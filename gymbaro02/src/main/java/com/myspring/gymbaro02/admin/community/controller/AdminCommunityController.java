package com.myspring.gymbaro02.admin.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface AdminCommunityController {
	public ModelAndView selectArticleList(@RequestParam("article_type") String article_type, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	public @ResponseBody String updateBoardHidden(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String updateBoardView(@RequestParam("articleNo") int articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String updateCommentHidden(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String updateCommentView(@RequestParam("commentNo") int commentNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String deleteNotice(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addNewNotice(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView selectArticleDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
