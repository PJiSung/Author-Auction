package com.kh.auction.user.model.vo;

import java.sql.Date;

public class Member {
	private String memId;
	private String memPwd;
	private String memName;
	private String memNickName;
	private String memFileName;
	private String memAddress;
	private String memPhone;
	private String memEmail;
	private String memIsAdmin;
	private String memStatus;
	private int memBalance;
	private Date memDate;
	private String memRating;
	private int graBonus;
	
	
	public int getGraBonus() {
		return graBonus;
	}
	public void setGraBonus(int graBonus) {
		this.graBonus = graBonus;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
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
	public String getMemFileName() {
		return memFileName;
	}
	public void setMemFileName(String memFileName) {
		this.memFileName = memFileName;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemIsAdmin() {
		return memIsAdmin;
	}
	public void setMemIsAdmin(String memIsAdmin) {
		this.memIsAdmin = memIsAdmin;
	}
	public String getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}
	public int getMemBalance() {
		return memBalance;
	}
	public void setMemBalance(int memBalance) {
		this.memBalance = memBalance;
	}
	public String getMemRating() {
		return memRating;
	}
	public void setMemRating(String memRating) {
		this.memRating = memRating;
	}
	public Date getMemDate() {
		return memDate;
	}
	public void setMemDate(Date memDate) {
		this.memDate = memDate;
	}
	
	public Member(String memId, String memPwd, String memName, String memNickName, String memFileName,
			String memAddress, String memPhone, String memEmail, String memIsAdmin, String memStatus, int memBalance,
			Date memDate, String memRating, int graBonus) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memNickName = memNickName;
		this.memFileName = memFileName;
		this.memAddress = memAddress;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.memIsAdmin = memIsAdmin;
		this.memStatus = memStatus;
		this.memBalance = memBalance;
		this.memDate = memDate;
		this.memRating = memRating;
		this.graBonus = graBonus;
	}
	public Member() {}
	@Override
	public String toString() {
		return "Member [memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName + ", memNickName=" + memNickName
				+ ", memFileName=" + memFileName + ", memAddress=" + memAddress + ", memPhone=" + memPhone
				+ ", memEmail=" + memEmail + ", memIsAdmin=" + memIsAdmin + ", memStatus=" + memStatus + ", memBalance="
				+ memBalance + ", memDate=" + memDate + ", memRating=" + memRating + ", graBonus=" + graBonus + "]";
	}

	
}