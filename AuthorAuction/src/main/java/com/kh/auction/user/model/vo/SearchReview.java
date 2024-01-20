package com.kh.auction.user.model.vo;


public class SearchReview {
	
	private String category;
	private String keyword;
	private String strDate;
	private String endDate;
	private String selectedSort;
	private String memId;
	
	

	public SearchReview() {}

	public SearchReview(String category, String keyword, String strDate, String endDate, String selectedSort,
			String memId) {
		super();
		this.category = category;
		this.keyword = keyword;
		this.strDate = strDate;
		this.endDate = endDate;
		this.selectedSort = selectedSort;
		this.memId = memId;
	}

	

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSelectedSort() {
		return selectedSort;
	}

	public void setSelectedSort(String selectedSort) {
		this.selectedSort = selectedSort;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	

	@Override
	public String toString() {
		return "SearchReview [category=" + category + ", keyword=" + keyword + ", strDate=" + strDate + ", endDate="
				+ endDate + ", selectedSort=" + selectedSort + ", memId=" + memId + "]";
	}

	public void convertEmptyToNull() {
		if ("".equals(this.category)) {
			this.category = null;
		}

		if ("".equals(this.keyword)) {
			this.keyword = null;
		}

		if ("".equals(this.strDate)) {
			this.strDate = null;
		}

		if ("".equals(this.endDate)) {
			this.endDate = null;
		}

		if ("".equals(this.selectedSort)) {
			this.selectedSort = null;
		}
		
	}
	
}
