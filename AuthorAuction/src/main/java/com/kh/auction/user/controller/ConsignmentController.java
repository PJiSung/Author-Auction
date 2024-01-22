package com.kh.auction.user.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.auction.common.config.Pagination;
import com.kh.auction.user.exception.Exception;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Consignment;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.SearchConsignment;
import com.kh.auction.user.service.ConsignmentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ConsignmentController {

	@Autowired
	private ConsignmentService cService;

	private String sortConsignment = null;
	
	// 위탁안내 페이지로 이동
	@GetMapping("conInfo.co")
	public String moveToConsignmentInfo() {
		return "consignment/conInfo";
	}

	// 위탁문의 등록 페이지로
	@GetMapping("conEnroll.co")
	public String moveToConsignmentEnroll() {
		return "consignment/conEnroll";
	}

	// 위탁문의 등록
	@PostMapping("conInsert.co")
	public String insertConsignment(@ModelAttribute Consignment c,
			@RequestParam(value = "file", required = false) ArrayList<MultipartFile> files, HttpSession session,
			Member m) {

		// 현재 세션에 저장된 사용자 정보에서 회원 ID를 가져와서 위탁 정보 객체설정
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser != null) {
			String id = loginUser.getMemId();
			c.setMemId(id);
		}

		// 첨부 파일 리스트를 담을 ArrayList를 생성
		ArrayList<Attachment> list = new ArrayList<>();
		// 업로드된 파일들에 대한 처리
		if (files != null) {
			for (int i = 0; i < files.size(); i++) {
				MultipartFile upload = files.get(i);

				if (!upload.getOriginalFilename().equals("")) {
					// 파일을 저장하고 저장된 파일정보 가져옴
					String rename = saveFile(upload, i);
					if (rename != null) {
						Attachment a = new Attachment();
						a.setAttRename(rename);
						a.setAttCategory(2); // 위탁문의 게시판(2)
						a.setAttFno(i); // 사진 분류 순서
						list.add(a);
					}
				}
			}
		}
		// 게시판 분류(attCategory) : 1(리뷰) / 2(위탁문의) / 3(그림추천)
		// 그림추천(썸네일) 구분(fno) : 0(없), 1(있)
		// 위탁문의 순서(fno) : 앞(1)/뒤(2)/서명(3)/구매서류(4)/상세사진(5)
		int result1 = cService.insertConsignment(c); // 정보 저장 리스트

		// 첨부 파일이 없는 경우
		if (!list.isEmpty()) {
			for (Attachment a : list) {
				a.setAttBno(c.getConNo());
			}
			int result2 = cService.insertAttm(list); // 사진 리스트

			if (result1 > 0 && result2 > 0) { // 정보저장도 하고, 사진도 무조건 있어야 성공
				return "redirect:list.co";
			} else {
				for (Attachment a : list) {
					deleteFile(a.getAttRename());
				}
				throw new Exception("위탁문의 게시글 등록을 실패하였습니다.");
			}
		} else {
			if (result1 > 0) {
				return "redirect:list.co"; // 일단 등록 성공하면 위탁안내 페이지로 이동
			} else {
				throw new Exception("첨부파일 게시글 등록 실패");
			}
		}
	}

	public String saveFile(MultipartFile upload, int i) {
		String root = "C:\\";
		String savePath = root + "\\uploadFiles";

		//String savePath = "/Users/kimgahyun/uploadFiles"; 				// 맥

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		// 저장 파일 rename
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int) (Math.random() * 100000);

		String originFileName = upload.getOriginalFilename();
		String[] forNum = originFileName.split("\\.");
		String newName = forNum[0] + "." + i + "." + forNum[1];

		String renameFileName = sdf.format(time) + ranNum + newName.substring(originFileName.lastIndexOf("."));

		// rename된 파일 저장소에 저장
//		String renamePath = folder + "\\" + renameFileName; // 이름 변경

		String renamePath = folder + File.separator + renameFileName;	// 맥

		try {
			upload.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return renameFileName;
	}

	public void deleteFile(String fileName) {
//		String root = "C:\\";
//		String savePath = root + "\\uploadFiles";
		
		String savePath = "/Users/kimgahyun/uploadFiles";				// 맥
		File f = new File(savePath + File.separator + fileName);		// 맥
//		File f = new File(savePath + "\\" + fileName.split("localhost/")[1]);
		if (f.exists()) {
			f.delete();
		}
	}

	// 마이페이지 위탁문의 리스트
	@GetMapping("list.co")
	public String selectConsignmentList(@RequestParam(value = "page", defaultValue = "1") int page, Model model, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		String memId = (loginUser != null) ? loginUser.getMemId() : null;

		int listCount = cService.getListCount(memId);
		int currentPage = page;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Consignment> list = cService.selectConsignmentList(memId, pi);

		if (list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);

			return "consignment/conMyPage";
		} else {
			throw new Exception("위탁문의 게시글 목록 조회 실패");
		}
	}

	// 마이페이지 검색
	@GetMapping("searchList.co")
	public String searchConsignment( @RequestParam(value="page", defaultValue="1") int page, SearchConsignment sc, Model model, HttpSession session) {
		
//		System.out.println(sc);
		
		// keyword : 입력한 검색어 / select : select에서 가져오는 기준
		Member loginUser = (Member) session.getAttribute("loginUser");
		String memId = (loginUser != null) ? loginUser.getMemId() : null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("endDat", sc.getEndDat());
		map.put("keyword", sc.getKeyword());
		map.put("select", sc.getSelect());
		map.put("strDate", sc.getStrDate());
		map.put("memId", memId);
		
		int listCount = cService.searchCount(map);
		int currentPage = page;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10); 
		ArrayList<Consignment> list = cService.searchList(map, pi);
		
		System.out.println(map);
		System.out.println(list);
		
		if (list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("sc", sc);

			return "consignment/conMyPage";
		} else {
			throw new Exception("게시글 검색 실패");
		}
	}

	// 상세조회
	@GetMapping("selectConsignment.co")
	public String selectConsignment(@RequestParam("conNo") int conNo, HttpSession session, Model model,
									@RequestParam(value = "page", defaultValue = "1") int Page) {

		String isAdmin = ((Member) session.getAttribute("loginUser")).getMemIsAdmin();

		if (isAdmin.equals("Y")) {
			int result = cService.updateConAdmStatus(conNo);
		}
		
		Member m = cService.selectMember(conNo);
		Consignment c = cService.selectConsignment(conNo); // 게시글 정보 조회
		
		// 게시글의 첨부파일 목록 조회
		ArrayList<Attachment> list = cService.selectAttmConsignmentList(conNo);
		PageInfo pi = Pagination.getPageInfo(Page, conNo, Page);

		// 조회된 게시글이 null이 아닌 경우에만 모델에 추가하고 상세조회 페이지로 이동
		if (list != null) {
			model.addAttribute("c", c);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("m", m);
			return "consignment/conDetail";
		} else {
			throw new Exception("위탁문의 게시글 상세조회를 실패하였습니다.");
		}
	}

	// 글 삭제
	@PostMapping("delete.co")
	public String deleteConsignment(@RequestParam("conNo") int conNo) {

		int result1 = cService.deleteConsignment(conNo);
		int result2 = cService.statusNConsignment(conNo);

		if (result1 > 0 && result2 > 0) {
			return "redirect:list.co";
		} else {
			throw new Exception("게시글 삭제를 실패하였습니다. ");
		}
	}

	// 글 수정(첨부)
	@ResponseBody
	@PostMapping("updateConsignment.co")
	public String updateAttm(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "files", required=false) MultipartFile[] files,
			@RequestParam(value = "exist", required=false) int[] exist,
			@RequestParam(value = "imgArr", required=false) String[] imgArr,
			@RequestParam(value = "conNo", required=false) int conNo,
			  RedirectAttributes ratt) {
		
		// // 파일 새로 추가
		ArrayList<Attachment> list = new ArrayList<>(); // list : 새로추가할 파일들
		//exist : 추가될 인덱스 번호
		//imgArr : 삭제 파일명
		int updateResult = 0;
		if(files != null) {
			for(int i = 0; i < files.length; i++) { 
				MultipartFile upload = files[i];
				if(!upload.getOriginalFilename().equals("")) {
					String rename = saveFile(upload, exist[i]);
					if(rename != null) { 
						Attachment a = new Attachment();
						a.setAttRename(rename);
						a.setAttFno(exist[i]);
						a.setAttBno(conNo);
						list.add(a); 
						updateResult = cService.updateAttmFno(a);
					} 
				} 
		    }

		}	
			
		for(int i=0; i<imgArr.length; i++) {
			if(!imgArr[i].equals("undefined") && !imgArr[i].equals("null")) {
				deleteFile(imgArr[i]);
			}
		}
		if(updateResult > 0) {
			ratt.addAttribute("conNo", conNo);
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 글 수정(글)
	@PostMapping("updateBoard.co")
	public String updateBoard(Consignment c, RedirectAttributes ratt) {
		System.out.println("rrrr");
		int result = cService.updateConsignment(c);
		if(result > 0) {
			ratt.addAttribute("conNo", c.getConNo());
			return "redirect:selectConsignment.co";
		} else {
			throw new Exception("위탁문의 게시글 수정을 실패하였습니다.");
		}
	}
}
