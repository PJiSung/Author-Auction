package com.kh.auction.user.model.vo;

public class Sellstatic {

	
	private int proNo;
	private int sellAmount;
	private String proName;
	private int odtNum;
	private String ordDate;
	
	
	
	public Sellstatic() {}



	public Sellstatic(int proNo, int sellAmount, String proName, int odtNum, String ordDate) {
		super();
		this.proNo = proNo;
		this.sellAmount = sellAmount;
		this.proName = proName;
		this.odtNum = odtNum;
		this.ordDate = ordDate;
	}





	public int getProNo() {
		return proNo;
	}





	public void setProNo(int proNo) {
		this.proNo = proNo;
	}




	public int getSellAmount() {
		return sellAmount;
	}




	public void setSellAmount(int sellAmount) {
		this.sellAmount = sellAmount;
	}





	public String getProName() {
		return proName;
	}




	public void setProName(String proName) {
		this.proName = proName;
	}





	public int getOdtNum() {
		return odtNum;
	}





	public void setOdtNum(int odtNum) {
		this.odtNum = odtNum;
	}




	public String getOrdDate() {
		return ordDate;
	}





	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}






	@Override
	public String toString() {
		return "Sellstatic [proNo=" + proNo + ", sellAmount=" + sellAmount + ", proName=" + proName + ", odtNum="
				+ odtNum + ", ordDate=" + ordDate + "]";
	}

	
	
	
	
}
