package com.myspring.gymbaro02.liked.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.liked.vo.LikedVO;

public interface LikedController {
	public @ResponseBody String addNewLiked(@RequestParam("gym_id") String gym_id, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	public ModelAndView listMyLiked(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String deleteLikedItem(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
