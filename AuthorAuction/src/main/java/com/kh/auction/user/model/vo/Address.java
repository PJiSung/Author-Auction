package com.kh.auction.user.model.vo;

public class Address {
	private int addNo;
	private String addName;
	private String addRecipient;
	private String addAddress;
	private String addPhone;
	private String addDefault;
	private String memId;
	private String addStatus;
	
	public String getAddDefault() {
		return addDefault;
	}
	public void setAddDefault(String addDefault) {
		this.addDefault = addDefault;
	}
	public int getAddNo() {
		return addNo;
	}
	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}
	public String getAddName() {
		return addName;
	}
	public void setAddName(String addName) {
		this.addName = addName;
	}
	public String getAddRecipient() {
		return addRecipient;
	}
	public void setAddRecipient(String addRecipient) {
		this.addRecipient = addRecipient;
	}
	public String getAddAddress() {
		return addAddress;
	}
	public void setAddAddress(String addAddress) {
		this.addAddress = addAddress;
	}
	public String getAddPhone() {
		return addPhone;
	}
	public void setAddPhone(String addPhone) {
		this.addPhone = addPhone;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	public String getAddStatus() {
		return addStatus;
	}
	public void setAddStatus(String addStatus) {
		this.addStatus = addStatus;
	}
	public Address() {}
	public Address(int addNo, String addName, String addRecipient, String addAddress, String addPhone,
			String addDefault, String memId, String addStatus) {
		super();
		this.addNo = addNo;
		this.addName = addName;
		this.addRecipient = addRecipient;
		this.addAddress = addAddress;
		this.addPhone = addPhone;
		this.addDefault = addDefault;
		this.memId = memId;
		this.addStatus = addStatus;
	}
	@Override
	public String toString() {
		return "Address [addNo=" + addNo + ", addName=" + addName + ", addRecipient=" + addRecipient + ", addAddress="
				+ addAddress + ", addPhone=" + addPhone + ", addDefault=" + addDefault + ", memId=" + memId
				+ ", addStatus=" + addStatus + "]";
	}
	
}
