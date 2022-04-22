package com.myspring.gymbaro02.common.error;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class ErrorController {
	
	private static Logger LOGGER = LoggerFactory.getLogger(ErrorController.class);
	
	@RequestMapping("/error/error_404.do")
	public String Error404(HttpServletResponse res, Model model) {
		//LOGGER.warn("ERROR 404 PAGE");
		model.addAttribute("code", "ERROR_404");
		return "ERROR/404";
	}
	
	@RequestMapping("/error/error_500.do")
	public String Error500(HttpServletResponse res, Model model) {
		//LOGGER.warn("ERROR 500 PAGE");
		model.addAttribute("code", "ERROR_500");
		return "Error/500";
	}
}
