package com.myspring.gymbaro02.gym.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.gym.service.GymService;
import com.myspring.gymbaro02.gym.vo.GymVO;
import com.myspring.gymbaro02.member.vo.MemberVO;

@Controller("gymController")
@RequestMapping(value="/gym")
public class GymControllerImpl implements GymController {
	@Autowired
	private GymService gymService;


	@RequestMapping(value= "/searchGyms.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchGym(@RequestParam(value="limit", defaultValue="9") String limit, @RequestParam Map<String,Object> condMap, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		ModelAndView mav=new ModelAndView();
		Map<String,List<GymVO>> gymMap = new HashMap<String,List<GymVO>>();
		List<GymVO> gymLocationList = new ArrayList<GymVO>();

		if(request.getParameter("update_address") != null) { // 만약 주소를 지도에서 변경했다면 address 변수는 변경된 주소값을 가진다
			String update_address = request.getParameter("update_address");
			session.removeAttribute("address");
			session.setAttribute("address", update_address); // 변경된 주소로 다시 세션에 바인딩
		}
		
		if(request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			condMap.put("keyword", keyword);
		}
		
		condMap.put("limit", Integer.parseInt(limit));
			
		gymMap = gymService.listGym(condMap);
		gymLocationList = gymMap.get("locationList");
		
		if(session.getAttribute("address") != "N/A" && session.getAttribute("address") != null) { // address가 널값이 아니고 위치동의를 했다면
			String user_address = (String) session.getAttribute("address");
			for(int i=0; i < gymLocationList.size(); i++) {
				GymVO gymVO = gymLocationList.get(i);
				String gym_address = gymVO.getExtraAddress();
				String distance = checkDistance(gym_address, user_address, request);
				gymVO.setDistance(Double.parseDouble(distance));
			}
			// 리스트 거리순으로 내림차순 정렬하기
			gymLocationList = gymLocationList.stream().sorted(Comparator.comparing(GymVO::getDistance)).collect(Collectors.toList());
		}

		gymMap.put("locationList", gymLocationList);
		
		session.setAttribute("gymMap", gymMap);
		session.setAttribute("condMap", condMap);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	public String checkDistance(String gym_address, String my_address, HttpServletRequest request) throws Exception {
		String distance="";
		
		//시설 주소 값 위도 경도로 변환
		String _address = URLEncoder.encode(gym_address, "UTF-8");
		String apiURL = "https://maps.googleapis.com/maps/api/geocode/json?sensor=false&language=ko&address="+_address+"&key=AIzaSyCk-KTEGLfLGD3L7w5IdR8-kxKIhrjD-o8";
		String jsonString = new String();
		String buf;
		URL url = new URL(apiURL);
		URLConnection conn = url.openConnection();
		BufferedReader br = new BufferedReader(new InputStreamReader(
				conn.getInputStream(), "UTF-8"));
		while ((buf = br.readLine()) != null) {
			jsonString += buf;
		}
		JSONObject jObj = (JSONObject) JSONValue.parse(jsonString);
		JSONArray jArray = (JSONArray) jObj.get("results");
		if( jArray.size()!=0){
		jObj = (JSONObject) jArray.get(0);
		}
		jObj = (JSONObject) jObj.get("geometry");
		jObj = (JSONObject) jObj.get("location");
		//
		HttpSession session;
		session = request.getSession();
		
		// 사용자 주소 값 위도 경도로 변환
		String user_address = URLEncoder.encode(my_address, "UTF-8");
		String user_apiURL = "https://maps.googleapis.com/maps/api/geocode/json?sensor=false&language=ko&address="+user_address+"&key=AIzaSyCk-KTEGLfLGD3L7w5IdR8-kxKIhrjD-o8";
		String user_jsonString = new String();
		String user_buf;
		URL user_url = new URL(user_apiURL);
		URLConnection user_conn = user_url.openConnection();
		BufferedReader user_br = new BufferedReader(new InputStreamReader(
				user_conn.getInputStream(), "UTF-8"));
		while ((user_buf = user_br.readLine()) != null) {
			user_jsonString += user_buf;
		}
		JSONObject user_jObj = (JSONObject) JSONValue.parse(user_jsonString);
		JSONArray user_jArray = (JSONArray) user_jObj.get("results");
		if( user_jArray.size()!=0){
			user_jObj = (JSONObject) user_jArray.get(0);
		}
		user_jObj = (JSONObject) user_jObj.get("geometry");
		user_jObj = (JSONObject) user_jObj.get("location");
		
		//현재 위치와 시설 주소 거리 계산
		String apiURL2 ="https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&mode=transit&origins="+user_jObj.get("lat")+","+user_jObj.get("lng")+"&destinations="+jObj.get("lat")+","+jObj.get("lng")+"&region=KR&key=AIzaSyCk-KTEGLfLGD3L7w5IdR8-kxKIhrjD-o8";
		String jsonString2 = new String();
		String buf2;
		URL url2 = new URL(apiURL2);
		URLConnection conn2 = url2.openConnection();
		BufferedReader br2 = new BufferedReader(new InputStreamReader(
				conn2.getInputStream(), "UTF-8"));
		while ((buf2 = br2.readLine()) != null) {
			jsonString2 += buf2;
		}
		JSONObject jObj2 = (JSONObject) JSONValue.parse(jsonString2);
		JSONArray jArray2 = (JSONArray) jObj2.get("rows");
		if( jArray2.size()!=0){ 
		jObj2 = (JSONObject) jArray2.get(0);
		}
		jArray2= (JSONArray) jObj2.get("elements");
		jObj2= (JSONObject) jArray2.get(0);
		jObj2 = (JSONObject) jObj2.get("distance");
		distance = jObj2.get("text").toString();
		String[] _distance = distance.split("\\s+");
		distance = _distance[0];
		//
		return distance;
	}
	
	@RequestMapping(value= "/gymsInfo.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView gymsInfo(@RequestParam("gym_id") String gym_id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();				
		ModelAndView mav=new ModelAndView();
		int uid = 0;
		if(session.getAttribute("memberInfo") != null) {
			MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
			uid = memberVO.getUid();
		}
		Map gymMap = gymService.GymDetail(gym_id, uid);
		session.setAttribute("gymMap", gymMap);
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	
	@RequestMapping(value= "/searchMap.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchMap(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
}
