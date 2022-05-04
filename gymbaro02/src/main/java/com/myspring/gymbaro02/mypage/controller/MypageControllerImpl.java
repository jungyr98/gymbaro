package com.myspring.gymbaro02.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.mypage.service.MypageService;

@Controller("mypageController")
@RequestMapping(value="/mypage")
public class MypageControllerImpl implements MypageController {
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private MypageService myPageService;
	
	@RequestMapping(value= "/mypage.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/myPage02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myPage02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/myPage03.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myPage03(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/myPage04.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myPage04(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/myPage05.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myPage05(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/myPage06.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myPage06(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// 내 정보 수정
	@Override
	@RequestMapping(value="/modifyMyInfo.do", method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
            @RequestParam("value")  String value, HttpServletRequest request, HttpServletResponse response)  throws Exception 
	{	
		System.out.println("modifyMyInfo 시작");
		Map<String,String> memberMap=new HashMap<String,String>();
		String val[]=null;
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		
		if(attribute.equals("name")){
			memberMap.put("name", value);
		}else if(attribute.equals("password")) {
			val=value.split(",");
			memberMap.put("member_pwd", val[0]);
			memberMap.put("newPwd", val[1]);
		}
		else if(attribute.equals("phone_number")){
			value = phoneNumberHyphenAdd(value); // 하이픈 넣은 뒤 수정
			memberMap.put("phone_number", value);
		}else if(attribute.equals("email")){
			memberMap.put("email",value);									
		}else if(attribute.equals("address")){
			val=value.split(",");
			memberMap.put("zipcode",val[0]);
			memberMap.put("roadAddress",val[1]);
			//memberMap.put("jibunAddress", val[2]);
			//memberMap.put("namujiAddress", val[3]);
		}else if(attribute.equals("info_yn")){
			memberMap.put("info_yn", value);
		}else {
			memberMap.put(attribute,value);	
		}
		
		System.out.println("attribute:" + attribute + ", value:" + value);
		memberMap.put("member_id", member_id);
		
		memberVO = (MemberVO)myPageService.modifyMyInfo(memberMap);
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);		
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value= "/outMember.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView outMember(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// 휴대폰 번호 하이픈 추가 함수
		public static String phoneNumberHyphenAdd(String num) {

		    String formatNum = "";
		    num = num.replaceAll("-","");
		    
		    if (num.length() == 11) {
		        formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
		    }
		    /* else if(num.length()==8){
		        formatNum = num.replaceAll("(\\d{4})(\\d{4})", "$1-$2");
		    } */
		    
		    return formatNum;
		}
}
