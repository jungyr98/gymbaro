package com.myspring.gymbaro02.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.myspring.gymbaro02.member.dto.KakaoDTO;
import com.myspring.gymbaro02.member.service.MemberService;
import com.myspring.gymbaro02.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private HttpSession session;
	
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
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);
		String access_Token = memberService.getAccessToken(code);
	    
		// userInfo의 타입을 KakaoDTO로 변경 및 import.
		KakaoDTO userInfo = memberService.getUserInfo(access_Token);
	    
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.getK_name());
		System.out.println("###email#### : " + userInfo.getK_email());
		
		session.invalidate();
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("kakaoN", userInfo.getK_name());
		session.setAttribute("kakaoE", userInfo.getK_email());
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
		MemberVO memberVO =new MemberVO();
		 memberVO.setMember_name(userInfo.getK_name());
		 memberVO.setMember_id(userInfo.getK_email());

		if(memberVO != null && memberVO.getMember_id()!=null) {
			
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
	
	// 네이버 로그인
	@Override
	@RequestMapping(value="/callback.do",  produces = "application/text; charset=utf8", method=RequestMethod.GET)
	public String callback(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			  	String clientId = "a8bNpyJD5yF9SyCjSURA";//애플리케이션 클라이언트 아이디값";
			    String clientSecret = "M1589m95FC";//애플리케이션 클라이언트 시크릿값";
			    String code = request.getParameter("code"); //네이버 로그인 인증에 성공하면 반환받는 인증 코드, 접근 토큰(access token) 발급에 사용
			    String state = request.getParameter("state"); //사이트 간 요청 위조(cross-site request forgery) 공격을 방지하기 위해 애플리케이션에서 생성한 상태 토큰값으로 URL 인코딩을 적용한 값을 사용
			    String redirectURI = URLEncoder.encode("http://localhost:8080/gymbaro02/member/callback.do", "UTF-8"); //로그인 성공 후 값을 갖고 넘어가는 url
			    String apiURL;
			    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			    apiURL += "client_id=" + clientId;
			    apiURL += "&client_secret=" + clientSecret;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&code=" + code;
			    apiURL += "&state=" + state;
			    String access_token = ""; //string형으로 초기화. 사용자 정보에 접근하려면 필요한 토큰
			    String refresh_token = ""; //나중에 이용
			    System.out.println("apiURL="+apiURL);
			    try {
			      URL url = new URL(apiURL);
			      HttpURLConnection con = (HttpURLConnection)url.openConnection();
			      con.setRequestMethod("GET");
			      int responseCode = con.getResponseCode();
			      BufferedReader br;
			      System.out.print("responseCode="+responseCode);
			      if(responseCode==200) { // 정상 호출
			        br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			      } else {  // 에러 발생
			        br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
			      }
			      String inputLine;
			      StringBuffer res = new StringBuffer();
			      while ((inputLine = br.readLine()) != null) {
			        res.append(inputLine);
			      }
			      br.close();
			      if(responseCode==200) {
			    	  System.out.println(" if(responseCode==200)문 진입");
			        System.out.println(res.toString());
			        //json인 token을 string형식으로 받아야하기 때문에 jsonparser을 이용해 object로 바꾼후 다시 jsonobject로 가져옴
			        JSONParser parser = new JSONParser();
			    	Object obj = parser.parse(res.toString());
			    	JSONObject jsonObj = (JSONObject)obj;
			    		        
			    	access_token = (String)jsonObj.get("access_token");
			    	refresh_token = (String)jsonObj.get("refresh_token");
			      }//response 리다이렉트하는 페이지에서 토큰값 추출
			    } catch (Exception e) {
			      System.out.println(e);
			    }
			        String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
			        //토큰을 이용해 url을 생성하는 코드.값 잘못 받으면 에러남.
			        try {
			            String apiurl = "https://openapi.naver.com/v1/nid/me";
			            URL url = new URL(apiurl);
			            HttpURLConnection con = (HttpURLConnection)url.openConnection();
			            con.setRequestMethod("GET");
			            con.setRequestProperty("Authorization", header); //접근 토큰(access token)을 전달하는 헤더. 토큰 타입은 "Bearer"로 값이 고정.Authorization: {토큰 타입] {접근 토큰]
			            int responseCode = con.getResponseCode();
			            BufferedReader br;
			            if(responseCode==200) { // 정상 호출
			                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			            } else {  // 에러 발생
			                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
			            }
			            String inputLine;
			            StringBuffer res = new StringBuffer();
			            while ((inputLine = br.readLine()) != null) {
			                res.append(inputLine);
			            }
			            br.close();
			            JSONParser parser = new JSONParser();
			    		Object obj = parser.parse(res.toString());
			    		JSONObject jsonObj = (JSONObject)obj;
			    		JSONObject resObj = (JSONObject)jsonObj.get("response");
			            System.out.println(res.toString());
			            //db에 넣을때 사용하는 값으로 get() 안에 있는 값은 네이버에서 지정해놓은것이라 수정x
			            //사용자가 네이버 자체에 정보제공을 동의하지 않은 값은 가져올 수 없음.
			            String naverId = (String)resObj.get("id"); //동일인 식별 정보.네이버 아이디마다 고유하게 발급되는 유니크한 일련번호 값
			            //API 호출 결과로 네이버 아이디값은 제공하지 않으며, 대신 'id'라는 애플리케이션당 유니크한 일련번호값을 이용해서 자체적으로 회원정보를 구성해야함
			            String email = (String)resObj.get("email"); //기본적으로 네이버 내정보에 등록되어 있는 '기본 이메일' 즉 네이버ID@naver.com 값이나, 사용자가 다른 외부메일로 변경했을 경우는 변경된 이메일 주소로 됩니다.
			            String name = (String)resObj.get("name");//사용자 이름
			            String nickName = (String)resObj.get("nickname"); //별명이 설정되어 있지 않으면 id*** 형태로 리턴
			            String gender = (String)resObj.get("gender"); //- F: 여성,- M: 남성, - U: 확인불가
			            String age = (String)resObj.get("age"); //사용자 연령대
			            String birthday = (String)resObj.get("birthday"); //사용자 생일(MM-DD 형식)
			            String birthyear = (String)resObj.get("birthyear"); //출생연도
			            String mobile = (String)resObj.get("mobile"); //휴대전화번호
			            
			            ObjectMapper objectMapper = new ObjectMapper();
			            Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(res.toString(), Map.class).get("response");
			            //위에서 받은 json값은 string형으로 받아져 출력하면 한글이 유니코드로 깨져서 나옴.
			            //따라서 해당 string을 json으로 받아 map으로 변환. response를 apijson에 map으로 저장
			            System.out.println(apiJson);
			        	
			            MemberVO memberVO = new MemberVO();
			            memberVO.setMember_id(email);
			            memberVO.setMember_name(name);
			            if(memberVO != null && memberVO.getMember_id()!=null) {
			            	HttpSession session = request.getSession();
			            	session.setAttribute("memberInfo", memberVO);
			            	session.setAttribute("isLogOn", true);
			            }
			            
			        } catch (Exception e) {
			            System.out.println(e);
			        }
					return "redirect:/main/main.do"; 
			        
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
