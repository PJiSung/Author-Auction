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
import com.kh.auction.user.model.vo.SearchArt;
import com.kh.auction.user.service.MainService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
   
   @Autowired
   MainService mService;
   
   private int count = 0;
   
   @GetMapping(value = "/")
   public String main(@RequestParam(value = "keyword", required = false) String keyword, Model model, HttpSession session) {
       // 장바구니 갯수 초기화
       String id = null;
       count = 0;
       
       // 세션에 로그인 정보가 있는 경우 장바구니 갯수 조회
       if (session.getAttribute("loginUser") != null) {
           id = ((Member) session.getAttribute("loginUser")).getMemId();
           count = mService.getWishCount(id);
       }

       // 서울 오픈 API 호출 및 데이터 처리
       StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
       StringBuilder sb = new StringBuilder();
       ArrayList<SearchArt> list = new ArrayList<>();

       try {
           urlBuilder.append("/" + URLEncoder.encode("69675a456f7374613930796c565365", "UTF-8"));
           urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8"));
           urlBuilder.append("/" + URLEncoder.encode("SemaPsgudInfoKorInfo", "UTF-8"));
           urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8"));
           urlBuilder.append("/" + URLEncoder.encode("100", "UTF-8"));
           URL url = new URL(urlBuilder.toString());
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
           conn.setRequestMethod("GET");
           conn.setRequestProperty("Content-type", "application/json");
           BufferedReader rd;

           if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
           JsonObject SemaPsgudInfoEngInfo = data.getAsJsonObject("SemaPsgudInfoKorInfo");
           JsonArray rows = SemaPsgudInfoEngInfo.getAsJsonArray("row");

           if (keyword == null || keyword.equals("")) {
               list = null;
           } else {
               for (JsonElement row : rows) {
                   JsonObject addressObject = row.getAsJsonObject();

                   String artNameEn = addressObject.get("prdct_nm_eng").getAsString();
                   String artNameKo = addressObject.get("prdct_nm_korean").getAsString();
                   String writerName = addressObject.get("writr_nm").getAsString();
                   String materials = addressObject.get("matrl_technic").getAsString();
                   String standard = addressObject.get("prdct_stndrd").getAsString();
                   String artImg = addressObject.get("main_image").getAsString();
                   String year = addressObject.get("mnfct_year").getAsString();

                   if (writerName.contains(keyword) || artNameEn.contains(keyword)) {
                       list.add(new SearchArt(artNameEn, artNameKo, writerName, materials, standard, artImg, year));
                   }
               }
           }

       } catch (Exception e) {
           e.printStackTrace();
       }

       // 모델에 속성 추가
       model.addAttribute("count", count);
       model.addAttribute("aList", mService.selectTopAuction());
       model.addAttribute("pList", mService.selectTopOrder());
       model.addAttribute("pAttmList", mService.selectTopOrderAttm());
       model.addAttribute("list", list);

       return "index";
   }
   
   @GetMapping(value = "/header")
   public String header(Model model, HttpSession session) {
       // "header"에 대한 로직
       handleCommonLogic(model, session, null); // "header"에는 키워드가 필요하지 않으므로 null 전달
       return "header"; // 실제로는 "header"로 리턴하도록 필요에 따라 수정하세요.
   }
   
   private void handleCommonLogic(Model model, HttpSession session, String keyword) {
	   String id = null;
	    count = 0;
	    if (session.getAttribute("loginUser") != null) {
	        id = ((Member) session.getAttribute("loginUser")).getMemId();
	        count = mService.getWishCount(id);
	    }

	    StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
	    StringBuilder sb = new StringBuilder();
	    ArrayList<SearchArt> list = new ArrayList<>();

	    try {
	        urlBuilder.append("/" + URLEncoder.encode("69675a456f7374613930796c565365", "UTF-8"));
	        urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8"));
	        urlBuilder.append("/" + URLEncoder.encode("SemaPsgudInfoKorInfo", "UTF-8"));
	        urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8"));
	        urlBuilder.append("/" + URLEncoder.encode("100", "UTF-8"));
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        BufferedReader rd;

	        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
	        JsonObject SemaPsgudInfoEngInfo = data.getAsJsonObject("SemaPsgudInfoKorInfo");
	        JsonArray rows = SemaPsgudInfoEngInfo.getAsJsonArray("row");

	        // 공통된 로직
	        model.addAttribute("count", count);
	        model.addAttribute("aList", mService.selectTopAuction());
	        model.addAttribute("pList", mService.selectTopOrder());
	        model.addAttribute("pAttmList", mService.selectTopOrderAttm());

	        // "list" 속성은 키워드에 따라 다르게 처리해야 하므로 main 메서드에서 추가
	        if (keyword != null && !keyword.equals("")) {
	            for (JsonElement row : rows) {
	                JsonObject addressObject = row.getAsJsonObject();
	                String artNameEn = addressObject.get("prdct_nm_eng").getAsString();
	                String writerName = addressObject.get("writr_nm").getAsString();

	                if (writerName.contains(keyword) || artNameEn.contains(keyword)) {
	                    list.add(new SearchArt(artNameEn, writerName));
	                }
	            }
	            model.addAttribute("list", list);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
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
   
   
   
}