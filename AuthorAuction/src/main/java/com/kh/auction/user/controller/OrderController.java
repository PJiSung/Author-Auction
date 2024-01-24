package com.kh.auction.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.auction.common.config.Pagination;
import com.kh.auction.user.exception.Exception;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Review;
import com.kh.auction.user.service.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	@GetMapping("myOrderList.od")
	public String goMyOrderList(@RequestParam(value="page", defaultValue="1") int page, Model model,
								HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = null;
		if(loginUser != null) {
			id = loginUser.getMemId();
		}
		
		int listCount = oService.getMyListCount(id);
		PageInfo pi = Pagination.getPageInfo(page, listCount, 8);
		ArrayList<HashMap<String, Object>> list = oService.selectMyOrderList(id,pi);
		ArrayList<HashMap<String, Object>> oList = oService.selectMyOrderAllList(id);
		ArrayList<Attachment> aList = oService.selectAttmList();
		
		int[] ordStatusCount = new int[4];
		for(HashMap<String, Object> o : oList) {
			String ordStatus = (String) o.get("ordStatus");
			if(ordStatus.equals("배송준비중")) {
				ordStatusCount[0]++;
			} else if(ordStatus.equals("배송중")) {
				ordStatusCount[1]++;
			} else if(ordStatus.equals("배송완료")) {
				ordStatusCount[2]++;
			} else {
				ordStatusCount[3]++;
			}
		}
		
		if(list != null) {
			model.addAttribute("listCount", listCount);
			model.addAttribute("ordStatusCount", ordStatusCount);
			model.addAttribute("list", list);
			model.addAttribute("aList", aList);
			model.addAttribute("pi", pi);
			return "order/myOrderList";
		} else {
			throw new Exception("주문 목록 조회에 실패하였습니다.");
		}
	}
	
	@PostMapping("cancelOrder.od")
	public String cancelOrder(@RequestParam("ordNo") String ordNo) {
		
		int result = oService.cancelOrder(ordNo);
		
		if(result > 0) {
			return "redirect:myOrderList.od";
		} else {
			throw new Exception("주문 취소에 실패하였습니다.");
		}
	}
	
	@GetMapping("selectOrderDetail.od")
	public String selectAdmOrderDetail(@RequestParam("ordNo") String ordNo,Model model,
									   @RequestParam(value="page", defaultValue="1") int page) {
		
		HashMap<String, Object> o = oService.selectAdmOrder(ordNo);
		ArrayList<HashMap<String, Object>> list = oService.selectAdmProduct(ordNo);
		ArrayList<Attachment> aList = oService.selectAttmList();
		
		if(o != null && list != null) {
			model.addAttribute("o", o);
			model.addAttribute("list", list);
			model.addAttribute("aList", aList);
			model.addAttribute("page", page);
			return "order/myOrderDetail";
		} else {
			throw new Exception("주문 상세 조회에 실패하였습니다.");
		}
	}
	
	@GetMapping("searchOrderList.od")
	public String searchOrderList(@RequestParam(value="category", required = false) String category,
								  @RequestParam(value="keyword", required = false) String keyword,
								  @RequestParam(value="strDate", required = false) String strDate,
								  @RequestParam(value="endDate", required = false) String endDate,
								  @RequestParam(value="page", defaultValue="1") int page, Model model, 
								  HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = null;
		if(loginUser != null) {
			id = loginUser.getMemId();
			map.put("id", id);
		}
		
		if(keyword != null) {
			map.put("keyword", keyword.trim());
		}
		
		map.put("category", category);
		map.put("strDate", strDate);
		map.put("endDate", endDate);
		
		int listCount = oService.getSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(page, listCount, 9);
		ArrayList<HashMap<String, Object>> list = oService.searchOrderList(map, pi);
		ArrayList<Attachment> aList = oService.selectAttmList();
		
		ArrayList<HashMap<String, Object>> oList = oService.selectMyOrderAllList(id);
		int[] ordStatusCount = new int[4];
		for(HashMap<String, Object> o : oList) {
			String ordStatus = (String) o.get("ordStatus");
			if(ordStatus.equals("배송준비중")) {
				ordStatusCount[0]++;
			} else if(ordStatus.equals("배송중")) {
				ordStatusCount[1]++;
			} else if(ordStatus.equals("배송완료")) {
				ordStatusCount[2]++;
			} else {
				ordStatusCount[3]++;
			}
		}
		
		if(list != null) {
			if(!list.isEmpty()) {
				model.addAttribute("pi", pi);
				model.addAttribute("listCount", listCount);
				model.addAttribute("list", list);
				model.addAttribute("aList", aList);
				model.addAttribute("s", map);
				model.addAttribute("ordStatusCount", ordStatusCount);
				return "order/myOrderList";
			} else {
				model.addAttribute("pi", pi);
				return "order/myOrderList";
			}
		} else {
			throw new Exception("주문 검색 결과 조회에 실패하였습니다.");
		}
		
	}

}
