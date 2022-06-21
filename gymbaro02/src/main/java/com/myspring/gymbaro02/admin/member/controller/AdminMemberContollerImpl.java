package com.myspring.gymbaro02.admin.member.controller;

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

import com.myspring.gymbaro02.admin.member.service.AdminMemberService;
import com.myspring.gymbaro02.member.service.MemberService;
import com.myspring.gymbaro02.member.vo.MemberVO;

@Controller("adminMemberController")
@RequestMapping(value="/admin/member")
public class AdminMemberContollerImpl implements AdminMemberController {
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private AdminMemberService adminMemberService;
	
	
	// 관리자 로그인
	@Override
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, Object> loginMap,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = adminMemberService.adminLogin(loginMap);
		
		if(memberVO!= null && memberVO.getMember_id()!=null){
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo",memberVO);
			mav.setViewName("redirect:/admin/main/main.do");	
		
		}else{
			String message="아이디나 비밀번호가 틀립니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		
		return mav;
	}
	
	// 회원 목록 가져오기
	@Override
	@RequestMapping(value="/selectMemberList.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView selectMemberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		
		List<MemberVO> listMember = new ArrayList<MemberVO>();
		listMember = adminMemberService.listMember(); // 회원 리스트 가져오기
		mav.addObject("listMember", listMember);
		mav.setViewName(viewName);
		return mav;
	}
	
	// 회원 등급 변경하기
	@Override
	@RequestMapping(value="/updateMemberLevel.do", method= {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String updateMemberLevel(@RequestParam Map<String,Object> updateLevelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String message = "updateSuccess";
		adminMemberService.updateMemberLevel(updateLevelMap); // 회원 등급 수정하기 위한 인자 전달
		
		return message;
	}
	
	// 회원 포인트 변경하기
	@Override
	@RequestMapping(value="/updateMemberPoint.do", method= {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String updateMemberPoint(@RequestParam Map<String,Object> updatePointMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		adminMemberService.updateMemberPoint(updatePointMap); // 회원 포인트 수정하기 위한 인자 전달
		message = "updateSuccess";
		return message;
	}
	
	// 회원 삭제하기
	@Override
	@RequestMapping(value="/deleteMember.do", method= {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String deleteMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		
		List<MemberVO> deleteList = new ArrayList<MemberVO>();
		String[] uid = request.getParameterValues("uid");
		
		for(int i=0; i<deleteList.size(); i++) {
			MemberVO memberVO = new MemberVO();
			int _uid = Integer.parseInt(uid[i]);
			memberVO.setUid(_uid);
			deleteList.add(memberVO);
			System.out.println("uid:" + _uid);
		}
		adminMemberService.deleteMember(deleteList); // 회원 삭제하기 위한 고유번호 전달
		message = "delSuccess";
		return message;
	}
	
	// 해당 회원 정보 상세 보기
	@Override
	@RequestMapping(value="/selectMemberDetail.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView selectMemberDetail(@RequestParam("uid") String uid, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		MemberVO memberVO = new MemberVO();
		
		int _uid = Integer.parseInt(uid);
		memberVO = adminMemberService.selectMemberDetail(_uid);
		session.setAttribute("memberVO", memberVO);
		
		mav.setViewName(viewName);
		return mav;
	}

}
