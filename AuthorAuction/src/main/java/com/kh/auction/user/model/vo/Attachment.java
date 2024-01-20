package com.kh.auction.user.model.vo;

public class Attachment {
	
	private int attNo;
	private String attRename;
	private String attStatus;
	private int attFno;
	private int attCategory;
	private int attBno;
	
	public Attachment() {}
	public Attachment(int attNo, String attRename, String attStatus, int attFno, int attCategory, int attBno) {
		super();
		this.attNo = attNo;
		this.attRename = attRename;
		this.attStatus = attStatus;
		this.attFno = attFno;
		this.attCategory = attCategory;
		this.attBno = attBno;
	}

	public int getAttNo() {
		return attNo;
	}

	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}

	public String getAttRename() {
		return attRename;
	}

	public void setAttRename(String attRename) {
		this.attRename = attRename;
	}

	public String getAttStatus() {
		return attStatus;
	}

	public void setAttStatus(String attStatus) {
		this.attStatus = attStatus;
	}

	public int getAttFno() {
		return attFno;
	}

	public void setAttFno(int attFno) {
		this.attFno = attFno;
	}

	public int getAttCategory() {
		return attCategory;
	}

	public void setAttCategory(int attCategory) {
		this.attCategory = attCategory;
	}

	public int getAttBno() {
		return attBno;
	}

	public void setAttBno(int attBno) {
		this.attBno = attBno;
	}

	@Override
	public String toString() {
		return "Attachment [attNo=" + attNo + ", attRename=" + attRename + ", attStatus=" + attStatus + ", attFno="
				+ attFno + ", attCategory=" + attCategory + ", attBno=" + attBno + "]";
	}
	
}
