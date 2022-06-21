package com.myspring.gymbaro02.admin.event.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface AdminEventController {
	public ModelAndView selectEventList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String addNewEvent(@RequestParam("event_name") String event_name, @RequestParam("discount") int discount, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String updateEvent(@RequestParam Map<String, Object> updateMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String deleteEvent(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
