package com.kh.auction.member.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.auction.member.service.MemberService;
import com.kh.auction.user.model.vo.Address;
import com.kh.auction.user.model.vo.Member;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MemberController {

	@Autowired
	MemberService mService;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@Autowired
	private JavaMailSender mailSender;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private ArrayList<Address> kakaoAlist = new ArrayList<>();
	private Member kakaoMinfo = new Member();

	@GetMapping("loginView")
	public String loginView() {
		return "member/login";
	}
	
	@GetMapping("kakaoLogin")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session, Model model, @RequestParam(value = "beforeURL", required = false) String beforeURL) throws Exception {
		String access_Token = mService.getAccessToken(code);
		HashMap<String, Object> userInfo = mService.getUserInfo(access_Token);
		
		kakaoAlist = (ArrayList<Address>) userInfo.get("aList");
		kakaoMinfo = (Member) userInfo.get("m");
		kakaoMinfo.setMemRating("Bronze");
		
		
		ArrayList<Member> mList = mService.kakaoLogin(kakaoMinfo);
		boolean checkExist = false;
		String existId = null;
		if(mList.size() > 0) { // 계정이 있음
			for(int i=0; i<mList.size(); i++) {
				if(mList.get(i).getMemPwd().equals("kakao")) {
					session.setAttribute("loginUser", kakaoMinfo);
					checkExist = true;
				}else{
					existId = mList.get(i).getMemId();
				}
			}
			if(checkExist == true) {
				return "index";
			} else {
				model.addAttribute("id", existId);
				return "member/kakaoLogin";
			}
		} else {
			return "member/kakaoLogin";
		}
    }
	
	@GetMapping("kakaoEnroll")
	public String kakaoEnroll(HttpSession session) throws Exception {
		int addResult = mService.insertKakaoAddress(kakaoAlist);
		int memResult = mService.insertKakaoMember(kakaoMinfo);
	
		if(addResult + memResult > 1) {
			session.setAttribute("loginUser", kakaoMinfo);
			kakaoAlist = null;
			kakaoMinfo = null;
			return "redirect:/"; 
		} else { 
			throw new Exception("카카오 회원가입 실패"); 
		}
	}
	
	@PostMapping("login")
	public String login(Member m, HttpSession session, Model model) {
		Member loginUser = mService.login(m);
		if (loginUser != null) {
			if (bcrypt.matches(m.getMemPwd(), loginUser.getMemPwd())) {
				logger.info(loginUser.getMemId());
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("cartCount", mService.getWishCount(m.getMemId()));
				return "redirect:/";
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
				return "member/login";
			}
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "member/login";
		}
	}
	

	@GetMapping("authenticationView") // 회원가입 초기화면 enroll XX
	public String authenticationView() {
		return "member/authentication";
	}

	@GetMapping("authentication")
	@ResponseBody
	public int authentication(@RequestParam("phone") String phone) {
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSOPALGYRIMP6MF", "CBCSVEVQREQII6WLGDMTWIOPM3DWASHL", "https://api.solapi.com");
		Message message = new Message();
		message.setFrom("01068938300");
		message.setTo(phone);
		Random r = new Random();
		int authNum = r.nextInt(888888) + 111111;
		message.setText("[Author Auction] 인증번호 ["+authNum+"]를 입력해주세요.");

		try {
		  messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage());
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		}
		return authNum;
	}

	@GetMapping("agreement")
	public String agreement(@RequestParam("phone") String phone, Model model) {
		model.addAttribute("phone", phone);
		return "member/agreement";
	}

	@GetMapping("enroll")
	public String enroll(@RequestParam("phone") String phone, Model model) {
		model.addAttribute("phone", phone);
		return "member/enroll";
	}

	@GetMapping("checkId")
	@ResponseBody
	public int checkId(@RequestParam("memId") String memId) {
		int count = mService.checkId(memId);
		return count;
	}

	@GetMapping("checkNickName")
	@ResponseBody
	public int checkNickName(@RequestParam("memNickName") String memNickName) {
		int count = mService.checkNickName(memNickName);
		return count;
	}

	@PostMapping("insertMember")
	public String insertMember(@ModelAttribute Member m) throws Exception {
		byte[] decodedBytes = Base64.getDecoder().decode(m.getMemPhone());
		String phone = new String(decodedBytes, StandardCharsets.UTF_8);
		m.setMemPhone(phone.replace("-", ""));
		m.setMemPwd(bcrypt.encode(m.getMemPwd()));
		m.setMemFileName("member/images/defaultProfile.svg");
		int result1 = mService.insertMemeber(m);
		
		Address a = new Address();
		a.setAddName("집");
		a.setAddRecipient(m.getMemName());
		a.setAddAddress(m.getMemAddress());
		a.setAddPhone(m.getMemPhone());
		a.setAddDefault("Y");
		a.setMemId(m.getMemId());
		int result2 = mService.insertFirstAddress(a);
		
		if (result1 > 0 && result2 > 0) {
			return "member/enrollComplete";
		} else {
			throw new Exception("회원가입 실패");
		}
		
	}

	@GetMapping("findIdView")
	public String findIdView() {
		return "member/findId";
	}

	@GetMapping("findIdbyPhone")
	@ResponseBody
	public int findIdbyPhone(@RequestParam("arr[]") String[] arr) {
		int authNum = 0;
		Member m = new Member();
		m.setMemName(arr[0]);
		m.setMemPhone(arr[1]);
		Member mem = mService.findMyInfo(m);
		if (mem != null) {
			DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSOPALGYRIMP6MF", "CBCSVEVQREQII6WLGDMTWIOPM3DWASHL", "https://api.solapi.com");
			Message message = new Message();
			message.setFrom("01068938300");
			message.setTo(m.getMemPhone());
			
			Random r = new Random();
		    authNum = r.nextInt(888888) + 111111;
		    message.setText("[Author Auction] 인증번호 ["+authNum+"]를 입력해주세요.");

			try {
			  messageService.send(message);
			} catch (NurigoMessageNotReceivedException exception) {
			  System.out.println(exception.getFailedMessageList());
			  System.out.println(exception.getMessage());
			} catch (Exception exception) {
			  System.out.println(exception.getMessage());
			}
		}
		return authNum;
	}

	@GetMapping("findIdbyEmail")
	@ResponseBody
	public int findIdbyEmail(@RequestParam("arr[]") String[] arr) {
		int checkNum = 0;
		Member m = new Member();
		m.setMemName(arr[0]);
		m.setMemEmail(arr[1]);
		Member mem = mService.findMyInfo(m);
		if(mem != null) {
			Random r = new Random();
			checkNum = r.nextInt(888888) + 111111;
			String subject = "인증 코드";
			String content = "<h1>Author Auction</h1><br>고객님의 인증 코드는 다음과 같습니다.<br><h1>" + checkNum +"</h1>";
			String from = "park718513@naver.com";
			String to = arr[1];
			
			try {
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
				mailHelper.setFrom(from); 
				mailHelper.setTo(to);
				mailHelper.setSubject(subject); 
				mailHelper.setText(content, true);
				mailSender.send(mail);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return checkNum;
	}
	
	@GetMapping("showId")
	public String showId(Member m, Model model) {
		Member mem = mService.findMyInfo(m);
		model.addAttribute("m", mem);
		return "member/showId";
	}
	
	@GetMapping("findPwView")
	public String findPwView() {
		return "member/findPw";
	}
	
	@GetMapping("findPwbyPhone")
	@ResponseBody
	public int findPwbyPhone(@RequestParam("arr[]") String[] arr) {
		int authNum = 0;
		Member m = new Member();
		m.setMemId(arr[0]);
		m.setMemPhone(arr[1]);
		Member mem = mService.findMyInfo(m);
		if (mem != null) {
			DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSOPALGYRIMP6MF", "CBCSVEVQREQII6WLGDMTWIOPM3DWASHL", "https://api.solapi.com");
			Message message = new Message();
			message.setFrom("01068938300");
			message.setTo(m.getMemPhone());
			
			Random r = new Random();
		    authNum = r.nextInt(888888) + 111111;
		    message.setText("[Author Auction] 인증번호 ["+authNum+"]를 입력해주세요.");

			try {
			  messageService.send(message);
			} catch (NurigoMessageNotReceivedException exception) {
			  System.out.println(exception.getFailedMessageList());
			  System.out.println(exception.getMessage());
			} catch (Exception exception) {
			  System.out.println(exception.getMessage());
			}
		}
		return authNum;
	}

	@GetMapping("findPwbyEmail")
	@ResponseBody
	public int findPwbyEmail(@RequestParam("arr[]") String[] arr) {
		int checkNum = 0;
		Member m = new Member();
		m.setMemId(arr[0]);
		m.setMemEmail(arr[1]);
		Member mem = mService.findMyInfo(m);
		if(mem != null) {
			Random r = new Random();
			checkNum = r.nextInt(888888) + 111111;
			String subject = "인증 코드";
			String content = "<h1>Author Auction</h1><br>고객님의 인증 코드는 다음과 같습니다.<br><h1>" + checkNum +"</h1>";
			String from = "park718513@naver.com";
			String to = arr[1];
			try {
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
				mailHelper.setFrom(from); 
				mailHelper.setTo(to);
				mailHelper.setSubject(subject); 
				mailHelper.setText(content, true);
				mailSender.send(mail);
			} catch (Exception e) {
				e.printStackTrace(); 
			}
		}
		return checkNum;
	}
	
	@GetMapping("updatePwView")
	public String updatePwView(Member m, Model model) {
		Member mem = mService.findMyInfo(m);
		if(mem != null) {
			model.addAttribute("id", mem.getMemId());
		}
		return "member/updatePw";
	}
	
	@PostMapping("updatePw")
	public String updatePwView(Member m) throws Exception{
		m.setMemPwd(bcrypt.encode(m.getMemPwd()));
		int result = mService.updatePwd(m);
		if(result > 0) {
			return "redirect:loginView";
		} else {
			throw new Exception("비밀번호 변경 실패");
		}
	}
	
	@GetMapping("enrollAddress")
	public String myAddress() {
		return "member/enrollAddress";
	}
	
	@PostMapping("insertAddress")
	public String insertAddress(Address a, RedirectAttributes ratt) throws Exception {
		int result = mService.insertAddress(a);
		if(result > 0) {
			ratt.addAttribute("tab", 2);
			return "redirect:myInfo";
		} else {
			throw new Exception("배송지 등록 실패");
		}
	}
	
	@GetMapping("myInfo")
	public String addList(HttpSession session, Model model, @RequestParam(value="tab", defaultValue="1") int tab) throws Exception {
		String id = ((Member)session.getAttribute("loginUser")).getMemId();
		ArrayList<Address> list = mService.selectAddressList(id);
		if(list != null) {
			model.addAttribute("tab", tab);
			model.addAttribute("list", list);
			return "member/myInfo";
		}else {
			throw new Exception("배송지 조회 실패");
		}
	}
	
	@GetMapping("updateAddressView")
	public String updateAddressView(@RequestParam("addNo") int addNo, Model model) throws Exception {
		Address a = mService.selectAddress(addNo);
		if(a != null) {
			model.addAttribute("a", a);
			return "member/updateAddress";
		}else{
			throw new Exception("배송지 불러오기 실패");
		}
	}
	
	@PostMapping("updateAddress")
	public String updateAddress(Address a, RedirectAttributes ratt) throws Exception {
		int result = mService.updateAddress(a);
		if(result > 0) {
			ratt.addAttribute("tab", 2);
			return "redirect:myInfo";
		} else {
			throw new Exception("배송지 업데이트 실패");
		}
	}
	
	@GetMapping("deleteAddress")
	public String deleteAddress(@RequestParam("addNo") int addNo, RedirectAttributes ratt) throws Exception {
		int result = mService.deleteAddress(addNo);
		if(result > 0) {
			ratt.addAttribute("tab", 2);
			return "redirect:myInfo";
		} else {
			throw new Exception("배송지 삭제 실패");
		}
	}
	
	@PostMapping("checkPwd")
	@ResponseBody
	public String checkPwd(@RequestParam("pwd") String pwd, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		if (bcrypt.matches(pwd, loginUser.getMemPwd())) {
			return "success";
		}
		return "fail";
	}
	
	@PostMapping("updatePwd")
	public String updatePwd(@RequestParam("newPw") String newPw, HttpSession session) throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		loginUser.setMemPwd(bcrypt.encode(newPw));
		int result = mService.updatePwd(loginUser);
		if(result > 0) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:myInfo";
		} else {
			throw new Exception("비밀번호 변경 실패");
		}
	}
	
	@GetMapping("deleteMemberView")
	public String deletememberView() {
		return "member/deleteMember";
	}
	
	@GetMapping("deleteMember")
	public String deleteMember(HttpSession session) throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int result = mService.deleteMember(loginUser.getMemId());
		if(result > 0) {
			session.invalidate();
			return "redirect:/";
		} else {
			throw new Exception("회원 탈퇴 실패");
		}
	}
	
	@GetMapping("emailAuthentication")
	@ResponseBody
	public int emailAuthentication(@RequestParam("email") String email){
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		String subject = "인증 코드";
		String content = "<h1>Author Auction</h1><br>고객님의 인증 코드는 다음과 같습니다.<br><h1>" + checkNum +"</h1>";
		String from = "park718513@naver.com";
		String to = email;
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			mailHelper.setFrom(from); 
			mailHelper.setTo(to);
			mailHelper.setSubject(subject); 
			mailHelper.setText(content, true);
			mailSender.send(mail);
		} catch (Exception e) {
			checkNum = 0;
			e.printStackTrace();
		}
		return checkNum;
	}
	
	@GetMapping("updateMember")
	@ResponseBody
	public int updateMember(Member m, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		m.setMemId(loginUser.getMemId());
		int result = mService.updateMember(m);
		if(result > 0) {
			if(m.getMemNickName() != null) {
				loginUser.setMemNickName(m.getMemNickName());
			}else if(m.getMemName() != null) {
				loginUser.setMemName(m.getMemName());
			}else if(m.getMemEmail() != null) {
				loginUser.setMemEmail(m.getMemEmail());
			}else if(m.getMemPhone() != null) {
				loginUser.setMemPhone(m.getMemPhone());
			}else if(m.getMemAddress() != null) {
				loginUser.setMemAddress(m.getMemAddress());
			}
			session.setAttribute("loginUser", loginUser);
		}
		return result;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("updateMemImg")
	@ResponseBody
	public String updateMemImg(@RequestParam("file") MultipartFile file, HttpSession session) {
		if(!file.isEmpty()) {
			String id = ((Member)session.getAttribute("loginUser")).getMemId();
			String sessionFile = ((Member)session.getAttribute("loginUser")).getMemFileName();
			if(sessionFile != null) {
				deleteFile(sessionFile);
			}
			String reName = saveFile(file, id);
			Member m = new Member();
			m.setMemId(id);
			m.setMemFileName(reName);
			int result = mService.updateMemImg(m);
			if(result > 0) {
				((Member)session.getAttribute("loginUser")).setMemFileName(reName);
				return reName;
			} else {
				return null;
			}
		} else {
			return null;
		}
	}
	
	@PostMapping("deleteMemImg")
	@ResponseBody
	public int deleteMemImg(HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getMemId();
		String file = ((Member)session.getAttribute("loginUser")).getMemFileName();
		deleteFile(file);
		int result = mService.deleteMemImg(id);
		if(result > 0) {
			((Member)session.getAttribute("loginUser")).setMemFileName("member/images/defaultProfile.svg");
			return 1;
		} else {
			return 0;
		}
	}
	
	public String saveFile(MultipartFile file, String id) {
		String root = "C:\\";
		String savaPath = root + "\\uploadFiles";
		
		File folder = new File(savaPath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		String originFileName = file.getOriginalFilename();
		String renameFileName = id + originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
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
		File f = new File(savaPath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
}
