package com.kh.auction.user.model.vo;

public class BiddingDetail {
	private int bidPrice;
	private int aucNo;
	private String memId;
	
	public BiddingDetail() {}

	public BiddingDetail(int bidPrice, int aucNo, String memId) {
		super();
		this.bidPrice = bidPrice;
		this.aucNo = aucNo;
		this.memId = memId;
	}

	public int getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}

	public int getAucNo() {
		return aucNo;
	}

	public void setAucNo(int aucNo) {
		this.aucNo = aucNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	@Override
	public String toString() {
		return "BiddingDetail [bidPrice=" + bidPrice + ", aucNo=" + aucNo + ", memId=" + memId + "]";
	}
}
