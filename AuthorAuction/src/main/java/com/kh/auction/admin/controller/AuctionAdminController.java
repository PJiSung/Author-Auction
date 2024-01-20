package com.kh.auction.admin.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.auction.common.config.Pagination;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Auction;
import com.kh.auction.user.model.vo.Consignment;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Product;
import com.kh.auction.user.service.AuctionService;

@Controller
public class AuctionAdminController {
	
	@Autowired
	private AuctionService aService;
	
	@GetMapping("adminInquiry.adac")
	public String moveToAdminInquiry(@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="sort", required=false) String sort, Model model) {
		
		int allOngingAuctionNum = aService.getAllOngingAuctionNum();
		
		PageInfo pi = Pagination.getPageInfo(page, allOngingAuctionNum, 10);
		
		//관리자 조회 페이지 접근시 기본적으로 진행중인 경매만 보이도록 설정
		ArrayList<Auction> auctionList = aService.getAllAuction(sort, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("aList", auctionList);
		model.addAttribute("total", allOngingAuctionNum);
		
		return "/auction/adminInquiry";
	}
	
	@GetMapping("search.adac")
	public String searchAuction(@RequestParam(value="search") String search,
								@RequestParam(value="content", required=false) String content,
								@RequestParam(value="scheduled", required=false) String scheduled,
								@RequestParam(value="ongoing", required=false) String ongoing,
								@RequestParam(value="end", required=false) String end,
								@RequestParam(value="aucSS", required=false) String aucSS,
								@RequestParam(value="aucSE", required=false) String aucSE,
								@RequestParam(value="aucFS", required=false) String aucFS,
								@RequestParam(value="aucFE", required=false) String aucFE,
								@RequestParam(value="sort", required=false) String sort,
								@RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		HashMap<String, String> hm = new HashMap<>();
		
		if(scheduled != null) {
			hm.put("scheduled", scheduled);
			model.addAttribute("scheduled", scheduled);
		}
		
		if(ongoing != null) {
			hm.put("ongoing", ongoing);
			model.addAttribute("ongoing", ongoing);
		}
		
		if(end != null) {
			hm.put("end", end);
			model.addAttribute("end", end);
		}
		
		if(!aucSS.equals("")) {
			hm.put("aucSS", aucSS + " 00:00:00");
			model.addAttribute("aucSS", aucSS);
		}
		
		if(!aucSE.equals("")) {
			hm.put("aucSE", aucSE + " 23:59:59");
			model.addAttribute("aucSE", aucSE);
			
		}
		
		if(!aucFS.equals("")) {
			hm.put("aucFS", aucFS + " 00:00:00");
			model.addAttribute("aucFS", aucFS);
			
		}
		
		if(!aucFE.equals("")) {
			hm.put("aucFE", aucFE + " 23:59:59");
			model.addAttribute("aucFE", aucFE);
		}
		
		if(sort != null) {
			hm.put("sort", sort);
			model.addAttribute("sort", sort);
		}
		
		hm.put("search", search);
		hm.put("content", content);
		
		//관리자 - hashmap을 이용해 진행여부, 내용에 대한 경매들의  수를 들고옴
		int auctionList = aService.getAdminSearchListCount(hm);
		
		PageInfo pi = Pagination.getPageInfo(page, auctionList, 10);
		
		//관리자 - hashmap을 이용해 진행여부, 내용에 대한 경매들을 들고옴
		ArrayList<Auction> aList = aService.getAdminSearchList(hm, pi);
		
		model.addAttribute("aList", aList);
		model.addAttribute("total", auctionList);
		model.addAttribute("pi", pi);
		
		model.addAttribute("search", search);
		model.addAttribute("content", content);
		
		return "/auction/adminInquiry";
		
	}
	
	@ResponseBody
	@PostMapping("getConsignmentInfo.adac")
	public HashMap<String, Object> getConsignmentInfo(@RequestParam("conNo") int conNo) {
		
		HashMap<String, Object> hm = new HashMap<>(); 
		
		aService.updateApproval(conNo);
		
		Consignment consignment = aService.getConsignmentInfo(conNo);
		ArrayList<Attachment> attachment = aService.getAttachment(conNo);
		
		Gson gson = new Gson();
		
		String consignmentJson = gson.toJson(consignment);
		String attachmentJson = gson.toJson(attachment);
		
		hm.put("consignment", consignmentJson);
		hm.put("attachmentList", attachmentJson);
		
		return hm;
	}
	
	@GetMapping("enrollAuction.adac")
	public String moveToEnrollAuction() {
		return "/auction/enrollAuction";
	}
	
	@ResponseBody
	@PostMapping("insertAuction.adac")
	public String insertAuction(@ModelAttribute Auction auction, Model model) {
		//문의 글 번호로 경매 등록 - 경매가 아직 등록이 안되어 있기 때문에 경매 번호에 문의 글 번호 담음
		auction.setAucStartDate(auction.getAucStartDate() +" 00:00:00");
		auction.setAucFinishDate(auction.getAucFinishDate() + " 23:59:59");
		
		int result = aService.insertAuction(auction);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@GetMapping("adminMain.adac")
	public String moveToAdminMain(Model model) {
		List<String> loginUsers = null;
		try {
			loginUsers = getLogData();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//금액 높은 경매들을 들고옴
		ArrayList<Auction> aList = aService.getTopAuction();
		
		//읽지않은 신규 등록 문의글을 들고옴
		ArrayList<Consignment> cList = aService.getNoReadCon();
		
		//가장 많이 팔린 작품들을 들고옴
		ArrayList<Product> pList = aService.getTopProduct();
		
		
		model.addAttribute("aList", aList);
		model.addAttribute("cList", cList);
		model.addAttribute("pList", pList);
		
		model.addAttribute("loginUsers", loginUsers);
		
		return "/auction/adminMainPage";
	}
	
	public List<String> getLogData() throws IOException {
        String logFilePath = "C:/setting-files/login.log";

        return Files.readAllLines(Paths.get(logFilePath));
    }
	
}
