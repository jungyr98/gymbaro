package com.myspring.gymbaro02.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface NoticeController {
	public ModelAndView notice(@RequestParam(value="curPage", defaultValue="1") int curPage, @RequestParam Map<String, Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView newNotice(@RequestParam Map<String, Object> newNoticeMap, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView noticeDetail(@RequestParam Map<String, Object> readNoticeMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteNotice(@RequestParam("noticeNo") String noticeNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
