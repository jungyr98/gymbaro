package com.myspring.gymbaro02.mypage.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.admin.sales.vo.SalesVO;
import com.myspring.gymbaro02.common.base.BaseController;
import com.myspring.gymbaro02.cs.vo.CsVO;
import com.myspring.gymbaro02.gym.vo.GymImageFileVO;
import com.myspring.gymbaro02.gym.vo.GymVO;
import com.myspring.gymbaro02.member.vo.MemberVO;
import com.myspring.gymbaro02.membership.vo.MembershipVO;
import com.myspring.gymbaro02.mypage.service.MypageService;
import com.myspring.gymbaro02.mypage.vo.PointHisVO;
import com.myspring.gymbaro02.order.vo.OrderVO;

@Controller("mypageController")
@RequestMapping(value="/mypage")
public class MypageControllerImpl extends BaseController implements MypageController {
	private static final String CURR_IMAGE_REPO_PATH_GYMS = "C:\\gymbaro_img\\gyms";
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private MypageService myPageService;
	
	// 마이페이지 기본창(내 정보 수정창)
	@Override
	@RequestMapping(value= "/mypage.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		MemberVO _memberVO = myPageService.selectMyInfo(member_id);
		session.setAttribute("memberInfo", _memberVO);
		session.setAttribute("myInfo", _memberVO);
		mav.setViewName(viewName);

		return mav;
	}
	
	// 주문내역 전체 조회
	@Override
	@RequestMapping(value= "/listMyOrderHistory.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, Object> condMap,HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		
		if(session.getAttribute("memberInfo") != null) {
			memberVO = (MemberVO)session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			condMap.put("uid", uid);
		
			List<OrderVO> myOrderList = myPageService.listMyOrderHistory(condMap);
			session.setAttribute("myOrderList", myOrderList);
		}
		
		ModelAndView mav=new ModelAndView();				
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// 주문내역 상세 조회
	@Override
	@RequestMapping(value= "/listMyOrderDetail.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listMyOrderDetail(@RequestParam("order_id") String order_id, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		
		if(session.getAttribute("memberInfo")!=null) {
			memberVO = (MemberVO)session.getAttribute("memberInfo");
			String member_id = memberVO.getMember_id();
			MemberVO _memberVO = myPageService.selectMyInfo(member_id);
			session.setAttribute("myInfo", _memberVO);
		}
		
		List<OrderVO> orderDetailList = myPageService.listMyOrderDetail(order_id);
		session.setAttribute("orderDetailList", orderDetailList);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// 내 포인트 내역 조회
	@Override
	@RequestMapping(value= "/listMyPointHistory.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listMyPointHistory(@RequestParam Map<String, Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		
		if(session.getAttribute("memberInfo") != null) {
			
			memberVO = (MemberVO)session.getAttribute("memberInfo");
			String member_id = memberVO.getMember_id();
			MemberVO _memberVO = myPageService.selectMyInfo(member_id);
			session.setAttribute("myInfo", _memberVO);
			
			memberVO = (MemberVO)session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			condMap.put("uid", uid);
			List<PointHisVO> myPointList = myPageService.listMyPointHistory(condMap);
			session.setAttribute("myPointList", myPointList);
		}
		
		ModelAndView mav=new ModelAndView();

		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// 내 회원권 목록 조회
	@Override
	@RequestMapping(value= "/myMembership.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myMembership(@RequestParam Map<String,Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		
		if(session.getAttribute("memberInfo") != null) {
			MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			condMap.put("uid", uid);
			List<MembershipVO> membershipList = myPageService.listMyMembership(condMap);
			session.setAttribute("membershipList", membershipList);
		}
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// 회원권 예약 내역 상세 조회
	@Override
	@RequestMapping(value= "/listMyMembershipDetail.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listMyMembershipDetail(@RequestParam("membership_id") String membership_id, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		MembershipVO membershipVO = myPageService.listMyMembershipDetail(membership_id);
		session.setAttribute("membershipVO", membershipVO);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// 내 게시물 내역 조회
	@Override
	@RequestMapping(value= "/listMyBoardHistory.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listMyBoardHistory(@RequestParam Map<String, Object> condMap, HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		
		if(session.getAttribute("memberInfo") != null) {
			MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			condMap.put("uid", uid);
			List myBoardItem = myPageService.listMyBoardItem(condMap);		
			String search_type = (String) condMap.get("search_type");
			session.setAttribute("myBoardItem", myBoardItem);
			session.setAttribute("search_type", search_type);
		}
		mav.setViewName(viewName);

		return mav;
	}
	
	// 내 문의내역 조회
	@Override
	@RequestMapping(value= "/listMyCsHistory.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listMyCsHistory(@RequestParam Map<String,Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		if(session.getAttribute("memberInfo") != null) {
			memberVO = (MemberVO)session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			condMap.put("uid", uid);
			List<CsVO> myCsList = myPageService.listMyCsHistory(condMap);
			session.setAttribute("myCsList",myCsList);
		}
		
		mav.setViewName(viewName);

		return mav;
	}
	
	// (시설회원) 내 시설 회원 목록 조회
	@Override
	@RequestMapping(value= "/listMyGymMembership.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listMyGymMembership(@RequestParam Map<String, Object> condMap, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		if(session.getAttribute("memberInfo") != null) {
			memberVO = (MemberVO)session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			condMap.put("uid", uid);
			List<MembershipVO> myGymMemberList = myPageService.listMyGymMembership(condMap);
			session.setAttribute("myGymMemberList", myGymMemberList);
		}
		
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
	
	// 회원탈퇴폼
	@RequestMapping(value= "/outMember.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView outMember(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// (시설회원) 내 시설 조회
	@Override
	@RequestMapping(value= "/myGymInfo.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myGymInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		int uid = memberVO.getUid();
		
		List<GymVO> gymInfo = myPageService.listMyGym(uid);
		session.setAttribute("gymInfo", gymInfo);
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// (시설회원) 내 시설 매출 조회
	@Override
	@RequestMapping(value= "/myGymSales.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myGymSales(@RequestParam Map<String, Object> condMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		if(session.getAttribute("memberInfo") != null) {
			memberVO = (MemberVO)session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			condMap.put("uid", uid);
			Map<String, List<SalesVO>> salesMap = myPageService.myGymSales(condMap);
			session.setAttribute("salesMap", salesMap);
		}
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// (시설회원) 내 시설 등록하기폼
	@Override
	@RequestMapping(value= "/addNewGymForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addNewGymForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// (시설회원) 내 시설 등록하기
	@Override
	@RequestMapping(value= "/addNewGym.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addNewGym(@RequestParam Map<String, Object> gymMap, @RequestParam List<String> service,
			MultipartHttpServletRequest multipartRequest,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = multipartRequest.getSession();
		ModelAndView mav=new ModelAndView();
		String imageFileName=null;
		GymVO gymVO = new GymVO();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		int uid = memberVO.getUid();
		String _service = StringUtils.join(service, ","); // 리스트 쉼표 연결로 문자열로 만들기
		//시설 등록정보 데이터 저장
		if(gymMap.size() != 0) {
			String gym_name = (String) gymMap.get("gym_name");
			String hp = gymMap.get("hp1")+"-"+gymMap.get("hp2")+"-"+gymMap.get("hp3");
			String firstAddress = (String) gymMap.get("firstAddress");
			String extraAddress = (String) gymMap.get("extraAddress");
			String first_option = (String) gymMap.get("first_option");
			String price_info1 = (String) gymMap.get("price_info1");
			String price_info2 = (String) gymMap.get("price_info2");
			String price_info3 = (String) gymMap.get("price_info3");
			String price_info4 = (String) gymMap.get("price_info4");
			String price_info5 = (String) gymMap.get("price_info5");
			String gym_intro = (String) gymMap.get("gym_intro");
			String program_list = (String) gymMap.get("program_list");
			String time_info = (String) gymMap.get("time_info");
			String kakao_addr = (String) gymMap.get("kakao_addr");
			String insta_addr = (String) gymMap.get("insta_addr");
			String fbook_addr = (String) gymMap.get("fbook_addr");
			String nblog_addr = (String) gymMap.get("nblog_addr");
			String home_addr = (String) gymMap.get("home_addr");
			
			gymVO.setGym_name(gym_name);
			gymVO.setHp(hp);
			gymVO.setFirstAddress(firstAddress);
			gymVO.setExtraAddress(extraAddress);
			gymVO.setFirst_option(first_option);
			gymVO.setPrice_info1(Integer.parseInt(price_info1));
			gymVO.setPrice_info2(Integer.parseInt(price_info2));
			gymVO.setPrice_info3(Integer.parseInt(price_info3));
			gymVO.setPrice_info4(Integer.parseInt(price_info4));
			gymVO.setPrice_info5(Integer.parseInt(price_info5));
			gymVO.setGym_intro(gym_intro);
			gymVO.setProgram_list(program_list);
			gymVO.setTime_info(time_info);
			gymVO.setInsta_addr(insta_addr);
			gymVO.setFbook_addr(fbook_addr);
			gymVO.setNblog_addr(nblog_addr);
			gymVO.setHome_addr(home_addr);
			gymVO.setUid(uid);
			gymVO.setService(_service);
			gymVO.setState("신청중");
			gymMap.put("gymVO", gymVO);
		}
		
		// 이미지 데이터 저장 부분
		String main_image = request.getParameter("main_image");
		GymImageFileVO _gymImageVO = new GymImageFileVO();
		_gymImageVO.setUid(uid);
		_gymImageVO.setFileName(main_image);
		_gymImageVO.setFileType("main_image"); // 메인이미지 데이터 저장
				
		
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			gymMap.put(name,value);
		}
		
		
		List<GymImageFileVO> imageFileList = uploadGym(multipartRequest);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(GymImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setUid(uid);
				imageFileVO.setFileType("detail_image");
			}
		}
		imageFileList.add(_gymImageVO);
		gymMap.put("gymImageList", imageFileList);
		
		
		try {
			int gym_id = myPageService.addNewGym(gymMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(GymImageFileVO imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH_GYMS+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH_GYMS+"\\"+gym_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}

		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(GymImageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH_GYMS+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
		}
		
		
		mav.setViewName("redirect:/mypage/myGymInfo.do");

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
