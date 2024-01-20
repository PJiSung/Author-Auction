package com.kh.auction.user.model.vo;

public class Auction {
	private int aucNo;
	private int aucStartPrice;
	private Integer aucFinishPrice;
	private String aucStartDate;
	private String aucFinishDate;
	private String aucMemId;
	private String conAuthor;
	private String conProduct;
	private int conWidth;
	private int conHeight;
	private int conYear;
	private String conEtc;
	private String attRename;
	
	public Auction() {}

	public Auction(int aucNo, int aucStartPrice, Integer aucFinishPrice, String aucStartDate, String aucFinishDate,
			String aucMemId, String conAuthor, String conProduct, int conWidth, int conHeight, int conYear,
			String conEtc, String attRename) {
		super();
		this.aucNo = aucNo;
		this.aucStartPrice = aucStartPrice;
		this.aucFinishPrice = aucFinishPrice;
		this.aucStartDate = aucStartDate;
		this.aucFinishDate = aucFinishDate;
		this.aucMemId = aucMemId;
		this.conAuthor = conAuthor;
		this.conProduct = conProduct;
		this.conWidth = conWidth;
		this.conHeight = conHeight;
		this.conYear = conYear;
		this.conEtc = conEtc;
		this.attRename = attRename;
	}

	public int getAucNo() {
		return aucNo;
	}

	public void setAucNo(int aucNo) {
		this.aucNo = aucNo;
	}

	public int getAucStartPrice() {
		return aucStartPrice;
	}

	public void setAucStartPrice(int aucStartPrice) {
		this.aucStartPrice = aucStartPrice;
	}

	public Integer getAucFinishPrice() {
		return aucFinishPrice;
	}

	public void setAucFinishPrice(Integer aucFinishPrice) {
		this.aucFinishPrice = aucFinishPrice;
	}

	public String getAucStartDate() {
		return aucStartDate;
	}

	public void setAucStartDate(String aucStartDate) {
		this.aucStartDate = aucStartDate;
	}

	public String getAucFinishDate() {
		return aucFinishDate;
	}

	public void setAucFinishDate(String aucFinishDate) {
		this.aucFinishDate = aucFinishDate;
	}

	public String getAucMemId() {
		return aucMemId;
	}

	public void setAucMemId(String aucMemId) {
		this.aucMemId = aucMemId;
	}

	public String getConAuthor() {
		return conAuthor;
	}

	public void setConAuthor(String conAuthor) {
		this.conAuthor = conAuthor;
	}

	public String getConProduct() {
		return conProduct;
	}

	public void setConProduct(String conProduct) {
		this.conProduct = conProduct;
	}

	public int getConWidth() {
		return conWidth;
	}

	public void setConWidth(int conWidth) {
		this.conWidth = conWidth;
	}

	public int getConHeight() {
		return conHeight;
	}

	public void setConHeight(int conHeight) {
		this.conHeight = conHeight;
	}

	public int getConYear() {
		return conYear;
	}

	public void setConYear(int conYear) {
		this.conYear = conYear;
	}

	public String getConEtc() {
		return conEtc;
	}

	public void setConEtc(String conEtc) {
		this.conEtc = conEtc;
	}

	public String getAttRename() {
		return attRename;
	}

	public void setAttRename(String attRename) {
		this.attRename = attRename;
	}

	@Override
	public String toString() {
		return "Auction [aucNo=" + aucNo + ", aucStartPrice=" + aucStartPrice + ", aucFinishPrice=" + aucFinishPrice
				+ ", aucStartDate=" + aucStartDate + ", aucFinishDate=" + aucFinishDate + ", aucMemId=" + aucMemId
				+ ", conAuthor=" + conAuthor + ", conProduct=" + conProduct + ", conWidth=" + conWidth + ", conHeight="
				+ conHeight + ", conYear=" + conYear + ", conEtc=" + conEtc + ", attRename=" + attRename + "]";
	}
}
