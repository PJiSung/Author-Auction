package com.kh.auction.user.model.vo;

import java.sql.Date;

public class Order {

	private String ordNo;
	private Date ordDate;
	private String ordStatus;
	private String ordMessage;
	private int ordPoPrice;
	private int ordCaPrice;
	private int ordSumPrice;
	private String ordMethod;
	private String memId;
	private int addNo;
	
	public Order() {}

	public Order(String ordNo, Date ordDate, String ordStatus, String ordMessage, int ordPoPrice, int ordCaPrice,
			int ordSumPrice, String ordMethod, String memId, int addNo) {
		super();
		this.ordNo = ordNo;
		this.ordDate = ordDate;
		this.ordStatus = ordStatus;
		this.ordMessage = ordMessage;
		this.ordPoPrice = ordPoPrice;
		this.ordCaPrice = ordCaPrice;
		this.ordSumPrice = ordSumPrice;
		this.ordMethod = ordMethod;
		this.memId = memId;
		this.addNo = addNo;
	}

	public String getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}

	public Date getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}

	public String getOrdStatus() {
		return ordStatus;
	}

	public void setOrdStatus(String ordStatus) {
		this.ordStatus = ordStatus;
	}

	public String getOrdMessage() {
		return ordMessage;
	}

	public void setOrdMessage(String ordMessage) {
		this.ordMessage = ordMessage;
	}

	public int getOrdPoPrice() {
		return ordPoPrice;
	}

	public void setOrdPoPrice(int ordPoPrice) {
		this.ordPoPrice = ordPoPrice;
	}

	public int getOrdCaPrice() {
		return ordCaPrice;
	}

	public void setOrdCaPrice(int ordCaPrice) {
		this.ordCaPrice = ordCaPrice;
	}

	public int getOrdSumPrice() {
		return ordSumPrice;
	}

	public void setOrdSumPrice(int ordSumPrice) {
		this.ordSumPrice = ordSumPrice;
	}

	public String getOrdMethod() {
		return ordMethod;
	}

	public void setOrdMethod(String ordMethod) {
		this.ordMethod = ordMethod;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getAddNo() {
		return addNo;
	}

	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}

	@Override
	public String toString() {
		return "Order [ordNo=" + ordNo + ", ordDate=" + ordDate + ", ordStatus=" + ordStatus + ", ordMessage="
				+ ordMessage + ", ordPoPrice=" + ordPoPrice + ", ordCaPrice=" + ordCaPrice + ", ordSumPrice="
				+ ordSumPrice + ", ordMethod=" + ordMethod + ", memId=" + memId + ", addNo=" + addNo + "]";
	}
	
	
}