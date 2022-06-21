package com.myspring.gymbaro02.admin.main;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.admin.sales.service.AdminSalesService;
import com.myspring.gymbaro02.admin.sales.vo.SalesVO;


@Controller("adminMainController")
public class AdminMainController {
	@Autowired
	private AdminSalesService adminSalesService;
	
	@RequestMapping(value="/admin/main/main.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session;
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		session.removeAttribute("side_mode");
		session.setAttribute("side_mode", "main");
		
		Map<String, List<SalesVO>> totalMap = adminSalesService.shopGraphData();
		mav.addObject("totalMap", totalMap);
		
		mav.setViewName(viewName);
		return mav;
	}

}
