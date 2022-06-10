package com.myspring.gymbaro02.cart.controller;

import java.util.ArrayList;
import java.util.HashMap;
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

import com.myspring.gymbaro02.cart.service.CartService;
import com.myspring.gymbaro02.cart.vo.CartVO;
import com.myspring.gymbaro02.goods.vo.GoodsVO;
import com.myspring.gymbaro02.member.vo.MemberVO;


@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl implements CartController {
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private CartService cartService;
	
	@Override
	@RequestMapping(value= "/goodsCart.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		session = request.getSession();
		session.setAttribute("section", 1);
		session.setAttribute("pageNum", 1);
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// 장바구니 담기
	@Override
	@RequestMapping(value="/addGoodsInCart.do", method= RequestMethod.POST,produces="application/text; charset=utf-8")
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goods_id, @RequestParam("goods_qty") int goods_qty, 
			@RequestParam("option_name") String option_name, @RequestParam("add_price") int add_price, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		boolean isAlreadyExisted=false;
		String message = "";
		
		if(session.getAttribute("memberInfo") != null) {
			memberVO = (MemberVO)session.getAttribute("memberInfo");
			int uid = memberVO.getUid();
			System.out.println("test: " + option_name);
			cartVO.setUid(uid);
			cartVO.setGoods_id(goods_id);
			cartVO.setGoods_qty(goods_qty);
			cartVO.setOption_name(option_name);
			cartVO.setAdd_price(add_price);
			System.out.println(cartVO.getOption_name());
			isAlreadyExisted = cartService.findCartGoods(cartVO); //占쏙옙품占쏙옙호占쏙옙 占쏙옙袂占쏙옙臼占� 占쌍댐옙占쏙옙 占쏙옙회
			System.out.println("isAlreadyExisted: " + isAlreadyExisted);
			
			if(isAlreadyExisted==true) {
				message = "already_existed";
			}else {
				cartService.addGoodsInCart(cartVO);
				message = "add_success";
			}
		}else {
			if(session.getAttribute("non_cartMap") == null) {
				Map<String,List> non_cartMap = new HashMap<String,List>();
				List<CartVO> myCartList = new ArrayList<CartVO>();
				CartVO cartVO = new CartVO();
				cartVO.setGoods_id(goods_id);
				cartVO.setGoods_qty(goods_qty);
				cartVO.setOption_name(option_name);
				cartVO.setAdd_price(add_price);
				System.out.println("add cartVO : " + cartVO.getGoods_id() + ", " + cartVO.getOption_name());
				myCartList.add(cartVO);
				non_cartMap.put("myCartList", myCartList);
				session.setAttribute("non_cartMap", non_cartMap);
				message = "add_success";
			}else if(session.getAttribute("non_cartMap") != null) {
				Map<String,List> non_cartMap = (Map<String, List>) session.getAttribute("non_cartMap");
				List<CartVO> myCartList = non_cartMap.get("myCartList");
				for(int i=0; i<myCartList.size(); i++) {
					CartVO _cartVO = myCartList.get(i);
					if(_cartVO.getOption_name().equals(option_name)) {
						isAlreadyExisted = true;
						break;
					}					
				}
				if(isAlreadyExisted==true) {
					message = "already_existed";
				}else {
					CartVO cartVO = new CartVO();
					cartVO.setGoods_id(goods_id);
					cartVO.setGoods_qty(goods_qty);
					cartVO.setOption_name(option_name);
					cartVO.setAdd_price(add_price);
					myCartList.add(cartVO);
					non_cartMap.put("myCartList", myCartList);
					session.setAttribute("non_cartMap", non_cartMap);
					message = "add_success";
				}
			}
		}
		
		return message;
		
	}
	
	// 내 장바구니 리스트 조회
	@Override
	@RequestMapping(value="/myCartList.do", method=RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		if(session.getAttribute("memberInfo") != null) {
			MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
	
			int uid = memberVO.getUid();
			cartVO.setUid(uid);
			Map<String,List> cartMap = cartService.myCartList(cartVO);
			session.setAttribute("cartMap", cartMap);
		}else {
			if(session.getAttribute("non_cartMap") == null) {
				System.out.println("non_cartMap == null 진입");
				Map<String,List> non_cartMap = new HashMap<String,List>();
				List<CartVO> myCartList = new ArrayList<CartVO>();
				List<GoodsVO> myGoodsList = new ArrayList<GoodsVO>();
				non_cartMap.put("myCartList", myCartList);
				non_cartMap.put("myGoodsList", myGoodsList);
				session.setAttribute("non_cartMap", non_cartMap);
			}else {
				System.out.println("non_cartMap != null 진입");
				Map<String,List> non_cartMap = (Map<String, List>) session.getAttribute("non_cartMap");
				List<CartVO> myCartList = non_cartMap.get("myCartList");
				List<GoodsVO> myGoodsList = cartService.nonCartList(myCartList);
				non_cartMap.put("myGoodsList", myGoodsList);
				session.setAttribute("non_cartMap", non_cartMap);
			}
		}
		return mav;
		
	}
	
	
	// 장바구니 상품 수량 수정하기
	@Override
	@RequestMapping(value="/modifyCartQty.do" ,method = RequestMethod.POST)
	public @ResponseBody String modifyCartQty(@RequestParam("cart_id") int cart_id, 
			@RequestParam("cart_goods_qty") int cart_goods_qty, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		boolean result = false;
		
		if(session.getAttribute("memberInfo")!=null) {
			memberVO=(MemberVO)session.getAttribute("memberInfo");
			int uid=memberVO.getUid();
			cartVO.setCart_id(cart_id);
			cartVO.setUid(uid);
			cartVO.setGoods_qty(cart_goods_qty);
			result = cartService.modifyCartQty(cartVO);
		}else {
			if(session.getAttribute("non_cartMap")!=null) { // 비회원이라면 해당 인덱스(cart_id) vo의 수량을 변경한 값으로 set 해준다
				Map<String,List> non_cartMap = (Map<String, List>) session.getAttribute("non_cartMap");
				List<CartVO> myCartList = non_cartMap.get("myCartList");
				myCartList.get(cart_id).setGoods_qty(cart_goods_qty);
				non_cartMap.put("myCartList", myCartList);
				session.setAttribute("non_cartMap", non_cartMap); // 수량 변경 후 장바구니 데이터를 다시 세션에 바인딩 하기
				result = true;
			}
		}
		
		if(result==true){
		   return "modify_success";
		}else{
			  return "modify_failed";	
		}
		
	}
	
	// 장바구니에서 상품 삭제하기
	@RequestMapping(value="/removeCartGoods.do" ,method = RequestMethod.POST)
	public ModelAndView removeCartGoods(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("memberInfo")!=null) { // 회원이라면 db에서 해당 카트 ID를 가진 튜플을 삭제한다
			List<CartVO> deleteList = new ArrayList<CartVO>();
			String[] cart_id = request.getParameterValues("cart_id");
			for(int i=0; i<cart_id.length; i++) {
				CartVO _cartVO = new CartVO();
				int _cart_id = Integer.parseInt(cart_id[i]);
				_cartVO.setCart_id(_cart_id);
				deleteList.add(_cartVO);
			}		
			cartService.removeCartGoods(deleteList);
		}else {
			if(session.getAttribute("non_cartMap")!=null) { // 비회원이라면 해당 데이터 인덱스를 리스트에서 제거하고, 다시 세션에 바인딩 해준다
				Map<String,List> non_cartMap = (Map<String, List>) session.getAttribute("non_cartMap");
				List<CartVO> myCartList = non_cartMap.get("myCartList");
				String[] cart_id = request.getParameterValues("cart_id"); // 리스트의 인덱스값으로 지정해뒀던 값 가져오기
				for(int i=0; i<cart_id.length; i++) {
					int cnt = Integer.parseInt(cart_id[i]);
					if(cnt!=0 && i!=0) {
						myCartList.remove(cnt-1); // 여러개를 삭제할 때, 하나씩 remove 될 때마다 리스트의 인덱스는 갱신이 되므로, 삭제할 데이터가 두개 이상이라면 인덱스-1을 해준다.
					}else {
						myCartList.remove(cnt); // 하나만 삭제한다면 가져온 인덱스 값을 그대로 remove 해준다.
					}
				}
				non_cartMap.put("myCartList", myCartList);
				session.setAttribute("non_cartMap", non_cartMap); // 갱신된 장바구니 데이터를 다시 세션에 바인딩 해준다.
			}
		}
		mav.setViewName("redirect:/cart/myCartList.do");
		return mav;
	}
	
}
