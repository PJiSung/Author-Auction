package com.kh.auction.user.model.vo;

public class Reply { 
	
	private int repNo;
	private String repContent;
	private String repCreateDate;
	private String repModifyDate;
	private String repStatus;
	private int revNo;
	private String memId;
	private String memNickName;
	private String memFileName;
	private String proName;
	private String proWriter;
	private int proNo;
	public Reply() {}

	public Reply(int repNo, String repContent, String repCreateDate, String repModifyDate, String repStatus, String memId) {
		super();
		this.repNo = repNo;
		this.repContent = repContent;
		this.repCreateDate = repCreateDate;
		this.repModifyDate = repModifyDate;
		this.repStatus = repStatus;
		this.memId = memId;
	}

	public int getRepNo() {
		return repNo;
	}

	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}

	public String getRepContent() {
		return repContent;
	}

	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}

	public String getRepCreateDate() {
		return repCreateDate;
	}

	public void setRepCreateDate(String repCreateDate) {
		this.repCreateDate = repCreateDate;
	}

	public String getRepModifyDate() {
		return repModifyDate;
	}

	public void setRepModifyDate(String repModifyDate) {
		this.repModifyDate = repModifyDate;
	}

	public String getRepStatus() {
		return repStatus;
	}

	public void setRepStatus(String repStatus) {
		this.repStatus = repStatus;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemNickName() {
		return memNickName;
	}

	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}

	public String getMemFileName() {
		return memFileName;
	}

	public void setMemFileName(String memFileName) {
		this.memFileName = memFileName;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}


	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProWriter() {
		return proWriter;
	}

	public void setProWriter(String proWriter) {
		this.proWriter = proWriter;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	@Override
	public String toString() {
		return "Reply [repNo=" + repNo + ", repContent=" + repContent + ", repCreateDate=" + repCreateDate
				+ ", repModifyDate=" + repModifyDate + ", repStatus=" + repStatus + ", revNo=" + revNo + ", memId="
				+ memId + ", memNickName=" + memNickName + ", memFileName=" + memFileName + ", proName=" + proName
				+ ", proWriter=" + proWriter + ", proNo=" + proNo + "]";
	}
	
}
