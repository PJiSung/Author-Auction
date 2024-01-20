package com.kh.auction.user.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.auction.common.config.Pagination;
import com.kh.auction.member.service.MemberService;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Auction;
import com.kh.auction.user.model.vo.BiddingDetail;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.service.AuctionService;

import jakarta.servlet.http.HttpServletRequest;

@SessionAttributes("loginUser")
@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService aService;
	
	@Autowired
	private MemberService mService;
	
	@GetMapping("auctionList.ac") 
	public String moveToAuctionList(@RequestParam(value="page", defaultValue="1") int page,@RequestParam(value="sort", required=false) String sort, Model model) {
		
		//진행중인 경매의 수를 가져옴
		int ongoingAuctionNum = aService.getAllOngingAuctionNum();
		
		PageInfo pi = Pagination.getPageInfo(page, ongoingAuctionNum, 12);
		
		//진행중인 경매의 모든 경매리스트를 가지고옴
		
		ArrayList<Auction> auctionList = aService.getAllAuction(sort, pi);
	
		if(sort != null) {
			model.addAttribute("sort", sort);
		}
		model.addAttribute("pi",pi);
		model.addAttribute("total", ongoingAuctionNum);
		model.addAttribute("aList", auctionList);
		  
		return "/auction/auctionList";
	}
	
	@GetMapping("auctionDetail.ac")
	public String moveToAuctionDetail(@RequestParam(value="page", defaultValue="1") int page, @RequestParam("aucNo") int aucNo, Model model) { 
		
		//경매 들어가기전에 현재 보유금액을 들고옴
		
		if(((Member)model.getAttribute("loginUser")) != null) {
			int memBalance = mService.login((Member)model.getAttribute("loginUser")).getMemBalance();
			model.addAttribute("memBalance",memBalance);
		}
		//경매 번호를 가지고 세부내용을 들고옴
		Auction auction = aService.getAuctionDetail(aucNo);
		
		//경매 내부의 사진을 들고옴
		ArrayList<Attachment> attachmentList = aService.getAuctionAttachment(aucNo);
		
		
		 
		model.addAttribute("auction",auction);
		model.addAttribute("page", page);
		model.addAttribute("attachmentList",attachmentList);
		
		
		return "/auction/auctionDetail";
	}
	
	
	//입찰 - ajax 이용한 입찰
	@ResponseBody
	@PostMapping("insertBid.ac")
	public String insertBid(@RequestParam("bidMoney") int bidMoney, @RequestParam("aucNo") int aucNo, Model model) {
		
		Member m = (Member)model.getAttribute("loginUser");
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("bidMoney", bidMoney);
		hm.put("aucNo", aucNo);
		hm.put("id", m.getMemId());
		
		//입찰 - ajax 이용해 환불한후에 바로 경매금액 업데이트 
		int result = aService.insertBid(hm);
		
		if(result > 0) {
			 Auction updateAuction = aService.getAuctionDetail(aucNo);
			 m = mService.login(m);
			 
			 JSONObject jsonObject = new JSONObject();
			 JSONArray jArr = new JSONArray();
			
			 jsonObject.put("memBalance", m.getMemBalance());
			 jsonObject.put("aucFinishPrice",updateAuction.getAucFinishPrice());
			 jArr.put(jsonObject);
			 
			 String jsonString = jArr.toString();
			return jsonString;
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@GetMapping("checkLike.ac")//상세 페이지로 이동할때 좋아요를 눌렀는지 체크
	public int checkLike(@RequestParam("aucNo") int aucNo, Model model) {
		String id = null;
		Member m = ((Member)model.getAttribute("loginUser"));
		int checkLike = 0;
		
		if(m != null) {
			HashMap<String, Object> hm = new HashMap<>();
			List<Integer> aucNos = new ArrayList<>();
			id = m.getMemId();
			hm.put("id", m.getMemId());
			aucNos.add(aucNo);
			hm.put("aucNo", aucNos);
			checkLike = aService.checkLike(hm);
			model.addAttribute("likeCheck", checkLike);
			return checkLike;
		}else {
			return checkLike;
		}
	}
	
	
	@ResponseBody
	@GetMapping("interest.ac") //ajax 관심 목록 업데이트 + 마이페이지 여러개 삭제
	public String updateInterest(@RequestParam(value="aucNo", required=false) Integer aucNo, Model model, @RequestParam(value="checkedNum[]", required=false) int[] checkedNum, @RequestParam(value="page", defaultValue = "1") int currentPage, HttpServletRequest request) {
		String result = null;
		HashMap<String, Object> hm = new HashMap<>();
		List<Integer> aucNos = new ArrayList<>();
		String id = ((Member)model.getAttribute("loginUser")).getMemId();
		hm.put("id", id);
		if(checkedNum == null) {
			result = "forCheck";
			aucNos.add(aucNo);
		}else {
			result = "delete";
			for(int i = 0; i < checkedNum.length; i++) {
				aucNos.add(checkedNum[i]);
			}
		}
		hm.put("aucNo", aucNos);
		return aService.updateInterest(hm,result);
	}
	
	
	
	
	@GetMapping("myBidList.ac") //내 입찰 목록을 들고 옴
	public String moveToMyBIdList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model,
									@RequestParam(value="aucStatus", required=false) String aucStatus,
									@RequestParam(value="sort", required=false) String sort) {
		
		HashMap<String, String> bidListHm = new HashMap<>();
		
		
		String id = null;
		Member m = ((Member)model.getAttribute("loginUser"));
		
		if(m != null) {
			id = m.getMemId();
			bidListHm.put("id", id);
		}
		
		if(aucStatus != null) {
			bidListHm.put("aucStatus", aucStatus);
			model.addAttribute("aucStatus", aucStatus);
		}
		
		if(sort != null) {
			bidListHm.put("sort", sort);
			model.addAttribute("sort", sort);
		}
		
		
		// 내 입찰 경매의 개수를 가지고 옴
		int myBidCount = aService.getAllMyBidListCount(bidListHm);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, myBidCount, 10);
		
		//내가 입찰한 경매의 목록을 들고옴
		ArrayList<Auction> myBidList = aService.getAllMyBidList(bidListHm, pi);
		
		//내가 입찰한 경매내역을 들고옴
		ArrayList<BiddingDetail> detailList = aService.getAllMyDetail(bidListHm, pi);
		
		
		model.addAttribute("detailList", detailList);
		model.addAttribute("myBidList", myBidList);
		model.addAttribute("pi", pi);
		model.addAttribute("id", id);
		
		System.out.println(m.getMemId());
		System.out.println(detailList);
		
		return "/auction/myAuction";
	}
	
	
	@GetMapping("myInterest.ac") //관심페이지로 이동
	public String moveToMyInterest(@RequestParam(value="page", defaultValue="1") int currentPage, 
			@RequestParam(value="aucStatus", required=false) String aucStatus,@RequestParam(value="sort", required=false) String sort, Model model,HttpServletRequest request) {
		
		String id = null;
		Member m = ((Member)model.getAttribute("loginUser"));
		
		HashMap<String, String> interestHm = new HashMap<>();
		
		
		if(m != null) {
			id = m.getMemId();	
			interestHm.put("id", id);
		}
		if(aucStatus != null) {
			interestHm.put("aucStatus", aucStatus);
			model.addAttribute("aucStatus", aucStatus);
		}
		if(sort != null) {
			interestHm.put("sort", sort);
			model.addAttribute("sort", sort);
		}
		
		//내 관심 경매의 개수를 가져옴 
		int myInterestNum = aService.getAllInterestNum(interestHm);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, myInterestNum, 10);
		
		//아이디로 내 관심 목록 들고옴
		ArrayList<Auction> aList = aService.getMyInterestList(interestHm, pi);
		
		model.addAttribute("aList", aList);
		model.addAttribute("pi", pi);
		
		
		
		return "/auction/likeList"; // 일반 요청에 대한 응답 페이지
	}
	
	@GetMapping("searchAuctionList.ac")
	public String searchAuctionList(@RequestParam("searchContent") String searchContent, @RequestParam(value="page", defaultValue="1") int currentPage, 
									@RequestParam("searchType") String searchType,@RequestParam(value="sort", required=false) String sort, Model model) {
		
		
		
		HashMap<String, String> hm = new HashMap<>();
		
		hm.put("searchType", searchType);
		hm.put("searchContent", searchContent);
		
		if(sort != null) {
			hm.put("sort",sort);
			model.addAttribute("sort", sort);
		}
		
		//검색 내용을 가지고 리스트 개수 를 불러옴
		int searchAuctionCount = aService.getSearchAuction(hm);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, searchAuctionCount, 12);
		
		//검색 내용을 가지고 경매를 가지고 옴
		ArrayList<Auction> aList = aService.getSearchAuctionList(hm,pi);
		
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchContent", searchContent);
		model.addAttribute("aList", aList);
		model.addAttribute("pi", pi);
		model.addAttribute("total", searchAuctionCount);
		
		return "/auction/auctionList";
	}
	
	@GetMapping("moveTocal.ac")
	public String moveToCal(@RequestParam(value="date", required=false) String date,Model model) {
		if(date == null) {
			LocalDateTime now = LocalDateTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd 00:00:00");
	        String formattedDate = now.format(formatter);
	        
	        //date가 없을때 오늘 날짜를 기준으로 예정 경매를 들고옴
	        ArrayList<Auction> aList = aService.getScheduledAuction(formattedDate);
	        model.addAttribute("aList", aList);
	        
	        System.out.println("null = " + aList);
		}else {
			LocalDate parsedDate = LocalDate.parse(date);
			LocalDateTime specificDateTime = parsedDate.atStartOfDay();
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd 00:00:00");
			String formattedDate = specificDateTime.format(formatter);
			//date가 없을때 오늘 날짜를 기준으로 예정 경매를 들고옴
	        ArrayList<Auction> aList = aService.getScheduledAuction(formattedDate);
	        model.addAttribute("aList", aList);
	        System.out.println("null x = " + aList);
		}
	        
		return "/auction/calendar";
	}
	
	
	@GetMapping("scheduledAuction.ac")
	public String moveToScheduledAuctionList(@RequestParam("aucNo") int aucNo,Model model) {
		
		Auction scheduledAuction =  aService.getScheduledAuctionView(aucNo);
		
		ArrayList<Attachment> aList = aService.getAuctionAttachment(aucNo);
		
		model.addAttribute("auction", scheduledAuction);
		model.addAttribute("attachmentList", aList);
		
		
		return "/auction/scheduledAuction";
	}
}
