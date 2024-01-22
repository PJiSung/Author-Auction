package com.kh.auction.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.auction.common.config.Pagination;
import com.kh.auction.user.exception.Exception;
import com.kh.auction.user.model.vo.Consignment;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.SearchConsignment;
import com.kh.auction.user.service.ConsignmentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ConsignmentAdminController {
	
	@Autowired
	private ConsignmentService cService;
	
	private String sortConsignment = null;
	
	// 관리자 리스트 / 기간 + 조건 검색
	@GetMapping("searchList.adco")
	public String searchAdminConsignment(Model model, @RequestParam(value="page", defaultValue="1") int page, SearchConsignment sc) {
		// keyword : 입력한 검색어 / select : select에서 가져오는 기준
		System.out.println(sc);
		
		sc.convertEmptyToNull();
		
		sortConsignment = sc.getStatus();					// 정렬 - 상태	
		
		int listCount = cService.searchCount2(sc);
		int currentPage = page;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Consignment> cList = cService.searchList2(sc, pi);
		ArrayList<HashMap<String, Object>> aList = cService.selectAuctionMList();
		
		if(cList != null) {
			model.addAttribute("total", listCount);
			model.addAttribute("cList", cList);
			model.addAttribute("aList",aList);
			model.addAttribute("pi", pi);
			model.addAttribute("sc", sc);
			model.addAttribute("status", sortConsignment);
			
			return "consignment/conAdminList";
		} else {
			throw new Exception("게시글 검색을 실패하였습니다.");
		}
		
	}
	
	// 상세조회
	@GetMapping("selectUser.adco")
	public String selectUser(@RequestParam("conNo")int conNo,						// 리스트에서 받아와서
							 HttpSession session, Model model) {
	
	
		String isAdmin = ((Member)session.getAttribute("loginUser")).getMemIsAdmin();
		if(isAdmin.equals("Y")) {
			int result = cService.updateConAdmStatus(conNo);		// 관리자 열람 여부
		}
	
		Member m = cService.selectMember(conNo);
		Consignment c = cService.selectUser(conNo);
		ArrayList<Consignment> list = cService.selectAttmUserList(conNo);

		System.out.println(m);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("c", c);
			model.addAttribute("m", m);												// 상세조회로 보내	
			
			return "consignment/conDetail";		
		} else {
			throw new Exception("첨부파일 게시글 상세조회 실패");
		}
	}
	
	// 체크박스 삭제
	@ResponseBody
	@PostMapping("checkDelete.adco")
	public String checkDelete(@RequestParam("deleteIds[]") String[] deleteIds) {
		int result = cService.checkDelete(deleteIds);
		System.out.println(Arrays.toString(deleteIds));
		if(result > 0) {
			return "success"; 
		} else {
			return "fail";
		}
	}
	
	// 경매 등록 수락 / 거부
	@PostMapping("updateConConStatus.adco")
	@ResponseBody
	public String updateConConStatus(@RequestParam("conNo") int conNo, @RequestParam("value") String value) {
		System.out.println(conNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("value", value);
		map.put("conNo", conNo);
		int result = cService.updateConConStatus(map);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}