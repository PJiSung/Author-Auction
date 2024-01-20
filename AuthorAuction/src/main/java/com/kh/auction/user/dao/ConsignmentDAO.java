package com.kh.auction.user.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.auction.user.model.vo.Attachment;
import com.kh.auction.user.model.vo.Auction;
import com.kh.auction.user.model.vo.Consignment;
import com.kh.auction.user.model.vo.Member;
import com.kh.auction.user.model.vo.PageInfo;
import com.kh.auction.user.model.vo.SearchConsignment;

@Mapper
public interface ConsignmentDAO {

	int insertConsignment(Consignment c);

	int insertAttm(ArrayList<Attachment> list);

	int getListCount(String memId);

	ArrayList<Consignment> selectConsignmentList(int i, PageInfo pi, RowBounds rowBounds);

	int searchCount(HashMap<String, Object> map);

	ArrayList<Consignment> searchList(HashMap<String, Object> map, RowBounds rowBounds);

	Consignment selectConsignment(int conNo);

	ArrayList<Attachment> selectAttmConsignmentList(int conNo);
	
	int updateConAdmStatus(int conNo);
	
	Member selectMember(int conNo);

	ArrayList<Consignment> selectConsignmentList(String memId, RowBounds rowBounds);

	int deleteConsignment(int conNo);

	int statusNConsignment(int conNo);
	
	int updateConsignment(Consignment c);

	int updateAttmFno(Attachment a);
	
	
	
	
	//////////////////////////////////////////////////////////////////

	
	

	Consignment selectUser(int conNo);

	ArrayList<Consignment> selectAttmUserList(int conNo);

	int checkDelete(String[] deleteIds);

	int searchCount2(SearchConsignment sc);

	ArrayList<Consignment> searchList2(SearchConsignment sc, RowBounds rowBounds);

	ArrayList<HashMap<String, Object>> selectAuctionMList();

	int updateConConStatus(HashMap<String, Object> map);


	
	
	

	


}
