package com.kh.auction.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.auction.user.model.vo.Address;
import com.kh.auction.user.model.vo.Inquiry;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.SearchMember;

@Mapper
public interface MemberDAO {

	int insertMember(Member m);

	int checkId(String memId);

	int checkNickName(String memNickName);

	Member login(Member m);

	Member findMyInfo(Member m);

	int updatePwd(Member m);

	int insertAddress(Address a);

	ArrayList<Address> selectAddressList(String id);

	int updateAddressDefault(Address updateA);

	Address selectAddress(int addNo);

	int updateAddress(Address a);

	int deleteMember(String memId);

	int deleteAddress(int addNo);

	int updateMember(Member m);

	int updateMemImg(Member m);

	int deleteMemImg(String id);

	int getListCount(SearchMember sm);

	ArrayList<Member> selectMemberList(SearchMember sm, RowBounds rowBounds);

	int deleteMembers(String[] ids);

	int sortMemberList(String status);

	int updateMemberIsAdmin(Member m);

	Member selectMember(String id);

	int updateMemberByAdmin(Member m);

	String selectImg(String id);

	int getiListCount(HashMap<String, Object> map);

	ArrayList<Inquiry> selectInquiryList(HashMap<String, Object> map, RowBounds rowBounds);

	String selectInquiry(int inqNo);

	ArrayList<Member> kakaoLogin(Member m);

	int insertKakaoAddress(ArrayList<Address> kakaoAlist);

	int insertKakaoMember(Member kakaoMinfo);

	int getWishCount(String id);
}
