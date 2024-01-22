package com.kh.auction.user.controller;


import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.auction.common.config.Pagination;
import com.kh.auction.user.model.vo.Address;
import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Keyword;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.Order;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.Product;
import com.kh.auction.user.model.vo.Wishlist;
import com.kh.auction.user.service.ArtsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ArtsController {

	
	@Autowired
	ArtsService aService;
	
	@GetMapping("wishlist.ar")
	public String Artslist(Model model,HttpSession session) {
		
		String loginid = ((Member)session.getAttribute("loginUser")).getMemId();
		ArrayList<Wishlist> wlist = aService.selectWishlist(loginid);
		
		ArrayList<Product> plist = new ArrayList<Product>();
		
		for(Wishlist w : wlist) {
			
			Product p = new Product();
			p.setProNo(w.getProNo());
			plist.add(p);
			
		}
		
		
		ArrayList<Attachment> alist = null;
		
		if(!plist.isEmpty()) {
			alist = aService.selectAttmlist(plist);
		}
		
		model.addAttribute("alist", alist);
		model.addAttribute("loginid", loginid);
		model.addAttribute("wlist", wlist);
		model.addAttribute("wlistsize", wlist.size());
		
		return "arts/wishlist";
		
		
		
		
		
	}
	
	@GetMapping("artslist.ar")
	public String ArtsList(Model model, @RequestParam(value = "page", defaultValue = "1") int page,HttpServletRequest request, @ModelAttribute Keyword keyword, @RequestParam(value = "materiallist", required = false) String[] materiallist, @RequestParam(value = "order", required = false) String order, @RequestParam(value = "viewarts",defaultValue = "12") int viewarts) {
		
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword.getKeyword());
		map.put("minHeight", keyword.getMinHeight());
		map.put("maxHeight", keyword.getMaxHeight());
		map.put("minWidth", keyword.getMinWidth());
		map.put("maxWidth", keyword.getMaxWidth());
		map.put("maxPrice", keyword.getMaxPrice());
		map.put("minPrice", keyword.getMinPrice());
		map.put("materiallist", materiallist);
		map.put("order", order);	
		
		
		int currentPage = page;
		
		int listCount = aService.getlistCount(map);
		
		ArrayList<Product> plist = null;
		PageInfo pi = null;
		if(viewarts == 12) {
			
			pi = Pagination.getPageInfo(currentPage, listCount, 12);
			
			if(page > pi.getMaxPage()) {
				 pi.setCurrentPage(pi.getMaxPage());
			 	}
			if(page< pi.getStartPage()) {
				pi.setCurrentPage(pi.getStartPage());
			}
		
		plist = aService.selectArtslist(pi,map);
		
		}
		else if(viewarts == 30) {
			
		 pi = Pagination.getPageInfo(currentPage, listCount, 30);
			
		 if(page > pi.getMaxPage()) {
			 pi.setCurrentPage(pi.getMaxPage());
		 	}
		 if(page< pi.getStartPage()) {
				pi.setCurrentPage(pi.getStartPage());
			}
			plist = aService.selectArtslist(pi,map);
			
		}
		ArrayList<Attachment> alist = null;
		if(!plist.isEmpty()) {
			alist= aService.selectAttmlist(plist);
		}
		model.addAttribute("alist", alist);
		model.addAttribute("order", order);
		model.addAttribute("keyword", keyword);
		model.addAttribute("materiallist", materiallist);
		model.addAttribute("plistsize", listCount);
		model.addAttribute("plist", plist);
		model.addAttribute("loc", request.getRequestURI());
		model.addAttribute("pi", pi);
		
		return "arts/artslist";
		
	}
	
	@GetMapping("artsDetail.ar")
	public String ArtsDetail(@RequestParam("proNo") int proNo,Model model,HttpSession session) {
		
		Product p = aService.selectArts(proNo);
		String loginid = ((Member)session.getAttribute("loginUser")).getMemId();
		
		
		Wishlist w = new Wishlist();
		
		w.setMemId(loginid);
		w.setProNo(proNo);
		
		int countwis = aService.selectWish(w);
		
		ArrayList<Product> plist = new ArrayList<Product>();
		plist.add(p);
		
		ArrayList<Attachment> alist = null;
		if(!plist.isEmpty()) {
		 alist = aService.selectAttmlist(plist);
		}
		
		
		
		ArrayList<Product> mimiclist =  aService.selectMimicArts(proNo);
		ArrayList<Attachment> mimicAlist = null;
		if(!mimiclist.isEmpty()) {
			
			mimicAlist = aService.selectAttmlist(mimiclist);
			model.addAttribute("length", (int)Math.ceil((float)mimiclist.size()/3));
		}
		
		
		model.addAttribute("mimiclist", mimiclist);
		model.addAttribute("mimicAlist", mimicAlist);
		model.addAttribute("alist", alist);
		model.addAttribute("p", p);
		model.addAttribute("loginid", loginid);
		model.addAttribute("countwis", countwis);
		
		return "arts/artsdetail";
		
	}
	
	@GetMapping("payment.ar")
	public String payment(HttpSession session, Model model) {
		
		
		ArrayList<Wishlist> wlist = aService.selectWishlist(((Member)session.getAttribute("loginUser")).getMemId());
		
		ArrayList<Address> alist = aService.selectAddresslist(((Member)session.getAttribute("loginUser")).getMemId());
		
		
		ArrayList<Address> aolist = new ArrayList<Address>();
		
		for(Address a : alist) {
			
			if(a.getAddDefault().equals("X")) {
				aolist.add(a);
			
			}
		}
		alist.removeAll(aolist);
		
		int point = aService.selectPoint(((Member)session.getAttribute("loginUser")).getMemId());
		
		for(int i=0; i<alist.size(); i++) {
			
			if(alist.get(i).getAddDefault().equals("Y")) {
				
				Address a = alist.get(0);
				Address b = alist.get(i);
				
				alist.set(0,b);
				alist.set(i, a);
			}
			
		}
		
		ArrayList<Product> plist = new ArrayList<Product>();
		for(Wishlist w : wlist) {
			
			Product p = new Product();
			p.setProNo(w.getProNo());
			plist.add(p);
		}
		ArrayList<Attachment> atlist = null;
		if(!plist.isEmpty()) {
			atlist = aService.selectAttmlist(plist);
			
		}
		
		model.addAttribute("aolist", aolist);
		model.addAttribute("point", point);
		model.addAttribute("atlist", atlist);
		model.addAttribute("wlist", wlist);
		model.addAttribute("alist", alist);
		
		return "arts/payment";
	}
	
	@GetMapping("payresult.ar")
	public String payresult(
			Model model, HttpSession session, Order order,@RequestParam("postcode") int postcode,
			@RequestParam("address") String address,@RequestParam("receiver") String receiver,@RequestParam("receiverPhone") String receiverPhone,
			@RequestParam("wisAmountfororder") int[] wisAmountfororder, @RequestParam("pronofororder") int[] pronofororder,@RequestParam("pointBonus") int pointBonus
			) {
		
		String serverip = null;
		try {
			serverip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("serverip", serverip);
		
		HashMap<String, Object> pm = new HashMap<String,Object>();
		pm.put("pointBonus", pointBonus);
		pm.put("memId", ((Member)session.getAttribute("loginUser")).getMemId());
		pm.put("usedPoint",order.getOrdPoPrice());
		
		
		int pointresult = aService.updatepointBonus(pm);
		
		HashMap<String,Object> accmap = new HashMap<String,Object>();
		accmap.put("memId", ((Member)session.getAttribute("loginUser")).getMemId());
		accmap.put("amount", order.getOrdPoPrice()+order.getOrdCaPrice());
		
		
		int memAccresult = aService.updatememAcc(accmap);
		
		
		if((int)accmap.get("memAcc") >=500) {
			accmap.put("grade", "Gold");
			int raresult = aService.updateGrade(accmap);
			
		}
		
		else if((int)accmap.get("memAcc") >=200) {
			accmap.put("grade", "Silver");
			int raresult = aService.updateGrade(accmap);
		}
		
		
		
		
		HashMap<String,Object> rmap = new HashMap<String,Object>();
		
		
		
		rmap.put("address", postcode+"@"+address);
		rmap.put("receiverPhone", receiverPhone);
		rmap.put("receiver", receiver);
		rmap.put("memId", ((Member)session.getAttribute("loginUser")).getMemId());
		rmap.put("ordNo", order.getOrdNo());
		
		
		if(order.getAddNo() == 0) {
		int resultadd = aService.insertAddress(rmap);
		order.setAddNo((int)rmap.get("addNo"));
		}
		
		int result = aService.insertOrder(order);
		
		
		for(int i =0; i<pronofororder.length; i++) {
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("ordNo", order.getOrdNo());
			map.put("proNos", (Integer)pronofororder[i]);
			map.put("odtNum", (Integer)wisAmountfororder[i]);
			
			int resultqq = aService.updateProductamount(map);
			int resultweq = aService.insertOrderDetail(map);
			
		}
		
		
		
		String loginid = ((Member)session.getAttribute("loginUser")).getMemId();
		
		
		int resultwis = aService.deletewisAll(loginid);
		
		
		
		
		model.addAttribute("orderNo", order.getOrdNo());
		model.addAttribute("OrdSumPrice", order.getOrdCaPrice());
		model.addAttribute("ordPoPrice", order.getOrdPoPrice());
		model.addAttribute("pointBonus", pointBonus);
		model.addAttribute("address", address);
		model.addAttribute("receiver", receiver);
		
		
    	
		return "arts/payresult";
	}
	
	@ResponseBody
	@GetMapping("updatewishamount.ar")
	public String updatewishlist(Wishlist updatewis) {
		int result = aService.updatewishlist(updatewis);
		
		return "수량을 변경하였습니다";
	}
	
	@GetMapping("deletewis.ar")
	public String deletewis(Wishlist deletewis, HttpSession session) {
		
		String memId = ((Member)session.getAttribute("loginUser")).getMemId();
		int result = aService.deletewis(deletewis);
		if(result > 0) {
			session.setAttribute("cartCount", aService.getWishCount(memId));
		}

		
		return "redirect:wishlist.ar";
		
	}
	
	
	@GetMapping("deletewishlist.ar")
	public String deletewishlist(@RequestParam("memId") String memId, @RequestParam("pronos") Integer[] pronos, HttpSession session) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("memId", memId);
		map.put("pronos", pronos);
		
		int result = aService.deletewishlist(map);
		 
		return "redirect:wishlist.ar";
	}
	
	
	@ResponseBody
	@GetMapping("addtowishlist.ar")
	public String addtowishlist(Wishlist addwis, HttpSession session) {
		
		String memId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		int result = aService.addtowishlist(addwis);
		if(result > 0) {
			session.setAttribute("cartCount", aService.getWishCount(memId));
		}
		
		
		
		
		return "장바구니에 상품이 추가되었습니다.";
	}
	
	
	
	
	@GetMapping("directPayment.ar")
	public String payment(HttpSession session, Model model, Product product, @RequestParam("amount") int amount) {
		
		
		
		
		ArrayList<Address> alist = aService.selectAddresslist(((Member)session.getAttribute("loginUser")).getMemId());
		

		ArrayList<Address> aolist = new ArrayList<Address>();
		
		for(Address a : alist) {
			
			if(a.getAddDefault().equals("X")) {
				aolist.add(a);
			
			}
		}
		alist.removeAll(aolist);
		
		
		int point = aService.selectPoint(((Member)session.getAttribute("loginUser")).getMemId());
		
		for(int i=0; i<alist.size(); i++) {
			
			if(alist.get(i).getAddDefault().equals("Y")) {
				
				Address a = alist.get(0);
				Address b = alist.get(i);
				
				alist.set(0,b);
				alist.set(i, a);
			}
			
		}
		
		
		Product p = aService.selectArts(product.getProNo());
		
		ArrayList<Product> plist = new ArrayList<Product>();
		
		plist.add(p);
		
		ArrayList<Attachment> atlist  = null;
		
		if(!plist.isEmpty()) {
			atlist = aService.selectAttmlist(plist);
		}
		
		model.addAttribute("aolist", aolist);
		model.addAttribute("point", point);
		model.addAttribute("alist", alist);
		model.addAttribute("atlist", atlist);
		model.addAttribute("p", p);
		model.addAttribute("amount", amount);
		
		
		return "arts/directpayment";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("directpayresult.ar")
	public String directpayresult(Model model, HttpSession session, @RequestParam("impUid") String imp_uid, Order order,@RequestParam("postcode") int postcode,
			@RequestParam("address") String address,@RequestParam("receiver") String receiver,@RequestParam("receiverPhone") String receiverPhone,
			@RequestParam("wisAmountfororder") int[] wisAmountfororder, @RequestParam("pronofororder") int[] pronofororder,@RequestParam("pointBonus") int pointBonus) {
		
		
		HashMap<String, Object> pm = new HashMap<String,Object>();
		pm.put("pointBonus", pointBonus);
		pm.put("memId", ((Member)session.getAttribute("loginUser")).getMemId());
		pm.put("usedPoint",order.getOrdPoPrice());
		
		
		int pointresult = aService.updatepointBonus(pm);
		
		int result = aService.insertOrder(order); 
		
		
		
		HashMap<String,Object> rmap = new HashMap<String,Object>();
		
		
		
		rmap.put("address", postcode+"@"+address);
		rmap.put("receiverPhone", receiverPhone);
		rmap.put("receiver", receiver);
		rmap.put("memId", ((Member)session.getAttribute("loginUser")).getMemId());
		rmap.put("ordNo", order.getOrdNo());
		
		int resultadd = aService.insertAddress(rmap);
		
		
		
		
		for(int i =0; i<pronofororder.length; i++) {
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("ordNo", order.getOrdNo());
			map.put("proNos", (Integer)pronofororder[i]);
			map.put("odtNum", (Integer)wisAmountfororder[i]);
			
			int resultqq = aService.updateProductamount(map);
			int resultweq = aService.insertOrderDetail(map);
			
		}
		
		
		
		
		
		model.addAttribute("orderNo", order.getOrdNo());
		model.addAttribute("OrdSumPrice", order.getOrdCaPrice());
		model.addAttribute("ordPoPrice", order.getOrdPoPrice());
		model.addAttribute("pointBonus", pointBonus);
		model.addAttribute("address", address);
		model.addAttribute("receiver", receiver);
		
		
    	
		return "arts/payresult";
	}
	
	
	
	
	@RequestMapping("pointpayment.ar")
	public String pointpayment(Model model,HttpSession session) {
		
		int point = aService.selectPoint(((Member)session.getAttribute("loginUser")).getMemId());
		
		model.addAttribute("point", point);
		
		return "arts/pointpayment";
	}
	
	
	
	
	
	
	@ResponseBody
	@GetMapping("pointpayresult.ar")
	public String pointpayresult(HttpSession session, @RequestParam("amount") int amount, @RequestParam("imp_uid") String imp_uid){
		
		
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		
		map.put("memId", ((Member)session.getAttribute("loginUser")).getMemId());
		map.put("amount", amount);
		
		int result = aService.updatePoint(map);
		
		
		
		
		if((int)map.get("memAcc") >=500) {
			map.put("grade", "Gold");
			int raresult = aService.updateGrade(map);
			
		}
		
		else if((int)map.get("memAcc") >=200) {
			map.put("grade", "Silver");
			int raresult = aService.updateGrade(map);
		}
		
		
		
		
		
		
		return ""+amount+"";
		
	}
	
	
	
	
	
	
	
	
}
