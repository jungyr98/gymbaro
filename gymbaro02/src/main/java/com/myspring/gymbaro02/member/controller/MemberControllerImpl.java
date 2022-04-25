package com.myspring.gymbaro02.member.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.member.service.MemberService;
import com.myspring.gymbaro02.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@RequestMapping(value= "/loginForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/idpwdFindForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView idpwdFind(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/idFindSuccess.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView idFindSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/newPwdForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView newPwdForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/pwdFindSuccess.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView pwdFindSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/join01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView join01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/join02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView join02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		String join_type = request.getParameter("join_type");
		session.setAttribute("join_type", join_type);
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/join03_1.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView join03_1(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/join03_2.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView join03_2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@RequestMapping(value= "/join04.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView join04(@RequestParam("hp") String hp, @RequestParam("email1") String email1, @RequestParam("email2") String email2, 
			@RequestParam("join_type") String join_type, @ModelAttribute("memberVO") MemberVO _memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		
		// member_type 지정
		if(join_type.equals("common")) {
			_memberVO.setMember_type("일반");
		} else if(join_type.equals("gym")) {
			_memberVO.setMember_type("시설");
		}
		
		// 휴대폰번호 하이픈 추가
		String phone_number = phoneNumberHyphenAdd(hp);
		_memberVO.setPhone_number(phone_number);
		
		// 이메일이 널 값이 아니라면 if문
		if(!(email1.equals("")) && !(email2.equals(""))) {
			String email = email1 + "@" + email2; // 받아온 이메일 값 조합
			_memberVO.setEmail(email); 
		}
		
		memberService.addMember(_memberVO);
		
		// 세션 value 에 넣을 변수 추가
		String member_id = _memberVO.getMember_id();
		String member_name = _memberVO.getMember_name();
		
		// 회원가입 성공 화면에 아이디, 이름 보여주기
		session.setAttribute("member_id", member_id);
		session.setAttribute("member_name", member_name);
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	/* 휴대폰 인증 컨트롤러 */
	@RequestMapping("/check/sendSMS")
    public @ResponseBody String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        memberService.certifiedPhoneNumber(phoneNumber,numStr);
        return numStr;
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
