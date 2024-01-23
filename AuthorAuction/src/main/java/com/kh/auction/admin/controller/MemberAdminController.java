package com.kh.auction.admin.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.auction.common.config.ChattingPagination;
import com.kh.auction.common.config.Pagination;
import com.kh.auction.member.service.MemberService;
import com.kh.auction.user.model.vo.Inquiry;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.SearchMember;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberAdminController {
	
	@Autowired
	private MemberService mService;
	
	private String sortMember = null;
	
	@GetMapping("memberList.adme")
	public String selectMemberList(@RequestParam(value="page", defaultValue="1") int page,
								   @RequestParam(value = "modalPage", defaultValue="1") int modalPage,
								   @RequestParam(value = "id", required = false) String id,
								   @RequestParam(value ="chatStartDate", required = false) String chatStartDate,
								   @RequestParam(value = "chatEndDate", required = false) String chatEndDate,
								   @RequestParam(value = "inqNo", required = false) Integer inqNo,
								   Model model, HttpSession session, SearchMember sm) throws Exception {
		
		sm.convertEmptyToNull();
		
		if(chatStartDate != null && chatStartDate.equals("")) {
			chatStartDate = null;
		}
		if(chatEndDate != null && chatEndDate.equals("")) {
			chatEndDate = null;
		}
		
		sortMember = sm.getStatus();
		Member m = new Member();
		
		ArrayList<Inquiry> iList = new ArrayList<>();
		
		int iListCount = 0; 
		int modalCurrentPage = 0; 
		PageInfo iPi = new PageInfo();
		
		if(id != null) {
			//회원정보
			m = mService.selectMember(id);
			//채팅 리스트
			HashMap<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("startDate", chatStartDate);
			map.put("endDate", chatEndDate);
			iListCount = mService.getiListCount(map); 
			modalCurrentPage = modalPage;
		    iPi = ChattingPagination.getPageInfo(modalCurrentPage, iListCount, 7); 
		    iList = mService.selectInquiryList(map, iPi);
		}
		ArrayList<String> msg = new ArrayList<>();
		if(inqNo != null) {
			//채팅 내용
		    String fileName = mService.selectInquiry(inqNo);
		    BufferedReader reader = new BufferedReader(new FileReader("D:\\logs\\inquiry\\"+fileName));
		    String str;
		    while((str = reader.readLine()) != null) {
		    	msg.add(str);
		    }
		    //msg.remove(msg.size());
		    reader.close();
		}
		System.out.println(msg);
		int listCount = mService.getListCount(sm);
		int currentPage = page;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Member> list = mService.selectMemberList(sm, pi);
		
		if(list != null) {
			model.addAttribute("iList", iList);
			model.addAttribute("iPi", iPi);
			
			model.addAttribute("chatMsg", msg);
			
			model.addAttribute("total", listCount);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("sm", sm);
			model.addAttribute("m", m);
			model.addAttribute("status", sortMember);
			return "member/memberList";
		} else {
			throw new Exception("회원 목록 조회를 실패하였습니다.");
		}
	}
	
	@PostMapping("deleteMember.adme")
	@ResponseBody
	public String deleteMember(@RequestParam("ids[]") String[] ids) {
		int result = mService.deleteMembers(ids);
		if(result > 0) {
			return "success";
		}
		return "fail";
	}
	
	@PostMapping("updateMemberIsAdmin.adme")
	@ResponseBody
	public String updateMemberIsAdmin(Member m) {
		int result = mService.updateMemberIsAdmin(m);
		if(result > 0) {
			return "success";
		}
		return "fail";
	}
	
	
	@PostMapping("updateMember.adme")
	@ResponseBody
	public String updateMember(Member m) {
		int result = mService.updateMemberByAdmin(m);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
}
