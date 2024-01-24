package com.kh.auction.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.auction.common.config.Pagination;
import com.kh.auction.user.exception.Exception;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Order;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.service.OrderService;

@Controller
public class OrderAdminController {
	
	@Autowired
	private OrderService oService;
	
	@GetMapping("admOrderList.adod")
	public String goManaOrderList(@RequestParam(value="page", defaultValue="1") int page,
								  Model model) {
		
		int listCount = oService.getListCount();
		PageInfo pi = Pagination.getPageInfo(page, listCount, 8);
		ArrayList<Order> list = oService.selectOrderList(pi);
		
		if(list != null) {
			model.addAttribute("listCount", listCount);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "order/admOrderList";
		} else {
			throw new Exception("주문 목록 조회에 실패하였습니다.");
		}
		
	}
	
	@GetMapping("selectAdmOrderDetail.adod")
	public String selectAdmOrderDetail(@RequestParam("ordNo") String ordNo, Model model,
									   @RequestParam(value="page", defaultValue="1") int page) {
		
		HashMap<String, Object> o = oService.selectAdmOrder(ordNo);
		ArrayList<HashMap<String, Object>> list = oService.selectAdmProduct(ordNo);
		ArrayList<Attachment> aList = oService.selectAttmList();
		
		if(o != null && list != null) {
			model.addAttribute("o", o);
			model.addAttribute("list", list);
			model.addAttribute("aList", aList);
			model.addAttribute("page", page);
			return "order/admOrderDetail";
		} else {
			throw new Exception("주문 상세 조회에 실패하였습니다.");
		}
		
	}
	
	@GetMapping("updateOrderStatus.adod")
	@ResponseBody
	public String updateOrderStatus(@RequestParam("ordNo") String ordNo,
									@RequestParam("ordStatus") String ordStatus) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("ordNo", ordNo);
		map.put("ordStatus", ordStatus);
		
		int result = oService.updateOrderStatus(map);
		
		return result == 1 ? "success" : "fail";
	}
	
	@GetMapping("searchOrder.adod")
	public String searchOrderList(@RequestParam(value="ordStatus", required = false) String ordStatus,
								  @RequestParam(value="category", required = false) String category,
								  @RequestParam(value="keyword", required = false) String keyword,
								  @RequestParam(value="strDate", required = false) String strDate,
								  @RequestParam(value="endDate", required = false) String endDate,
								  @RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(keyword != null) {
			map.put("keyword", keyword.trim());
		}
		
		if (ordStatus != null && !ordStatus.isEmpty()) {
	        map.put("ordStatus", ordStatus);
	    }

	    if (category != null && !category.isEmpty()) {
	        map.put("category", category);
	    }
	    
		map.put("strDate", strDate);
		map.put("endDate", endDate);
		int listCount = oService.getListCount();
		int searchListCount = oService.getSearchAdmListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(page, searchListCount, 9);
		ArrayList<Order> list = oService.searchAdmOrderList(map, pi);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("listCount", listCount);
			model.addAttribute("searchListCount", searchListCount);
			model.addAttribute("list", list);
			model.addAttribute("s", map);
			return "order/admOrderList";
		} else {
			throw new Exception("주문 검색 결과 조회에 실패하였습니다.");
		}
	}
	
	
	

}
