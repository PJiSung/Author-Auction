package com.kh.auction.user.model.vo;

import java.sql.Date;

public class Consignment {

	private int conNo;
	private String conAuthor;
	private String conProduct;
	private int conWidth;
	private int conHeight;
	private int conYear;
	private int conHope;
	private String conEtc;
	private String conDelStatus;
	private String conAdmStatus;
	private Date conCreateDate;
	private String memId;
	private String conConStatus;
	
	public Consignment() {}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
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

	public int getConHope() {
		return conHope;
	}

	public void setConHope(int conHope) {
		this.conHope = conHope;
	}

	public String getConEtc() {
		return conEtc;
	}

	public void setConEtc(String conEtc) {
		this.conEtc = conEtc;
	}

	public String getConDelStatus() {
		return conDelStatus;
	}

	public void setConDelStatus(String conDelStatus) {
		this.conDelStatus = conDelStatus;
	}

	public String getConAdmStatus() {
		return conAdmStatus;
	}

	public void setConAdmStatus(String conAdmStatus) {
		this.conAdmStatus = conAdmStatus;
	}

	public Date getConCreateDate() {
		return conCreateDate;
	}

	public void setConCreateDate(Date conCreateDate) {
		this.conCreateDate = conCreateDate;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getConConStatus() {
		return conConStatus;
	}

	public void setConConStatus(String conConStatus) {
		this.conConStatus = conConStatus;
	}

	public Consignment(int conNo, String conAuthor, String conProduct, int conWidth, int conHeight, int conYear,
			int conHope, String conEtc, String conDelStatus, String conAdmStatus, Date conCreateDate, String memId,
			String conConStatus) {
		super();
		this.conNo = conNo;
		this.conAuthor = conAuthor;
		this.conProduct = conProduct;
		this.conWidth = conWidth;
		this.conHeight = conHeight;
		this.conYear = conYear;
		this.conHope = conHope;
		this.conEtc = conEtc;
		this.conDelStatus = conDelStatus;
		this.conAdmStatus = conAdmStatus;
		this.conCreateDate = conCreateDate;
		this.memId = memId;
		this.conConStatus = conConStatus;
	}

	@Override
	public String toString() {
		return "Consignment [conNo=" + conNo + ", conAuthor=" + conAuthor + ", conProduct=" + conProduct + ", conWidth="
				+ conWidth + ", conHeight=" + conHeight + ", conYear=" + conYear + ", conHope=" + conHope + ", conEtc="
				+ conEtc + ", conDelStatus=" + conDelStatus + ", conAdmStatus=" + conAdmStatus + ", conCreateDate="
				+ conCreateDate + ", memId=" + memId + ", conConStatus=" + conConStatus + "]";
	}
	
	
	
	
}
