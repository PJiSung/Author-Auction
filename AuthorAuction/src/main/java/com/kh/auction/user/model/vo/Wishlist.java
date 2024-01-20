package com.kh.auction.user.model.vo;

public class Wishlist {

	
	private String memId;
	private int proNo;
	private String proName;
	private String proWriter;
	private String proImage;
	private int proPrice;
	private int proAmount;
	private int wisAmount;
	
	public Wishlist() {}

	public Wishlist(String memId, int proNo, String proName, String proWriter, String proImage, int proPrice,
			int proAmount, int wisAmount) {
		super();
		this.memId = memId;
		this.proNo = proNo;
		this.proName = proName;
		this.proWriter = proWriter;
		this.proImage = proImage;
		this.proPrice = proPrice;
		this.proAmount = proAmount;
		this.wisAmount = wisAmount;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
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

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public int getProAmount() {
		return proAmount;
	}

	public void setProAmount(int proAmount) {
		this.proAmount = proAmount;
	}

	public int getWisAmount() {
		return wisAmount;
	}

	public void setWisAmount(int wisAmount) {
		this.wisAmount = wisAmount;
	}

	@Override
	public String toString() {
		return "Wishlist [memId=" + memId + ", proNo=" + proNo + ", proName=" + proName + ", proWriter=" + proWriter
				+ ", proImage=" + proImage + ", proPrice=" + proPrice + ", proAmount=" + proAmount + ", wisAmount="
				+ wisAmount + "]";
	}


	
	
}
