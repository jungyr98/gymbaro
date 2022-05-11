package com.myspring.gymbaro02.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
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
				/* �α��� �������� �� > mav�� forward: order/orderEachGoods.do��� 
				 * viewName + ���ǿ� ������ logOn���� + memberinfo ��ȯ */
			}else{
				mav.setViewName("redirect:/main/main.do");	
			}
		
		}else{
			String message="���̵� ��й�ȣ�� Ʋ���ϴ�. �ٽ� �α������ּ���";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpServletRequest request) throws Exception {
	System.out.println("#########" + code); //jsp ���� ���� code ����µǳ� Ȯ����
	String access_Token = memberService.getAccessToken(code); //���� ȣ��
	System.out.println("###access_Token#### : " + access_Token); //��ū �� ��� 200�� ���� ����
	//access_token ������ ����� ���� ���
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
			out.println("<script>alert('�������� �ʴ� �̸� �Ǵ� �̸����Դϴ�.');</script>");
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
			out.println("<script>alert('�������� �ʴ� �̸� �Ǵ� ��ȭ��ȣ�Դϴ�.');</script>");
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
			out.write("<script>alert('���̵� üũ ���');</script>");
			out.flush();	
		
			if (pwdFindQ != null && pwdFindA != null) {
				session.setAttribute("member_id", member_id); // �̸� ����Ʈ������ �����ֱ�
				out.write("<script>alert('��й�ȣ ã�� ���� üũ ���');</script>");
				out.flush();
				session.setAttribute("member_id", member_id);
				session.setAttribute("pwdFindQ", pwdFindQ);
				session.setAttribute("pwdFindA", pwdFindA);
				
				mav.setViewName("/member/newPwdForm");
				
		} else {
			out.write("<script>alert('��ȿ�� �˻� ����');</script>");
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
		
		// member_type ����
		if(join_type.equals("common")) {
			_memberVO.setMember_type("�Ϲ�");
		} else if(join_type.equals("gym")) {
			_memberVO.setMember_type("�ü�");
		}
		
		// �޴�����ȣ ������ �߰�
		String phone_number = phoneNumberHyphenAdd(hp);
		_memberVO.setPhone_number(phone_number);
		
		// �̸����� �� ���� �ƴ϶�� if��
		if(!(email1.equals("")) && !(email2.equals(""))) {
			String email = email1 + "@" + email2; // �޾ƿ� �̸��� �� ����
			_memberVO.setEmail(email); 
		}
		
		memberService.addMember(_memberVO);
		
		// ���� value �� ���� ���� �߰�
		String member_id = _memberVO.getMember_id();
		String member_name = _memberVO.getMember_name();
		
		// ȸ������ ���� ȭ�鿡 ���̵�, �̸� �����ֱ�
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
	
	/* �޴��� ���� ��Ʈ�ѷ� */
	@RequestMapping("/check/sendSMS")
    public @ResponseBody String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("������ ��ȣ : " + phoneNumber);
        System.out.println("������ȣ : " + numStr);
        memberService.certifiedPhoneNumber(phoneNumber,numStr);
        return numStr;
    }
	
	// �޴��� ��ȣ ������ �߰� �Լ�
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
	
	//네이버 로그인 콜백
	@RequestMapping(value="/callback.do",  produces = "application/text; charset=utf8")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			  	String clientId = "a8bNpyJD5yF9SyCjSURA";//애플리케이션 클라이언트 아이디값";
			    String clientSecret = "M1589m95FC";//애플리케이션 클라이언트 시크릿값";
			    String code = request.getParameter("code");
			    String state = request.getParameter("state");
			    String redirectURI = URLEncoder.encode("http://localhost:8080/gymbaro02/member/callback.do", "UTF-8");
			    String apiURL;
			    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			    apiURL += "client_id=" + clientId;
			    apiURL += "&client_secret=" + clientSecret;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&code=" + code;
			    apiURL += "&state=" + state;
			    String access_token = "";
			    String refresh_token = "";
			    System.out.println("apiURL="+apiURL);
			    try {
			    	response.setContentType("text/xml;charset=UTF-8");
			        response.setCharacterEncoding("utf-8");
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
			        JSONParser parser = new JSONParser();
			    	Object obj = parser.parse(res.toString());
			    	JSONObject jsonObj = (JSONObject)obj;
			    		        
			    	access_token = (String)jsonObj.get("access_token");
			    	refresh_token = (String)jsonObj.get("refresh_token");
			      }
			    } catch (Exception e) {
			      System.out.println(e);
			    }
			        String token = "AAAANjocFOLJN3fWNmRjbj9svFPSC8R2GIu5yHjBhjoTHz-BB1tsyTtQMwDX509oEOIycxukTFCB3Jh3ycffGLGcsKY";// 네아로 접근 토큰 값";
			        String header = "Bearer " + token; // Bearer 다음에 공백 추가
			        try {
			        	response.setContentType("text/xml;charset=UTF-8");
			            response.setCharacterEncoding("utf-8");
			            String apiurl = "https://openapi.naver.com/v1/nid/me";
			            URL url = new URL(apiurl);
			            HttpURLConnection con = (HttpURLConnection)url.openConnection();
			            con.setRequestMethod("GET");
			            con.setRequestProperty("Authorization", header);
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
			        } catch (Exception e) {
			            System.out.println(e);
			        }
			        
			    }
	}
	

			    	
			    
	
	    
	    
	

