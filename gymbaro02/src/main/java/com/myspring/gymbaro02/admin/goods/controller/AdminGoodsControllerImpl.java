package com.myspring.gymbaro02.admin.goods.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.gymbaro02.admin.goods.service.AdminGoodsService;
import com.myspring.gymbaro02.common.base.BaseController;
import com.myspring.gymbaro02.event.vo.EventVO;
import com.myspring.gymbaro02.goods.vo.GoodsImageFileVO;
import com.myspring.gymbaro02.goods.vo.GoodsOptionVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;

@Controller("adminGoodsController")
@RequestMapping(value="/admin/goods")
public class AdminGoodsControllerImpl extends BaseController implements AdminGoodsController {
	private static final String CURR_IMAGE_REPO_PATH_GOODS = "C:\\gymbaro_img\\goods";
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	// 상품 리스트 조회
	@Override
	@RequestMapping(value="/selectGoodsList.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView selectGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session;
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		List<GoodsVO> listGoods = adminGoodsService.selectGoodsList();
		session.setAttribute("listGoods", listGoods);
		List<EventVO> listEvent = adminGoodsService.selectEventList();
		session.setAttribute("listEvent", listEvent);
		
		session.removeAttribute("side_mode");
		session.setAttribute("side_mode", "goods");
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// 상품 상세 정보 조회
	@Override
	@RequestMapping(value="/updateGoodsForm.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateGoodsForm(@RequestParam("goods_id") String goods_id, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		HttpSession session;
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		Map<String, Object> goodsMap = adminGoodsService.detailGoodsInfo(Integer.parseInt(goods_id));
		session.setAttribute("goodsMap", goodsMap);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// 상품 등록페이지 이동
	@Override
	@RequestMapping(value="/addNewGoodsForm.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView addNewGoodsForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 새상품 등록하기
	@Override
	@RequestMapping(value="/addNewGoods.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView addNewGoods(@RequestParam Map<String,Object> goodsMap, MultipartHttpServletRequest multipartRequest, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String imageFileName=null;
		
		// 상품 정보 vo
		int uid = Integer.parseInt((String)goodsMap.get("uid"));
		GoodsVO goodsVO = new GoodsVO();
		goodsVO.setGoods_name((String)goodsMap.get("goods_name"));
		goodsVO.setGoods_price(Integer.parseInt((String)goodsMap.get("goods_price")));
		goodsVO.setGoods_amount(Integer.parseInt((String)goodsMap.get("goods_amount")));
		goodsVO.setGoods_main_category((String)goodsMap.get("goods_main_category"));
		goodsVO.setGoods_sub_category((String)goodsMap.get("goods_sub_category"));
		goodsVO.setGoods_state((String)goodsMap.get("goods_state"));
		goodsVO.setUid(uid);
		goodsMap.put("goodsVO", goodsVO);
		
		// 상품 옵션 vo
		List<GoodsOptionVO> goodsOptionList = new ArrayList<GoodsOptionVO>(); // vo 객체 담을 리스트
		String[] option_name = request.getParameterValues("option_name");
		String[] price = request.getParameterValues("price");
		
		for(int i=0; i<option_name.length; i++) {
			GoodsOptionVO goodsOptionVO = new GoodsOptionVO(); // vo 객체
			goodsOptionVO.setOption_name(option_name[i]);
			goodsOptionVO.setPrice(Integer.parseInt(price[i]));
			goodsOptionList.add(goodsOptionVO);
		}
		
		goodsMap.put("goodsOptionList", goodsOptionList);
		
		// 이미지 등록
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}		
		
		List<GoodsImageFileVO> imageFileList = upload(multipartRequest);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(GoodsImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setUid(uid);
			}
		}
		
		goodsMap.put("goodsImageList", imageFileList);		
		
		try {
			int goods_id = adminGoodsService.addNewGoods(goodsMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(GoodsImageFileVO imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH_GOODS+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH_GOODS+"\\"+goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}

		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(GoodsImageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH_GOODS+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
		}
		
		mav.setViewName("redirect:/admin/goods/selectGoodsList.do");
		return mav;
	}
	
	// 상품 상태 변경
	@Override
	@RequestMapping(value="/updateGoodsState.do", method={RequestMethod.POST, RequestMethod.GET})
	public void updateGoodsState(@RequestParam Map<String,Object> updateGoodsMap, HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		adminGoodsService.updateGoodsState(updateGoodsMap);
	}
	
	// 상품 삭제
	@Override
	@RequestMapping(value="/deleteGoods.do", method={RequestMethod.POST, RequestMethod.GET})
	public void deleteGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<GoodsVO> deleteList = new ArrayList<GoodsVO>();
		String[] goods_id = request.getParameterValues("goods_id");
		for(int i=0; i<goods_id.length; i++) {
			GoodsVO goodsVO = new GoodsVO();
			int _goods_id = Integer.parseInt(goods_id[i]);
			goodsVO.setGoods_id(_goods_id);
			deleteList.add(goodsVO);
		}
		adminGoodsService.deleteGoods(deleteList);
	}
	
	@Override
	@RequestMapping(value="/modifyGoodsInfo.do", method={RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity modifyGoodsInfo(@RequestParam("attribute") String attribute, @RequestParam("value") String value,
			@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> goodsMap = new HashMap<String, Object>();
		goodsMap.put("goods_id", goods_id);
		System.out.println(goods_id + ", " + attribute + ", " + value);
		
		if(attribute.equals("goods_name")) {
			goodsMap.put("goods_name", value);
		}else if(attribute.equals("goods_price")) {
			goodsMap.put("goods_price", Integer.parseInt(value)); // 컬럼 데이터 타입이 int 이기 때문에 형변환
		}else if(attribute.equals("goods_amount")) {
			goodsMap.put("goods_amount", Integer.parseInt(value)); // 컬럼 데이터 타입이 int 이기 때문에 형변환
		}else if(attribute.equals("goods_category")) {
			String[] category = value.split(",");
			String goods_main_category = category[0];
			String goods_sub_category = category[1];
			goodsMap.put("goods_main_category", goods_main_category);
			goodsMap.put("goods_sub_category", goods_sub_category);
		}else {
			goodsMap.put(attribute, value);
		}
		
		adminGoodsService.modifyGoodsInfo(goodsMap);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		
		return resEntity;
	}
	
	// 상품 수정창에서 옵션 추가하기
	@Override
	@RequestMapping(value="/addGoodsOption.do", method={RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity addGoodsOption(@RequestParam("goods_id") String goods_id, @RequestParam("value") String value, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		GoodsOptionVO goodsOptionVO = new GoodsOptionVO();
		
		goodsOptionVO.setGoods_id(Integer.parseInt(goods_id));
		String[] option = value.split(",");
		goodsOptionVO.setOption_name(option[0]);
		goodsOptionVO.setPrice(Integer.parseInt(option[1]));
		
		adminGoodsService.addGoodsOption(goodsOptionVO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "add_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		
		return resEntity;
	}
	
	// 상품 옵션 수정하기
	@Override
	@RequestMapping(value="/modifyOption.do", method={RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity modifyOption(@RequestParam("option_id") String option_id, @RequestParam("value") String value, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		GoodsOptionVO goodsOptionVO = new GoodsOptionVO();
		
		goodsOptionVO.setOption_id(Integer.parseInt(option_id));
		String[] option = value.split(",");
		goodsOptionVO.setOption_name(option[0]);
		goodsOptionVO.setPrice(Integer.parseInt(option[1]));
		
		adminGoodsService.modifyOption(goodsOptionVO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		
		return resEntity;
		
	}
	
	// 상품 이미지 수정하기
	@Override
	@RequestMapping(value="/modifyGoodsImage.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateGoodsImage(@RequestParam Map<String,Object> imageMap, MultipartHttpServletRequest multipartRequest, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String imageFileName=null;
		String old_fileName = (String) imageMap.get("old_fileName");
		String goods_id = (String) imageMap.get("img_goods_id");
		
		
		List<GoodsImageFileVO> imageFileList = upload(multipartRequest);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(GoodsImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setGoods_id(Integer.parseInt(goods_id));
			}
		}
		GoodsImageFileVO goodsImageFileVO = imageFileList.get(0);
		adminGoodsService.modifyGoodsImage(goodsImageFileVO);
		
		// 기존 이미지 파일에서 삭제하기
		if(old_fileName != null) {
			try{
				File srcFile = new File(CURR_IMAGE_REPO_PATH_GOODS+"\\"+goods_id+"\\"+old_fileName);
				srcFile.delete();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//
		
		// 수정한 이미지 파일 업로드하기
		try {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(GoodsImageFileVO imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH_GOODS+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH_GOODS+"\\"+goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}

		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(GoodsImageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH_GOODS+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
		}

		mav.setViewName("redirect:/admin/goods/updateGoodsForm.do?goods_id="+goods_id);
		return mav;
	}
	
	
	// 상품 옵션 삭제하기
	@Override
	@RequestMapping(value="/deleteOption.do", method={RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity deleteOption(@RequestParam("option_id") String option_id, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		adminGoodsService.deleteOption(Integer.parseInt(option_id));
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "del_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		
		return resEntity;
	}
	
	// 상품 이벤트 적용하기
	@Override
	@RequestMapping(value="/updateGoodsEvent.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/text; charset=utf-8")
	public @ResponseBody String updateGoodsEvent(@RequestParam("event_id") int event_id, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		String message = "";
		Map<String, Object> updateGoodsMap = new HashMap<String, Object>();
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();

		String[] goods_id = request.getParameterValues("goods_id");
		for(int i=0; i<goods_id.length; i++) {
			GoodsVO goodsVO = new GoodsVO();
			goodsVO.setGoods_id(Integer.parseInt(goods_id[i]));
			System.out.println("for문 테스트 : " + goodsVO.getGoods_id());
			goodsList.add(goodsVO);
		}
		
		updateGoodsMap.put("event_id", event_id);
		updateGoodsMap.put("goodsList", goodsList);		
		adminGoodsService.updateGoodsEvent(updateGoodsMap);
		message = "modify_success";
		
		return message;
	}
	
	// 상품 이벤트 적용 취소하기
	@Override
	@RequestMapping(value="/deleteGoodsEvent.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/text; charset=utf-8")
	public @ResponseBody String deleteGoodsEvent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = "";
		List<GoodsVO> deleteList = new ArrayList<GoodsVO>();

		String[] goods_id = request.getParameterValues("goods_id");
		for(int i=0; i<goods_id.length; i++) {
			GoodsVO goodsVO = new GoodsVO();
			goodsVO.setGoods_id(Integer.parseInt(goods_id[i]));
			deleteList.add(goodsVO);
		}
	
		adminGoodsService.deleteGoodsEvent(deleteList);
		message = "modify_success";
		
		return message;
	}
}
