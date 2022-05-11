package com.myspring.gymbaro02.main.controller;

import java.text.NumberFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.common.GPS.GpsToAddress;

@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController {

	@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	// 뷰에서 받아온 위도 경도 값을 주소로 변환해주는 함수를 호출해서 주소를 세션에 바인딩 시켜주는 함수
	@RequestMapping(value= "/main/ipCheck.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView ipCheck(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();

		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		session.setAttribute("latitude", latitude); // 지도에 데이터로 들어갈 위도값 바인딩
		session.setAttribute("longitude", longitude); // 지도에 데이터로 들어갈 경도값 바인딩
		if(!latitude.equals("N/A")) {
			Double latitude2 = Double.parseDouble(latitude);
			Double longitude2 = Double.parseDouble(longitude);
			GpsToAddress address = new GpsToAddress(latitude2, longitude2); // 주소 변환 함수
			System.out.println("address:" + address.getAddress()); // 주소확인
			session.setAttribute("address", address.getAddress()); // 세션 바인딩
    	}
		
		mav.setViewName("/main/main");
		
		return mav;
	}
}
