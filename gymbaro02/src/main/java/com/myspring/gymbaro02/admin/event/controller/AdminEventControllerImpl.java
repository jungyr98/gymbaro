package com.myspring.gymbaro02.admin.event.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.admin.event.service.AdminEventService;
import com.myspring.gymbaro02.event.vo.EventVO;

@Controller("adminEventController")
@RequestMapping(value="/admin/event")
public class AdminEventControllerImpl implements AdminEventController {
	@Autowired
	private AdminEventService adminEventService;
	
	// 이벤트 리스트 조회
	@Override
	@RequestMapping(value="/selectEventList.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView selectEventList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		List<EventVO> listEvent = adminEventService.listEvent();
		session.setAttribute("listEvent", listEvent);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// 새 이벤트 추가하기
	@Override
	@RequestMapping(value="/addNewEvent.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/text; charset=utf-8")
	public @ResponseBody String addNewEvent(@RequestParam("event_name") String event_name, @RequestParam("discount") int discount, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		
		EventVO eventVO = new EventVO();
		eventVO.setEvent_name(event_name);
		eventVO.setDiscount(discount);
		
		adminEventService.addNewEvent(eventVO);
		message = "addSuccess";
		
		return message;
	}
	
	// 이벤트 변경하기
	@Override
	@RequestMapping(value="/updateEvent.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/text; charset=utf-8")
	public @ResponseBody String updateEvent(@RequestParam Map<String, Object> updateMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		EventVO eventVO = new EventVO();
		String event_id = (String) updateMap.get("event_id");
		String event_name = (String) updateMap.get("event_name");
		String discount = (String) updateMap.get("discount");
		String discount_update = (String) updateMap.get("discount_update");
		eventVO.setEvent_id(Integer.parseInt(event_id));
		eventVO.setEvent_name(event_name);
		eventVO.setDiscount(Integer.parseInt(discount));
		
		adminEventService.updateEvent(eventVO, discount_update);
		message = "updateSuccess";
		
		return message;
	}
	
	// 이벤트 삭제하기
	@Override
	@RequestMapping(value="/deleteEvent.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/text; charset=utf-8")
	public @ResponseBody String deleteEvent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		
		List<EventVO> eventList = new ArrayList<EventVO>();
		String[] event_id = request.getParameterValues("event_id");
		for(int i=0; i<event_id.length; i++) {
			EventVO eventVO = new EventVO();
			eventVO.setEvent_id(Integer.parseInt(event_id[i]));
			eventList.add(eventVO);
		}
		
		adminEventService.deleteEvent(eventList);
		message = "delSuccess";
		
		return message;
	}
	
}
