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
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Reply;
import com.kh.auction.user.model.vo.Review;
import com.kh.auction.user.model.vo.SearchReview;
import com.kh.auction.user.service.ReviewService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	@GetMapping("reviewList.rv")
	public String goReviewList(HttpSession session,
							   @RequestParam(value="page", defaultValue="1") int page,
							   @RequestParam(value = "revNo", required = false) Integer revNo,
							   Model model) {
		
		int listCount = rService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(page, listCount, 9);
		ArrayList<Review> rList = rService.selectReviewList(pi);
		ArrayList<Review> allRlist = rService.selectReviewAllList();
		ArrayList<Attachment> aList = rService.selectAttmList(null);
		
		Review review = new Review();
		ArrayList<Reply> replyList = new ArrayList<Reply>();
		if(revNo != null) {
			review = rService.selectReview(revNo);
			replyList = rService.selectReplyList(revNo);
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = null;
		ArrayList<HashMap<String, Object>> oList = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(loginUser != null) {
			id = loginUser.getMemId();
			map.put("id", id);
			oList =  rService.getOrderList(map);
		}
		
		ArrayList<HashMap<String, Object>> lList = rService.reviewLikeList();
		if(rList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			model.addAttribute("aList", aList);
			model.addAttribute("oList", oList);
			model.addAttribute("lList", lList);
			model.addAttribute("allRlist", allRlist);
			model.addAttribute("replyList", replyList);
			model.addAttribute("review", review);
			return "review/reviewList";
		} else {
			throw new Exception("리뷰 목록 조회에 실패하였습니다.");
		}
		
	}
	
	
	@GetMapping("writeReview.rv")
	public String goWriteReview(HttpSession session, Model model, 
								@RequestParam(value="ordNo", required = false) String ordNo) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = null;
		if(loginUser != null) {
			id = loginUser.getMemId();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		if(ordNo != null) {
			map.put("ordNo",  ordNo);
		}
		
		ArrayList<HashMap<String, Object>> list =  rService.getOrderList(map);
		
		if(list != null) {
			model.addAttribute("list", list);
			return "review/writeReview";
		} else {
			throw new Exception("리뷰 등록 페이지 이동에 실패하였습니다.");
		}
		
	}
	
	@PostMapping("insertReview.rv")
	public String insertReview(@ModelAttribute Review r,
							   @RequestParam("proNo") int proNo,
							   @RequestParam(value="file", required=false) ArrayList<MultipartFile> files,
							   HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getMemId();
		
		r.setMemId(id);
		r.setProNo(proNo);
		ArrayList<Attachment> list = new ArrayList<>();
		for(int i = 0; i < files.size(); i++) {
			MultipartFile upload = files.get(i);
			if(!upload.getOriginalFilename().equals("")) {
				String rename = saveFile(upload);
				if(rename != null) {
					Attachment a = new Attachment();
					a.setAttRename(rename);
					a.setAttCategory(1);
					
					list.add(a);
				}
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			Attachment a = list.get(i);
			if(i == 0) {
				a.setAttFno(0);
			} else {
				a.setAttFno(1);
			}
		}
		
		int result1 = rService.insertReview(r);
		
		
		if(!list.isEmpty()) {
			for(Attachment a : list) {
				a.setAttBno(r.getRevNo());
			}
			int result2 = rService.insertAttm(list);
			
			if(result1 + result2 == list.size()+1) {
				return "redirect:reviewList.rv";
			} else {
				for(Attachment a : list) {
					deleteFile(a.getAttRename());
				}
				throw new Exception("리뷰 등록에 실패하였습니다.");
			}
		} else {
			if(result1 > 0) {
				return "redirect:reviewList.rv";
			} else {
				throw new Exception("리뷰 등록에 실패하였습니다.");
			}
		}
		
	}
	
	public String saveFile(MultipartFile upload) {
		String root = "C:\\";
		String savaPath = root + "\\uploadFiles";
		
//		String savaPath = "/Users/rosa/uploadFiles"; 
		
		
		File folder = new File(savaPath);
		if(!folder.exists()) {
			folder.mkdirs();
		}

		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		
		String originFileName = upload.getOriginalFilename(); 
		String renameFileName = sdf.format(time) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));
																	
		String renamePath = folder + "\\" + renameFileName;
//		String renamePath = folder + File.separator + renameFileName;
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
		String root = "C:\\";
		String savaPath = root + "\\uploadFiles";
		
//		String savaPath = "/Users/rosa/uploadFiles"; 
		
		File f = new File(savaPath + "\\" + fileName);
//		File f = new File(savaPath + File.separator  + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	@GetMapping("searchReview.rv")
	public String searchReview(@RequestParam(value="keyword", required = false) String keyword,
							   @RequestParam(value="category", required = false) String category,
							   @RequestParam(value="selectedSort", defaultValue="latest") String selectedSort,
							   @RequestParam(value = "revNo", required = false) Integer revNo,
							   @RequestParam(value="page", defaultValue="1") int page,
							   Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		if(keyword != null) {
			map.put("keyword", keyword.trim());
		}
		map.put("category", category);
		map.put("selectedSort", selectedSort);
		int listCount = rService.getSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(page, listCount, 9);
		ArrayList<Review> rList = rService.searchReview(map, pi);
		ArrayList<Attachment> aList = rService.selectAttmList(null);
		ArrayList<Review> allRlist = rService.selectReviewAllList();
		ArrayList<HashMap<String, Object>> lList = rService.reviewLikeList();
		
		Review review = new Review();
		ArrayList<Reply> replyList = new ArrayList<Reply>();
		if(revNo != null) {
			review = rService.selectReview(revNo);
			replyList = rService.selectReplyList(revNo);
		}
		
		if(rList != null) {
				model.addAttribute("pi", pi);
				model.addAttribute("rList", rList);
				model.addAttribute("aList", aList);
				model.addAttribute("allRlist", allRlist);
				model.addAttribute("replyList", replyList);
				model.addAttribute("review", review);
				model.addAttribute("lList", lList);
				model.addAttribute("s", map);
				model.addAttribute("selectedSort", selectedSort);
				return "review/reviewList";
		} else {
			throw new Exception("리뷰 검색 결과 조회에 실패하였습니다.");
		}
		
	}
	
	@PostMapping("deleteReview.rv")
	public String deleteReview(@RequestParam("revNo") int revNo,
							   @RequestParam("hasAttachment") String hasAttachment,
							   @RequestParam(value="beforeURL", required = false) String beforeURL) {
		
		int result1 = rService.deleteReview(revNo);
		int result2 = rService.deleteReplyList(revNo);
		
		if(hasAttachment.equals("Y")) {
			int result3 = rService.statusNAttm(revNo);
			if(result1 > 0 && result3 > 0) {
				return (beforeURL != null) ? "redirect:" + beforeURL : "redirect:reviewList.rv";
			} else {
				throw new Exception("리뷰 삭제에 실패하였습니다.");
			}
		} else {
			if(result1 > 0) {
				return (beforeURL != null) ? "redirect:" + beforeURL : "redirect:reviewList.rv";
			} else {
				throw new Exception("리뷰 삭제에 실패하였습니다.");
			}
		}
	}
	
	@PostMapping("goUpdateReview.rv")
	public String goUpdateReview(@RequestParam("revNo") int revNo,
								 @RequestParam(value="page", defaultValue="1") int page, Model model,
								 @RequestParam(value="beforeURL", required = false) String beforeURL,
								 HttpSession session) {
		
		
		Review r = rService.selectReview(revNo);
		ArrayList<Attachment> list = rService.selectAttmList(revNo);
		model.addAttribute("beforeURL", beforeURL);
		model.addAttribute("r", r);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "review/updateReview";
	}
	
	@PostMapping("updateReview.rv")
	public String updateReview(@ModelAttribute Review r, @RequestParam("page") int page,
							   @RequestParam("file") ArrayList<MultipartFile> files,
							   @RequestParam(value="deleteAttm", required = false) String[] deleteAttm,
							   @RequestParam(value="beforeURL", required = false) String beforeURL,
							   HttpServletRequest request, RedirectAttributes redirect, Model model) {
		
		ArrayList<Attachment> list = new ArrayList<>();
		for(int i = 0; i < files.size(); i++) {
			MultipartFile upload = files.get(i);
			
			if(!upload.getOriginalFilename().equals("")) {
				String rename = saveFile(upload);
				if(rename != null) {
					Attachment a = new Attachment();
					a.setAttRename(rename);
					a.setAttCategory(1);
					
					list.add(a);
				}
			}
		}
		
		ArrayList<String> delRename = new ArrayList<>();
		ArrayList<Integer> delLevel = new ArrayList<>();
		boolean existBeforeAttm = true;
		if(deleteAttm != null) {
			for(int i = 0; i < deleteAttm.length; i++) {
				String rename = deleteAttm[i];
				if(!rename.equals("none")) {
					String[] split = rename.split("/");
					delRename.add(split[0]);
					delLevel.add(Integer.parseInt(split[1]));
				}
			}
		} else {
			existBeforeAttm = false;
		}
		
		int deleteAttmResult = 0;
		if(!delRename.isEmpty()) {
			deleteAttmResult = rService.deleteAttm(delRename);
			if(deleteAttmResult > 0) {
				for(String rename : delRename) {
					deleteFile(rename);
				}
			}
			
			if(delRename.size() == deleteAttm.length) {
				existBeforeAttm = false;
			} else {
				for(int level : delLevel) {
					if(level == 0) {
						rService.updateAttmLevel(r.getRevNo());
						break;
					}
				}
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			Attachment a = list.get(i);
			a.setAttBno(r.getRevNo());
			
			if(existBeforeAttm) {
				a.setAttFno(1);
			} else {
				if(i == 0) {
					a.setAttFno(0);
				} else {
					a.setAttFno(1);
				}
			}
		}
		
		int updateReviewResult = rService.updateReview(r);
		int updateAttmResult = 0;
		if(!list.isEmpty()) {
			updateAttmResult = rService.insertAttm(list);
		}
		
		if(updateReviewResult + updateAttmResult == list.size()+1) {
			redirect.addAttribute("value", 1);
			return (!beforeURL.isEmpty()) ? "redirect:" + beforeURL : "redirect:reviewList.rv";
		} else {
			throw new Exception("리뷰 수정에 실패하였습니다.");
		}
	}
	
	@ResponseBody
	@GetMapping("insertReviewLike.rv")
	public String insertReviewLike(@RequestParam("memId") String memId, 
								   @RequestParam("revNo") int revNo) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("revNo", revNo);
		
		int result = rService.insertReviewList(map);
		
		int likeCount = 0;
		if(result > 0) {
			likeCount = rService.selectReviewLike(revNo);
		}
		
		return String.valueOf(likeCount);
	}
	
	@ResponseBody
	@GetMapping("deleteReviewLike.rv")
	public String deleteReviewLike(@RequestParam("memId") String memId, 
								   @RequestParam("revNo") int revNo) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("revNo", revNo);
		
		int result = rService.deleteReviewLike(map);
		
		int likeCount = 0;
		if(result > 0) {
			likeCount = rService.selectReviewLike(revNo);
		}
		
		return String.valueOf(likeCount);
	}
	
	@ResponseBody
	@GetMapping("selectReviewLike.rv")
	public String selectReviewLike(@RequestParam("revNo") int revNo) {
		
		int likeCount = rService.selectReviewLike(revNo);
		
		return String.valueOf(likeCount);
	}
	
	@ResponseBody
	@GetMapping("updateReviewCount.rv")
	public String updateReviewCount(@RequestParam("revNo") int revNo) {
		
		int result = rService.updateReviewCount(revNo);
		int count = 0;
		if(result > 0) {
			count = rService.getReviewCount(revNo);
		}
		
		return String.valueOf(count);
	}
	
	@ResponseBody
	@GetMapping("insertReply.rv")
	public String insertReple(@ModelAttribute Reply r) {
		
		int result = rService.insertReply(r);
		
		return result == 1 ? "success" : "fail";
		
	}
	
	@ResponseBody
	@GetMapping("updateReply.rv")
	public String updateReply(@ModelAttribute Reply r) {
		
		int result = rService.updateReply(r);
		
		return result == 1 ? "success" : "fail";
	}
	
	@ResponseBody
	@GetMapping("deleteReply.rv")
	public String deleteReply(@RequestParam("repNo") int repNo) {
		int result = rService.deleteReply(repNo);
		
		return result == 1 ? "success" : "fail";
	}
	
	@GetMapping("myReviewList.rv")
	public String goMyReviewList(HttpSession session, Model model,
								 @RequestParam(value = "revNo", required = false) Integer revNo,
								 @RequestParam(value="page", defaultValue="1") int page,
								 @RequestParam(value="listType", defaultValue = "reviewList") String listType,
								 @RequestParam(value="value", required = false) String value,
								 SearchReview sr) {
		
		sr.convertEmptyToNull();
		String memId = ((Member)session.getAttribute("loginUser")).getMemId();
		sr.setMemId(memId);
		ArrayList<Review> allRlist = rService.selectReviewAllList();
		ArrayList<Attachment> aList = rService.selectAttmList(null);
		ArrayList<HashMap<String, Object>> lList = rService.reviewLikeList();
		
		ArrayList<Review> rList = new ArrayList<Review>();
		ArrayList<Reply> pList = new ArrayList<Reply>();
		
		
		PageInfo revPi = new PageInfo();
		PageInfo repPi = new PageInfo();
		int revListCount = rService.getMyReviewListCount(sr);
		revPi = Pagination.getPageInfo(page, revListCount, 5);
		rList = rService.selectMyReviewList(sr, revPi);
		
		int repListCount = rService.getMyReplyListCount(sr);
		repPi = Pagination.getPageInfo(page, repListCount, 5);
		pList = rService.selectMyReplyList(sr, repPi);
		
		Review review = new Review();
		ArrayList<Reply> replyList = new ArrayList<Reply>();
		if(revNo != null) {
			review = rService.selectReview(revNo);
			replyList = rService.selectReplyList(revNo);
		}
		
		if(rList != null) {
			model.addAttribute("value", value);
			model.addAttribute("revListCount", revListCount);
			model.addAttribute("repListCount", repListCount);
			model.addAttribute("revPi", revPi);
			model.addAttribute("repPi", repPi);
			model.addAttribute("rList", rList);
			model.addAttribute("allRlist", allRlist);
			model.addAttribute("aList", aList);
			model.addAttribute("lList", lList);
			model.addAttribute("review", review);
			model.addAttribute("pList", pList);
			model.addAttribute("replyList", replyList);
			model.addAttribute("sr", sr);
			model.addAttribute("listType", listType);
			return "review/myReviewList";
		} else {
			throw new Exception("마이 페이지 조회에 실패하였습니다.");
		}
	}

}
