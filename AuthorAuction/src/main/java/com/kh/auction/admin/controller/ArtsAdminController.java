package com.kh.auction.admin.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.auction.common.config.Pagination;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Product;
import com.kh.auction.user.model.vo.Sellstatic;
import com.kh.auction.user.service.ArtsService;

@Controller
public class ArtsAdminController {

	
	
	
	
	@Autowired
	ArtsService aService;
	
	
	
	
	 public static boolean isInteger(String strValue) {
		    try {
		      Integer.parseInt(strValue);
		      return true;
		    } catch (NumberFormatException ex) {
		      return false;
		    }
		  }

		  public static boolean isLong(String strValue) {
		    try {
		      Long.parseLong(strValue);
		      return true;
		    } catch (NumberFormatException ex) {
		      return false;
		    }
		  }
			
	
	
	@GetMapping("artsadmin.ar")
	public String artsadmin(Model model, @RequestParam(value = "page", defaultValue = "1") int page, 
							@RequestParam(value = "maxHeight", defaultValue = "0") int maxHeight,
							@RequestParam(value = "minHeight", defaultValue = "0") int minHeight,
							@RequestParam(value = "maxWidth", defaultValue = "0") int maxWidth,
							@RequestParam(value = "minWidth", defaultValue = "0") int minWidth,
							@RequestParam(value = "minPrice", defaultValue = "0") int minPrice,
							@RequestParam(value = "maxPrice", defaultValue = "0") int maxPrice,
							@RequestParam(value = "condition", defaultValue = "") String condition,
							@RequestParam(value = "keyword", defaultValue = "") String keyword,
							@RequestParam(value = "startDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date startDate,
							@RequestParam(value = "endDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date endDate) {
		
		
		
	
		
		
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		
		
		map.put("condition", condition.trim());
		map.put("keyword", keyword.trim());
		
		map.put("isInt", isInteger(keyword.trim()));
		
		
		map.put("maxHeight", maxHeight);
		map.put("minHeight", minHeight);
		map.put("maxWidth", maxWidth);
		map.put("minWidth", minWidth);
		map.put("minPrice", minPrice);
		map.put("maxPrice", maxPrice);
		map.put("condition", condition);
		map.put("startDate", startDate != null ?  new java.sql.Date(startDate.getTime()) : null);
		map.put("endDate", endDate != null ?  new java.sql.Date(endDate.getTime()) : null);
		
		 
		
		int currentPage = page;
		
		int listCount = aService.getlistCountadmin(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		ArrayList<Product> plist = aService.selectArtslistadmin(pi,map);
		
		
		ArrayList<Attachment> alist = null;
		if(!plist.isEmpty()) {
			alist= aService.selectAttmlist(plist);
		}
		model.addAttribute("alist", alist);
		model.addAttribute("plistsize", listCount);
		model.addAttribute("plist", plist);
		model.addAttribute("pi", pi);
//		
//		
		
		return "arts/artsAdmin";
		
	}
	
	
	@ResponseBody
	@GetMapping("deleteArts.ar")
	public String deleteArts(@RequestParam("proNo") int proNo) {
		
		int result = aService.deleteArts(proNo);
		if(result >0) {
		return "삭제 되었습니다";
		}else {
			return "삭제 실패";
		}
	}
	
	
	@GetMapping("artsInsert.ar")
	public String artsadminInsert() {
		
		
		return "arts/artsInsert";
	}
	
	@GetMapping("popup.ar")
	public String popup() {
		
		
		return "arts/popup";
	}
	
	
	@ResponseBody
	@PostMapping("insertArts.ar")
	public String insertArts(Product product, @RequestParam(value = "files", required = false) ArrayList<MultipartFile> files) {
		
		
		if(product.getProName() != null) {
			int result = aService.insertProduct(product);
		}
		
		
//			 첨부 파일 리스트를 담을 ArrayList를 생성
			ArrayList<Attachment> list = new ArrayList<>();
			// 업로드된 파일들에 대한 처리
			if (!files.isEmpty()) {
				for (int i =0; i<files.size(); i++) {
					
					if (!files.get(i).getOriginalFilename().equals("")) {
						// 파일을 저장하고 저장된 파일정보 가져옴
						String rename = saveFile(files.get(i), i);
						if (rename != null) {
							Attachment a = new Attachment();
							a.setAttBno(product.getProNo());
							a.setAttRename(rename);
							a.setAttCategory(4); 
							a.setAttFno(i+1); 
							list.add(a);
						}
					}
				}
			}
			
			for(Attachment a : list) {
				int result2 = aService.insertAttachment(a);
			}
			
		return "상품이 등록되었습니다.";
	}
	
	
	
	
	public String saveFile(MultipartFile upload, int i) {
		String root = "C:\\";
		String savePath = root + "\\uploadFiles";

//		String savePath = "/Users/kimgahyun/uploadFiles"; 				// 맥

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
		String renamePath = folder + "\\" + renameFileName; // 이름 변경

//		String renamePath = folder + File.separator + renameFileName;	// 맥

		try {
			upload.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return renameFileName;
	}
	
	
	@ResponseBody
	@PostMapping("editArts.ar")
	public String editArtsView(Product product, @RequestParam(value = "files", required = false) ArrayList<MultipartFile> files, @RequestParam(value = "attNos", required = false )int[] attNos, @RequestParam(value = "length", required = false) int length,
			@RequestParam(value = "thumimgName", required = false) String thumimgName, @RequestParam(value = "thumimgNo", required = false, defaultValue = "0") int thumimgNo, @RequestParam(value = "setthumlevel", required = false, defaultValue = "0") int setthumlevel) {

		int result = aService.updateArts(product);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
	if(attNos !=null) {
		
		map.put("proNo", product.getProNo());
		
		map.put("attNos", attNos);
		int result2 = aService.deleteAttachment(map);
		
	}
	
		HashMap<String,Object> tumbmap = new HashMap<String,Object>();
		
		if(setthumlevel == 1) {
			
			tumbmap.put("setthumlevel", 2);
			tumbmap.put("attFno", 1000);
			tumbmap.put("bNo", product.getProNo());
			int tmresult = aService.updateThumb(tumbmap);	
			
			tumbmap.remove("setthumlevel");
			tumbmap.put("setthumlevel", 1);
			tumbmap.put("thumimgNo", thumimgNo);
			int tmresult2 = aService.updateThumb(tumbmap);
			
		}
	
//		 첨부 파일 리스트를 담을 ArrayList를 생성
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		// 업로드된 파일들에 대한 처리
		if (files != null) {
			
			for (int i =0; i<files.size(); i++) {
				
				if (!files.get(i).getOriginalFilename().equals("")) {
					// 파일을 저장하고 저장된 파일정보 가져옴
					String rename = saveFile(files.get(i), i);
					if (rename != null) {
						Attachment a = new Attachment();
						a.setAttBno(product.getProNo());
						a.setAttRename(rename);
						a.setAttCategory(4); 
						if(files.get(i).getOriginalFilename().equals(thumimgName)) {
							a.setAttFno(1);
						}
						else {
							a.setAttFno(length+i+1); 
						}
						if(setthumlevel ==2 ) {
							tumbmap.put("setthumlevel", setthumlevel);
							tumbmap.put("attFno", length+i+1);
							tumbmap.put("bNo", product.getProNo());
							int tmresult = aService.updateThumb(tumbmap);
						}
						list.add(a);
					}
				}
			}
		}
		if(!list.isEmpty()) {
			for(Attachment a : list) {
				int result2 = aService.insertAttachment(a);
			}
		}
		
		return "수정 되었습니다.";
	}
	
	
	
	
	
	@GetMapping("test.ar")
	public String test(Model model) {
		
		ArrayList<Sellstatic> slist =    aService.selectSellstatic();
	
		ArrayList<Product> plist = new ArrayList<Product>();

		for(Sellstatic s : slist){

			Product p = aService.selectArts(s.getProNo());
		    plist.add(p);


		}
		
		model.addAttribute("slist", slist);
		model.addAttribute("plist", plist);
		
		return "arts/test";
		
	}
	
	
	@ResponseBody
	@GetMapping("findStatic.ar")
	public HashMap<String, Object> findStatic() {
		
		
	HashMap<String, Object> sellMap = new HashMap<>(); 
		
		Sellstatic sellstatic = aService.selectSelldata();
		
		
		
		Attachment attachment = aService.selectAttmlistforsell(sellstatic.getProNo());
		
		
		Gson gson = new Gson();
		
		String sellstaticJson = gson.toJson(sellstatic);
		String attachmentJson = gson.toJson(attachment);
		
		sellMap.put("sellstatic", sellstaticJson);
		sellMap.put("attachment", attachmentJson);
		
		return sellMap;
		
		
		
	}
	
	
	
	
	
	
	
}
