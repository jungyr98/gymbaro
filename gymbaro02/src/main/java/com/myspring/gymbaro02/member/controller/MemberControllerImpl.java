package com.myspring.gymbaro02.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	@Override
	@RequestMapping(value= "/loginForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(loginMap);
		
		if(memberVO!= null && memberVO.getMember_id()!=null){
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo",memberVO);
			
			String action=(String)session.getAttribute("action");
			if(action!=null && action.equals("/order/orderEachGoods.do")){
				mav.setViewName("forward:"+action);		
				/* 로그인 성공했을 때 > mav에 forward: order/orderEachGoods.do라는 
				 * viewName + 세션에 저장한 logOn상태 + memberinfo 반환 */
			}else{
				mav.setViewName("redirect:/main/main.do");	
			}
		
		}else{
			String message="아이디나 비밀번호가 틀립니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpServletRequest request) throws Exception {
	System.out.println("#########" + code); //jsp 에서 받은 code 잘출력되나 확인함
	String access_Token = memberService.getAccessToken(code); //서비스 호출
	System.out.println("###access_Token#### : " + access_Token); //토큰 값 출력 200이 떠야 정상
	//access_token 보내서 사용자 정보 얻기
	HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
	System.out.println("###access_Token#### : " + access_Token);
	System.out.println("###nickname#### : " + userInfo.get("nickname"));
	System.out.println("###email#### : " + userInfo.get("email"));
	 MemberVO memberVO =new MemberVO();
	 memberVO.setMember_name((String)userInfo.get("nickname"));
	 memberVO.setMember_id((String)userInfo.get("email")); if(memberVO != null && memberVO.getMember_id()!=null) {
	 HttpSession session = request.getSession();
	 session.setAttribute("memberInfo", memberVO);
	 session.setAttribute("isLogOn", true);
	 }
	 return "redirect:/main/main.do";
	}
	
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/idpwdFindForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView idpwdFind(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}

	@Override
	@RequestMapping(value = "/idFindSuccess.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView idFindSuccess(@RequestParam Map<String, String> idByEmailMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();		
		HttpSession session = request.getSession();
		
		String member_name = idByEmailMap.get("member_name");		
		String email = idByEmailMap.get("email");
		String member_id = (String)memberService.idFindSuccess(idByEmailMap); 
		
		if(member_name != null && email != null) {
			
			if (member_id != null) {
			session.setAttribute("member_name", member_name);
			session.setAttribute("member_id", member_id);
			mav.setViewName("/member/idFindSuccess");	
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 이름 또는 이메일입니다.');</script>");
			out.flush();
			mav.setViewName("/member/idpwdFindForm");
		}
	}
		return mav;
}
		
	@Override
	@RequestMapping(value = "/idFindSuccessByNum.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView idFindSuccessByNum(@RequestParam Map<String, String> idByNumMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String member_name = idByNumMap.get("member_name");
		String phone_number = idByNumMap.get("phone_number");  
		
		String hyphenatedNum = phoneNumberHyphenAdd(phone_number);
		idByNumMap.put("phone_number", hyphenatedNum);
		
		String myIdByNum = memberService.idFindSuccessByNum(idByNumMap);
		
		if(member_name != null && phone_number != null) {
			
			if (myIdByNum != null) {
			session.setAttribute("member_name", member_name);
			session.setAttribute("myIdByNum", myIdByNum);
			mav.setViewName("/member/idFindSuccessByNum");	
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 이름 또는 전화번호입니다.');</script>");
			out.flush();
			mav.setViewName("/member/idpwdFindForm");
		}
	}
		return mav;
		
	}
	
	 @Override
	 @RequestMapping(value= "/newPwdForm.do" ,method={RequestMethod.POST,RequestMethod.GET}) 
	 public ModelAndView newPwdForm(@RequestParam Map<String, String> findPwdMap, HttpServletRequest request, HttpServletResponse response) throws Exception { 
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();

		String member_id = findPwdMap.get("member_id");
		String pwdFindQ = findPwdMap.get("pwdFindQ");
		String pwdFindA = findPwdMap.get("pwdFindA");	
		String result = memberService.newPwdForm(findPwdMap);  
		
		if (member_id != null) { 		                             
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write("<script>alert('아이디 체크 통과');</script>");
			out.flush();	
		
			if (pwdFindQ != null && pwdFindA != null) {
				session.setAttribute("member_id", member_id); // 이름 셀렉트용으로 보내주기
				out.write("<script>alert('비밀번호 찾기 질문 체크 통과');</script>");
				out.flush();
				session.setAttribute("member_id", member_id);
				session.setAttribute("pwdFindQ", pwdFindQ);
				session.setAttribute("pwdFindA", pwdFindA);
				
				mav.setViewName("/member/newPwdForm");
				
		} else {
			out.write("<script>alert('유효성 검사 누락');</script>");
			out.flush();
			mav.setViewName("/member/idpwdFindForm");

		}
	}
		
		return mav; 
	}
	
	@Override
	@RequestMapping(value = "/pwdFindSuccess.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView pwdFindSuccess(@RequestParam Map<String, String> pwdMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String member_id = (String)session.getAttribute("member_id");
		pwdMap.put("member_id", member_id);
		
		String newPwd = pwdMap.get("newPwd"); 
		pwdMap.put("newPwd", newPwd);
		 
		String member_name = memberService.pwdFindSuccess(pwdMap);  
		
		session.setAttribute("member_name", member_name);
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value= "/joinTypeForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView joinTypeForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value= "/agreeForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView agreeForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		String join_type = request.getParameter("join_type");
		session.setAttribute("join_type", join_type);
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value= "/userJoinForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView userJoinForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value= "/gymJoinForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView gymJoinForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value= "/addMember.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addMember(@RequestParam("hp") String hp, @RequestParam("email1") String email1, @RequestParam("email2") String email2, 
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
