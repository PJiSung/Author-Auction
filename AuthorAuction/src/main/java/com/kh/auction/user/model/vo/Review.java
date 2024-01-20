package com.kh.auction.user.model.vo;

import java.sql.Date;

public class Review {
	private int revNo;
	private String revContent;
	private int revCount;
	private int revLike;
	private Date revCreateDate;
	private Date revModifyDate;
	private String revStatus;
	private String hasAttm;
	private String memId;
	private int proNo;
	private String proName;
	private String proWriter;
	private String proImage;
	private String memNickName;
	private String memFileName;
	
	public Review() {}

	public Review(int revNo, String revContent, int revCount, int revLike, Date revCreateDate, Date revModifyDate,
			String revStatus, String memId) {
		super();
		this.revNo = revNo;
		this.revContent = revContent;
		this.revCount = revCount;
		this.revLike = revLike;
		this.revCreateDate = revCreateDate;
		this.revModifyDate = revModifyDate;
		this.revStatus = revStatus;
		this.memId = memId;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public int getRevCount() {
		return revCount;
	}

	public void setRevCount(int revCount) {
		this.revCount = revCount;
	}

	public int getRevLike() {
		return revLike;
	}

	public void setRevLike(int revLike) {
		this.revLike = revLike;
	}

	public Date getRevCreateDate() {
		return revCreateDate;
	}

	public void setRevCreateDate(Date revCreateDate) {
		this.revCreateDate = revCreateDate;
	}

	public Date getRevModifyDate() {
		return revModifyDate;
	}

	public void setRevModifyDate(Date revModifyDate) {
		this.revModifyDate = revModifyDate;
	}

	public String getRevStatus() {
		return revStatus;
	}

	public void setRevStatus(String revStatus) {
		this.revStatus = revStatus;
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

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
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

	public String getProImage() {
		return proImage;
	}

	public void setProImage(String proImage) {
		this.proImage = proImage;
	}

	public String getHasAttm() {
		return hasAttm;
	}

	public void setHasAttm(String hasAttm) {
		this.hasAttm = hasAttm;
	}

	@Override
	public String toString() {
		return "Review [revNo=" + revNo + ", revContent=" + revContent + ", revCount=" + revCount + ", revLike="
				+ revLike + ", revCreateDate=" + revCreateDate + ", revModifyDate=" + revModifyDate + ", revStatus="
				+ revStatus + ", hasAttm=" + hasAttm + ", memId=" + memId + ", proNo=" + proNo + ", proName=" + proName
				+ ", proWriter=" + proWriter + ", proImage=" + proImage + ", memNickName=" + memNickName
				+ ", memFileName=" + memFileName + "]";
	}
	
}
