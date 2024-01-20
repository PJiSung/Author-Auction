package com.kh.auction.user.model.vo;

import java.sql.Date;

public class Inquiry {
	
	private int inqNo;
	private String inqFileName;
	private Date inqDate;
	private String memId;
	private String adminId;
	
	public Inquiry() {}
	public int getInqNo() {
		return inqNo;
	}
	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}
	public String getInqFileName() {
		return inqFileName;
	}
	public void setInqFileName(String inqFileName) {
		this.inqFileName = inqFileName;
	}
	public Date getInqDate() {
		return inqDate;
	}
	public void setInqDate(Date inqDate) {
		this.inqDate = inqDate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	@Override
	public String toString() {
		return "Inquiry [inqNo=" + inqNo + ", inqFileName=" + inqFileName + ", inqDate=" + inqDate + ", memId=" + memId
				+ ", adminId=" + adminId + "]";
	}
	public Inquiry(int inqNo, String inqFileName, Date inqDate, String memId, String adminId) {
		super();
		this.inqNo = inqNo;
		this.inqFileName = inqFileName;
		this.inqDate = inqDate;
		this.memId = memId;
		this.adminId = adminId;
	}
}
