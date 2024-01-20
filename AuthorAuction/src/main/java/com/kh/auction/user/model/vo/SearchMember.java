package com.kh.auction.user.model.vo;

import java.util.ArrayList;
import java.util.List;

public class SearchMember {
	private String isAdmin;
	private String keyword;
	private String searchText;
	private String startDate;
	private String endDate;
	private String status;

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public SearchMember() {
	}

	public SearchMember(String isAdmin, String keyword, String searchText, String startDate, String endDate,
			String status) {
		super();
		this.isAdmin = isAdmin;
		this.keyword = keyword;
		this.searchText = searchText;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
	}

	@Override
	public String toString() {
		return "SearchMember [isAdmin=" + isAdmin + ", keyword=" + keyword + ", searchText=" + searchText
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + "]";
	}
	
	public void convertEmptyToNull() {
		if ("".equals(this.isAdmin)) {
			this.isAdmin = null;
		}

		if ("".equals(this.keyword)) {
			this.keyword = null;
		}

		if ("".equals(this.searchText)) {
			this.searchText = null;
		}

		if ("".equals(this.startDate)) {
			this.startDate = null;
		}

		if ("".equals(this.endDate)) {
			this.endDate = null;
		}
		
		if ("".equals(this.status)) {
			this.status = null;
		}
	}

	
}
