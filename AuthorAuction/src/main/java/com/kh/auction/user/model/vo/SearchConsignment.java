package com.kh.auction.user.model.vo;

public class SearchConsignment {
	
	private String select;
	private String keyword;
	private String strDate;
	private String endDat;
	private String status;
	
	public SearchConsignment() {}

	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	public String getEndDat() {
		return endDat;
	}
	public void setEndDat(String endDat) {
		this.endDat = endDat;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public SearchConsignment(String select, String keyword, String strDate, String endDat, String status) {
		super();
		this.select = select;
		this.keyword = keyword;
		this.strDate = strDate;
		this.endDat = endDat;
		this.status = status;
	}

	@Override
	public String toString() {
		return "SearchConsignment [select=" + select + ", keyword=" + keyword + ", strDate=" + strDate + ", endDat="
				+ endDat + ", status=" + status + "]";
	}

	public void convertEmptyToNull() {
	      if ("".equals(this.select)) {
	         this.select = null;
	      }

	      if ("".equals(this.keyword)) {
	         this.keyword = null;
	      }

	      if ("".equals(this.strDate)) {
	         this.strDate = null;
	      }

	      if ("".equals(this.endDat)) {
	         this.endDat = null;
	      }
	      
	      if ("".equals(this.status)) {
	         this.status = null;
	      }
	   }
	
}