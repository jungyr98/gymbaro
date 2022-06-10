package com.myspring.gymbaro02.community.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.community.vo.CommentVO;

public interface CommunityController {
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView communityDetail(@RequestParam Map<String, Object> readArticleMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView communityWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView newArticle(@RequestParam Map<String, Object> newArticleMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteArticle(@RequestParam("articleNo") String articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView modifyArticle(@RequestParam Map<String, Object> modArticleMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView newComment(@RequestParam Map<String, Object> readArticleMap, HttpServletRequest request, HttpServletResponse response) throws Exception; 
	//public ModelAndView modifyComment(@RequestParam("commentVO") CommentVO commentVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteComment(@RequestParam("commentNo") String commentNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
