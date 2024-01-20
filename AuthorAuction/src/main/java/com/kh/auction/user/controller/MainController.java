package com.kh.auction.user.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.auction.common.config.Pagination;
import com.kh.auction.inquiry.handler.SocketHandler;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Product;
import com.kh.auction.user.model.vo.SearchArt;
import com.kh.auction.user.service.MainService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	//@Autowired
	//MemberService mService;
	
	@Autowired
	MainService mService;
	
	@GetMapping(value = "/")
	public String main(@RequestParam(value = "keyword", required = false) String keyword, Model model, HttpSession session) {
		
		//장바구니 갯수
//		String id = null;
//		if(session.getAttribute("loginUser") != null) {
//			id = ((Member)session.getAttribute("loginUser")).getMemId();
//			model.addAttribute("count", mService.getWishCount(id));
//		}
		
		StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
		StringBuilder sb = new StringBuilder();
		ArrayList<SearchArt> list = new ArrayList<>();
		try {
			urlBuilder.append("/" +  URLEncoder.encode("69675a456f7374613930796c565365","UTF-8") );
			urlBuilder.append("/" +  URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("SemaPsgudInfoKorInfo","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
			urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
			urlBuilder.append("/" + URLEncoder.encode("100","UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
			
			// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			
			JsonObject data = (JsonObject) JsonParser.parseString(sb.toString());
			JsonObject SemaPsgudInfoEngInfo = data.getAsJsonObject().get("SemaPsgudInfoKorInfo").getAsJsonObject();
			JsonArray rows = SemaPsgudInfoEngInfo.getAsJsonObject().get("row").getAsJsonArray();
			
			if(keyword == null || keyword.equals("")) {
				list = null;
			} else {
				for(JsonElement row : rows) {
					JsonObject addressObject = row.getAsJsonObject();
					
					String artNameEn = addressObject.get("prdct_nm_eng").getAsString();
					String artNameKo = addressObject.get("prdct_nm_korean").getAsString();
					String writerName = addressObject.get("writr_nm").getAsString();
					String materials = addressObject.get("matrl_technic").getAsString();
					String standard = addressObject.get("prdct_stndrd").getAsString();
					String artImg = addressObject.get("main_image").getAsString();
					String year = addressObject.get("mnfct_year").getAsString();
					
					
					if(writerName.contains(keyword) || artNameEn.contains(keyword)) {
						list.add(new SearchArt(artNameEn, artNameKo, writerName, materials, standard, artImg, year));
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("aList", mService.selectTopAuction());
		model.addAttribute("pList", mService.selectTopOrder()); // 인기상품 리스트
		model.addAttribute("pAttmList", mService.selectTopOrderAttm()); // 인기상품사진 리스트
		model.addAttribute("list", list); // 미술품 검색 리스트
		return "index";
	}
	
	@GetMapping("getWaiting")
	@ResponseBody
	public int getWaiting() {
		return SocketHandler.waiting;
	}
	
	@PostMapping("selectImg")
	@ResponseBody
	public String selectImg(@RequestParam("id") String id) {
		return mService.selectImg(id);
	}
	
	@GetMapping("directions.aa")
	public String goDirections() {
		return "common/directions";
	}
	
	@GetMapping("searchArts")
	public String searchArts(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "keyword", required = false) String keyword, Model model){
		StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
		StringBuilder sb = new StringBuilder();
		int currentPage = page;
		ArrayList<SearchArt> list = new ArrayList<>();
		ArrayList<SearchArt> pageList = new ArrayList<>();
		PageInfo pi = new PageInfo();
		try {
			urlBuilder.append("/" +  URLEncoder.encode("69675a456f7374613930796c565365","UTF-8") );
			urlBuilder.append("/" +  URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("SemaPsgudInfoKorInfo","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
			urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
			urlBuilder.append("/" + URLEncoder.encode("500","UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
			
			// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			
			JsonObject data = (JsonObject) JsonParser.parseString(sb.toString());
			JsonObject SemaPsgudInfoEngInfo = data.getAsJsonObject().get("SemaPsgudInfoKorInfo").getAsJsonObject();
			JsonArray rows = SemaPsgudInfoEngInfo.getAsJsonObject().get("row").getAsJsonArray();
			
			for(JsonElement row : rows) {
	            JsonObject addressObject = row.getAsJsonObject();

	            String artNameEn = addressObject.get("prdct_nm_eng").getAsString();
	            String artNameKo = addressObject.get("prdct_nm_korean").getAsString();
	            String writerName = addressObject.get("writr_nm").getAsString();
	            String materials = addressObject.get("matrl_technic").getAsString();
	            String standard = addressObject.get("prdct_stndrd").getAsString();
	            String artImg = addressObject.get("main_image").getAsString();
	            String year = addressObject.get("mnfct_year").getAsString();
	            
	            
	            if(keyword.equals("") || keyword == null) {
	            	list.add(new SearchArt(artNameEn, artNameKo, writerName, materials, standard, artImg, year));
	            }else if(writerName.contains(keyword) || artNameEn.contains(keyword)) {
	            	list.add(new SearchArt(artNameEn, artNameKo, writerName, materials, standard, artImg, year));
	            }
	        }
			pi = Pagination.getPageInfo(currentPage, list.size(), 9);
			int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			pageList = new ArrayList<>(list.subList(offset, Math.min(offset + limit, list.size())));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("total", list.size());
		model.addAttribute("keyword", keyword);
		model.addAttribute("pi", pi);
		model.addAttribute("list", pageList);
		return "common/searchArt";
	}
	
	@GetMapping("myPage")
	public String myPageSide() {
		return "common/myPageSide";
	}
	
}
