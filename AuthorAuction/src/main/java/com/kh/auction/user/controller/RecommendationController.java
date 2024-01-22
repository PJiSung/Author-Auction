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
import com.kh.auction.member.service.MemberService;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Recommendation;
import com.kh.auction.user.service.RecommendationService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class RecommendationController {

	@Autowired
	private RecommendationService rService;

	// 그림추천 리스트
	@GetMapping("recommendationList.re")
	public String moveToRecommendationList(HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) throws Exception {
		int listCount = rService.getListCount();
		int currentPage = page;
		ArrayList<Attachment> newAlist = new ArrayList<>();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		ArrayList<Recommendation> rList = rService.selectRecommendationList(pi);
		ArrayList<Attachment> aList = rService.selectAttmList(null);
		
		int beforeBno = 0;
		for(int i = 0; i<aList.size(); i++) {
			if(i >= 0) {
				if(aList.get(i).getAttBno() != beforeBno) {
					newAlist.add(aList.get(i));		
				}
			}
			beforeBno = aList.get(i).getAttBno();// 중복제거
		}

		if (aList != null && rList != null) {
			model.addAttribute("rList", rList);
			model.addAttribute("aList", newAlist);
			model.addAttribute("pi", pi);

			return "recommendation/recommendationList";
		} else {
			throw new Exception("그림추천 목록 조회를 실패하였습니다.");
		}

	}

	// 그림추천 문의 등록 페이지로
	@GetMapping("recommendationEnroll.re")
	public String moveToRecommendationEnroll() {

		return "recommendation/recommendationEnroll";
	}

	// 그림추천 문의 등록
	@PostMapping("insertRecommendation.re")
	public String insertRecommendation(@ModelAttribute Recommendation r, HttpSession session,
			@RequestParam(value = "file") ArrayList<MultipartFile> files) throws Exception {

		Member m = ((Member) session.getAttribute("loginUser"));
		r.setMemId(m.getMemId());
		r.setMemName(m.getMemName());

		// 첨부 파일 리스트를 담을 ArrayList를 생성
		ArrayList<Attachment> list = new ArrayList<>();
		if (files != null && !files.isEmpty()) {
			for (int i = 0; i < files.size(); i++) {
				MultipartFile upload = files.get(i);

				if (!upload.getOriginalFilename().equals("")) { // 수정: 파일이 비어있지 않은 경우에만 처리
					// 파일 저장하고 저장된 파일정보 가져옴
					String rename = saveFile(upload);
					if (rename != null) {
						Attachment a = new Attachment();
						a.setAttRename(rename);
						a.setAttCategory(3); // 그림추천 게시판
						list.add(a);
					}
				}
			}
		}

		for (int i = 0; i < list.size(); i++) {
			Attachment a = list.get(i);
			if (i == 0) {
				a.setAttFno(0);
			} else {
				a.setAttFno(1);
			}
		}

		int result1 = rService.insertRecommendation(r); // 정보 저장 리스트

		if (!list.isEmpty()) {
			for (Attachment a : list) {
				a.setAttBno(r.getRecNo());
			}
			int result2 = rService.insertAttm(list); // 사진 리스트

			if (result1 > 0 && result2 > 0) { // 정보저장, 사진 둘 다 있어야함
				return "redirect:recommendationList.re";
			} else {
				for (Attachment a : list) {
					deleteFile(a.getAttRename());
				}
				throw new Exception("그림추천 문의 게시글 등록을 실패하였습니다.");
			}
		} else {
			if (result1 > 0) {
				return "redirect:recommendationList.re";
			} else {
				throw new Exception("그림추천 문의 게시글 등록을 실패하였습니다.");
			}
		}
	}

	private String saveFile(MultipartFile upload) {
		String root = "C:\\";
		String savePath = root + "\\uploadFiles";

//		String savePath = "/Users/kimgahyun/uploadFiles"; 				// 맥

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}
		// 저장파일 rename
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int) (Math.random() * 100000);

		String originFileName = upload.getOriginalFilename();
		String renameFileName = sdf.format(time) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));

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

	private void deleteFile(String fileName) {
		String root = "C:\\";
		String savePath = root + "\\uploadFiles";

//		String savePath = "/Users/kimgahyun/uploadFiles";				// 맥
//		File f = new File(savePath + File.separator + fileName);		// 맥

		File f = new File(savePath + "\\" + fileName);
		if (f.exists()) {
			f.delete();
		}
	}
	// 마이페이지 리스트
	@GetMapping("myRecommendationList.re")
	public String recommendationList(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "strDate", required = false) String strDate,
			@RequestParam(value = "endDate", required = false) String endDate, HttpSession session) throws Exception {

		Member loginUser = (Member) session.getAttribute("loginUser");
		String memId = loginUser.getMemId();

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);

		if (strDate != null && strDate.equals("")) {
			map.put("strDate", null);
		} else {
			map.put("strDate", strDate);
		}
		if (endDate != null && endDate.equals("")) {
			map.put("endDate", null);
		} else {
			map.put("endDate", endDate);
		}

		int listCount = rService.getListCount2(map);
		int currentPage = page;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Recommendation> rList = rService.myRecommendationList(map, pi);

		if (rList != null) {
			model.addAttribute("rList", rList);
			model.addAttribute("pi", pi);
			model.addAttribute("strDate", strDate);
			model.addAttribute("endDate", endDate);
			return "consignment/recommendationMyPage";
		} else {
			throw new Exception("그림추천 문의글 목록 조회를 실패하였습니다.");
		}
	}

	// 글 삭제
	@PostMapping("deleteRecommendation.re")
	public String deleteRecommendation(@RequestParam("recNo") int recNo, @RequestParam("beforeURL") String beforeURL) throws Exception {
		int result1 = rService.deleteRecommendation(recNo);
		int result2 = rService.statusNRecommendation(recNo);

		if (result1 > 0 && result2 > 0) {
			if(beforeURL.equals("1")) {
				return "redirect:recommendationList.re";
			} else {
				return "redirect:myRecommendationList.re";
			}
		} else {
			throw new Exception("게시글 삭제를 실패하였습니다.");
		}
	}

	// 체크박스 삭제
	@ResponseBody
	@PostMapping("checkDelete.re")
	public String checkDelete(@RequestParam("deleteIds[]") String[] deleteIds) {
		int result = rService.checkDelete(deleteIds);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	// 상세조회
	@GetMapping("selectRecommendation.re")
	public String selectRecommendation(@RequestParam("recNo") int recNo, HttpSession session, Model model,
			@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam("beforeURL") String beforeURL) throws Exception {

		Recommendation r = rService.selectRecommendation(recNo); // 정보 조회
		ArrayList<Attachment> aList = rService.selectAttmRecommendationList(recNo); // 게시글 첨부파일 목록 조회

		if (aList != null) {
			model.addAttribute("aList", aList);
			model.addAttribute("r", r);
			model.addAttribute("beforeURL", beforeURL);
			return "recommendation/recommendationDetail";
		} else {
			throw new Exception("그림추천 게시글 상세조회를 실패하였습니다.");
		}
	}
	// 답글 등록	
	@PostMapping("insertReply.re")
	public String replyEnroll(@ModelAttribute Recommendation r, HttpSession session, 
							  @RequestParam(value = "file") MultipartFile file) throws Exception {
		Member m = ((Member)session.getAttribute("loginUser"));
		r.setMemId(m.getMemId());

		String rename = saveFile(file);
		
		Attachment a = new Attachment();
		if(file.getSize() != 0) {
			a.setAttRename(rename);
			a.setAttFno(2); 		// 답글(2) / 썸(0), 썸X(1)
			a.setAttCategory(3);	// 그림추천 게시
			a.setAttBno(r.getRecNo());
		} 
		int result1 = rService.insertReply(r);			// 글
		int result2 = rService.insertAttmReply(a);		// 첨부
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:recommendationList.re";
		} else {
			throw new Exception("답글 등록을 실패하였습니다.");
		}
	}
	// 수정 페이지로 이동
	@PostMapping("editRecommendation.re")
	public String moveToRecommendationEdit(@ModelAttribute Recommendation r, Model model, @RequestParam("beforeURL") String beforeURL) {
		ArrayList<Attachment> aList = rService.selectAttmList(r.getRecNo());
		model.addAttribute("r", r);
		model.addAttribute("aList", aList);
		model.addAttribute("beforeURL", beforeURL);
		return "recommendation/recommendationEdit";
	}
	// 답글 수정
	@PostMapping("updateReply.re")
	public String updateReply(@RequestParam(value="page", defaultValue="1") int page, 
							  @ModelAttribute Recommendation r,
							  @RequestParam(value="file") MultipartFile file, Model model, HttpSession session,
							  @RequestParam(value= "deleteReplyAttm", required = false) String deleteAttm, RedirectAttributes redirct,
							  @RequestParam("beforeURL") String beforeURL) throws Exception {
		
		// 업데이트할 첨부 파일 및 답글 삭제 결과 변수 초기화
		int updateAttmResult = 0;    // 첨부파일 업데이트 결과
	    int deleteAttmResult = 0;    // 첨부파일 삭제 결과

	    HashMap<String, Object> map = new HashMap<String, Object>();	// HashMap을 사용하여 업데이트에 필요한 데이터를 담음

	    // 파일이 선택되었는지 확인
	    if(file != null && !file.isEmpty()) {    						// 파일이 있을 경우
	        String rename = saveFile(file);    							// 파일 저장 및 저장된 파일명을 가져와서 map에 추가

	        map.put("recNo", r.getRecNo());
	        map.put("rename", rename);
	        updateAttmResult = rService.updateAttmReply(map);    		// 첨부파일 업데이트
	    } 

	    // 삭제할 첨부파일이 선택되었는지 확인
	    if(deleteAttm != null && !deleteAttm.equals("none")) {
	        String[] split = deleteAttm.split("/");						// 삭제할 첨부 파일의 이름을 '/'를 기준으로 분리하여 가져옴
	        String delRename = split[0];
	        deleteAttmResult = rService.deleteAttmReply(delRename);   	// 첨부파일 삭제
	        if(deleteAttmResult > 0) {									// 첨부파일 삭제 성공 시 실제 파일도 삭제
	            deleteFile(delRename);    
	        }
	    }

	    // 답글 업데이트 수행
	    int updateReplyResult = rService.updateReply(r);

	    // 답글 및 첨부파일 업데이트가 성공했을 경우 리다이렉션
	    if(updateAttmResult + updateReplyResult > 0) {
	        redirct.addAttribute("recNo", r.getRecNo());
	        redirct.addAttribute("beforeURL",beforeURL);
	        return "redirect:selectRecommendation.re";
	    } else {														// 업데이트 및 삭제에 실패한 경우 예외 발생
	        throw new Exception("답글 수정에 실패하였습니다.");
	    }
	}
	// 글 수정
	@PostMapping("updateRecommendation.re")
	public String updateRecommendation(@ModelAttribute Recommendation r, RedirectAttributes redirect,
						               @RequestParam(value = "page", defaultValue = "1") int page,
						               @RequestParam(value = "deleteAttm", required = false) String[] deleteAttm,
						               @RequestParam(value = "file", required = false) ArrayList<MultipartFile> files,
						               @RequestParam("beforeURL") String beforeURL,
						               HttpServletRequest request) throws Exception {

		ArrayList<Attachment> list = new ArrayList<>();
		for (int i = 0; i < files.size(); i++) {
			MultipartFile upload = files.get(i);
			if (!upload.getOriginalFilename().equals("")) {
				String rename = saveFile(upload);
				if (rename != null) {
					Attachment a = new Attachment();
					a.setAttRename(rename);
					a.setAttCategory(3);
					a.setAttFno(i);
					a.setAttBno(r.getRecNo());
					list.add(a);
				}
			}
		}
		// 삭제할 사진 정보를 저장할 리스트
		ArrayList<String> delRename = new ArrayList<>();
		ArrayList<Integer> delLevel = new ArrayList<>();

		// deleteAttm : 삭제할 첨부 파일의 이름 / 원래 등록되어 있던 사진 리스트(삭제할 사진 이름이 담겨있음 - rename)
		// rename이 none이 아닌 경우에만 삭제함
		if (deleteAttm != null) {
			for (String rename : deleteAttm) {
				if (!rename.equals("none")) {
					// 삭제하려고 선택한 사진은 none, 선택 안한 사진은 이름이 찍힘
					String[] split = rename.split("/");
					delRename.add(split[0]);
					delLevel.add(Integer.parseInt(split[1]));
				}
			}
		}

		int deleteAttmResult = 0;
		if (!delRename.isEmpty()) {
			deleteAttmResult = rService.deleteAttm(delRename);	// 사진 삭제
			if (deleteAttmResult > 0) {
				for (String rename : delRename) {
					deleteFile(rename);
				}
			}
			if (delRename.size() == deleteAttm.length) {
			// 삭제할 사진이 모두 선택된 경우
			// 추가적인 작업이 필요한 경우 해당 내용을 작성하시면 됩니다.
			} else {
				for (int level : delLevel) {
					if (level == 0) {
						rService.updateAttmLevel(r.getRecNo());	// 썸네일 변경
						break;
					}
				}
			}
		}

		// 기존 사진 중 썸네일로 표시할 사진 한 장만 선택
		ArrayList<Attachment> thumbnailList = new ArrayList<>();
		if (!list.isEmpty()) {
			Attachment thumbnail = list.get(0);
			thumbnail.setAttBno(r.getRecNo());
			thumbnailList.add(thumbnail);
		} else if (!list.isEmpty()){
			// 기존에 등록된 사진 중에서 한 장을 썸네일로 선택
		}
		int updateRecommendationResult = 0;
		int updateAttmResult = 0;
		updateRecommendationResult = rService.updateRecommendation(r);	// 내용 수정
		for (Attachment a : list) {
			a.setAttBno(r.getRecNo());
			a.setAttFno(0); // 썸네일로 지정되지 않도록 썸네일 레벨을 0으로 설정
		}
		if (!list.isEmpty()) {
			updateAttmResult = rService.insertAttm(list); // 새로운 사진 추가
		} else {
			updateAttmResult = 1;
		}
			redirect.addAttribute("page", page);
			if(beforeURL.equals("1")) {
				return "redirect:recommendationList.re";
			} else {
				return "redirect:myRecommendationList.re";
			}
	}
	
}

		
