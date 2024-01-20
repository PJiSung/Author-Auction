package com.kh.auction.user.model.vo;

import java.sql.Date;

public class Recommendation {
	
	private int recNo;
	private String recTitle;
	private String recContent;
	private String recStyle;
	private String recStatus;
	private String recReply;
	private Date recCreateDate;
	private String memId;
	private String memName;
	private String memNickName;
	
	public Recommendation() {}

	public int getRecNo() {
		return recNo;
	}

	public void setRecNo(int recNo) {
		this.recNo = recNo;
	}

	public String getRecTitle() {
		return recTitle;
	}

	public void setRecTitle(String recTitle) {
		this.recTitle = recTitle;
	}

	public String getRecContent() {
		return recContent;
	}

	public void setRecContent(String recContent) {
		this.recContent = recContent;
	}

	public String getRecStyle() {
		return recStyle;
	}

	public void setRecStyle(String recStyle) {
		this.recStyle = recStyle;
	}

	public String getRecStatus() {
		return recStatus;
	}

	public void setRecStatus(String recStatus) {
		this.recStatus = recStatus;
	}

	public String getRecReply() {
		return recReply;
	}

	public void setRecReply(String recReply) {
		this.recReply = recReply;
	}

	public Date getRecCreateDate() {
		return recCreateDate;
	}

	public void setRecCreateDate(Date recCreateDate) {
		this.recCreateDate = recCreateDate;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemNickName() {
		return memNickName;
	}

	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}

	public Recommendation(int recNo, String recTitle, String recContent, String recStyle, String recStatus,
			String recReply, Date recCreateDate, String memId, String memName) {
		super();
		this.recNo = recNo;
		this.recTitle = recTitle;
		this.recContent = recContent;
		this.recStyle = recStyle;
		this.recStatus = recStatus;
		this.recReply = recReply;
		this.recCreateDate = recCreateDate;
		this.memId = memId;
		this.memName = memName;
		this.memNickName = memNickName;
		}

	@Override
	public String toString() {
		return "Recommendation [recNo=" + recNo + ", recTitle=" + recTitle + ", recContent=" + recContent
				+ ", recStyle=" + recStyle + ", recStatus=" + recStatus + ", recReply=" + recReply + ", recCreateDate="
				+ recCreateDate + ", memId=" + memId + ", memName=" + memName + ", memNickName=" + memNickName + "]";
	}

	     
	
	
}
