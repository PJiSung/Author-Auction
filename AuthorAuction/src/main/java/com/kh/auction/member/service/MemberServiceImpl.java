package com.kh.auction.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.auction.member.dao.MemberDAO;
import com.kh.auction.user.model.vo.Address;
import com.kh.auction.user.model.vo.Inquiry;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.SearchMember;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO mDao;

	@Override
	public int insertMemeber(Member m) {
		return mDao.insertMember(m);
	}

	@Override
	public int checkId(String memId) {
		return mDao.checkId(memId);
	}

	@Override
	public int checkNickName(String memNickName) {
		return mDao.checkNickName(memNickName);
	}

	@Override
	public Member login(Member m) {
		return mDao.login(m);
	}

	@Override
	public Member findMyInfo(Member m) {
		return mDao.findMyInfo(m);
	}

	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(m);
	}

	@Override
	public int insertAddress(Address a) {
		int result = 0;
		if(a.getAddDefault().equals("Y")) {
			Address updateA = new Address();
			updateA.setAddDefault("N");
			updateA.setMemId(a.getMemId());
			result = mDao.updateAddressDefault(updateA);
			
			if(result > 0) {
				return mDao.insertAddress(a);
			}else {
				return 0;
			}
		}else {
			return mDao.insertAddress(a);
		}
	}

	@Override
	public ArrayList<Address> selectAddressList(String id) {
		return mDao.selectAddressList(id);
	}

	@Override
	public Address selectAddress(int addNo) {
		return mDao.selectAddress(addNo);
	}

	@Override
	public int updateAddress(Address a) {
		int result = 0;
		if(a.getAddDefault().equals("Y")) {
			Address updateA = new Address();
			updateA.setAddDefault("N");
			updateA.setMemId(a.getMemId());
			result = mDao.updateAddressDefault(updateA);
			
			if(result > 0) {
				return mDao.updateAddress(a);
			}else {
				return 0;
			}
		}else {
			return mDao.updateAddress(a);
		}
	}

	@Override
	public int deleteMember(String memId) {
		return mDao.deleteMember(memId);
	}

	@Override
	public int deleteAddress(int addNo) {
		return mDao.deleteAddress(addNo);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}

	@Override
	public int updateMemImg(Member m) {
		return mDao.updateMemImg(m);
	}

	@Override
	public int deleteMemImg(String id) {
		return mDao.deleteMemImg(id);
	}

	@Override
	public int getListCount(SearchMember sm) {
		return mDao.getListCount(sm);
	}

	@Override
	public ArrayList<Member> selectMemberList(SearchMember sm, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mDao.selectMemberList(sm, rowBounds);
	}

	@Override
	public int deleteMembers(String[] ids) {
		return mDao.deleteMembers(ids);
	}

	@Override
	public int sortMemberList(String status) {
		return mDao.sortMemberList(status);
	}

	@Override
	public int updateMemberIsAdmin(Member m) {
		return mDao.updateMemberIsAdmin(m);
	}

	@Override
	public int insertFirstAddress(Address a) {
		return mDao.insertAddress(a);
	}

	@Override
	public Member selectMember(String id) {
		return mDao.selectMember(id);
	}

	@Override
	public int updateMemberByAdmin(Member m) {
		return mDao.updateMemberByAdmin(m);
	}

	@Override
	public String selectImg(String id) {
		return mDao.selectImg(id);
	}

	@Override
	public int getiListCount(HashMap<String, Object> map) {
		return mDao.getiListCount(map);
	}

	@Override
	public ArrayList<Inquiry> selectInquiryList(HashMap<String, Object> map, PageInfo iPi) {
		int offset = (iPi.getCurrentPage() -1)*iPi.getBoardLimit();
		int limit = iPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
	
		return mDao.selectInquiryList(map, rowBounds);
	}

	@Override
	public String selectInquiry(int inqNo) {
		return mDao.selectInquiry(inqNo);
	}

	@Override
	public String getAccessToken(String code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=dc1a5dc127d59d833c26f234e1fc06ae"); //본인이 발급받은 key
			//sb.append("&redirect_uri=http://localhost/kakaoLogin"); // 본인이 설정한 주소
			sb.append("&redirect_uri=http://192.168.20.214/kakaoLogin"); // 본인이 설정한 주소
            
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonElement element = JsonParser.parseString(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {
	    HashMap<String, Object> userInfo = new HashMap<String, Object>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    String addressURL = "https://kapi.kakao.com/v1/user/shipping_address";
	    try {
	    	//배송지
	    	URL url = new URL(addressURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");

	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	        int responseCode = conn.getResponseCode();

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	        String line;
	        StringBuilder result = new StringBuilder();

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }
	        br.close(); // BufferedReader 닫기
	        
	        ArrayList<Address> aList = new ArrayList<>();
	        JsonElement element = JsonParser.parseString(result.toString());
	        JsonElement objElement = element.getAsJsonObject().get("shipping_addresses");
	        JsonArray addresses = objElement.getAsJsonArray();
	        
	        int i=0;
	        for(JsonElement address : addresses) {
	            JsonObject addressObject = address.getAsJsonObject();

	            String name = addressObject.get("name").getAsString();
	            String baseAddress = addressObject.get("base_address").getAsString();
	            String detailAddress = addressObject.get("detail_address").getAsString();
	            String receiverName = addressObject.get("receiver_name").getAsString();
	            String phoneNumber = addressObject.get("receiver_phone_number1").getAsString();
	            String zoneNumber = addressObject.get("zone_number").getAsString();
	            
	            String baseAdd = baseAddress.split("\\(")[0].trim();
	            String etc = "("+baseAddress.split("\\(")[1];
	            Address a = new Address();
	            a.setAddName(name);
	            a.setAddRecipient(receiverName);
	            a.setAddAddress(zoneNumber+"@"+baseAdd+"@"+detailAddress+"@"+etc);
	            a.setAddPhone(phoneNumber.replaceAll("-", ""));
	            if(i == 0) {
	            	a.setAddDefault("Y");
	            }else {
	            	a.setAddDefault("N");
	            }
	            aList.add(a);
	            i++;
	        }
	        
	    	//나머지 정보
	        url = new URL(reqURL);
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");

	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	        responseCode = conn.getResponseCode();

	        br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	        result = new StringBuilder();

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }
	        br.close(); // BufferedReader 닫기
	        
	        element = JsonParser.parseString(result.toString());
	        
	        JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String profileImg = properties.getAsJsonObject().get("profile_image").getAsString();
	        String name = kakaoAccount.getAsJsonObject().get("name").getAsString();
	        String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
	        String phone = kakaoAccount.getAsJsonObject().get("phone_number").getAsString();
	        
	        phone = phone.replace(phone.substring(0, 4), "0").replaceAll("-", "");
	        
	        Member m = new Member();
	        m.setMemPwd("kakao");
	        m.setMemId(email);
	        m.setMemName(name);
	        m.setMemNickName(nickname);
	        m.setMemEmail(email);
	        m.setMemPhone(phone);
	        m.setMemAddress(aList.get(0).getAddAddress());
	        m.setMemFileName(profileImg);
	        for(int j=0; j<aList.size(); j++) {
	        	aList.get(j).setMemId(email);
	        }
	        userInfo.put("m", m);
	        userInfo.put("aList", aList);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return userInfo;
	}

	@Override
	public ArrayList<Member> kakaoLogin(Member m) {
		return mDao.kakaoLogin(m);
	}

	@Override
	public int insertKakaoAddress(ArrayList<Address> kakaoAlist) {
		return mDao.insertKakaoAddress(kakaoAlist);
	}

	@Override
	public int insertKakaoMember(Member kakaoMinfo) {
		return mDao.insertKakaoMember(kakaoMinfo);
	}
	
	@Override
	public int getWishCount(String id) {
		return mDao.getWishCount(id);
	}
}
