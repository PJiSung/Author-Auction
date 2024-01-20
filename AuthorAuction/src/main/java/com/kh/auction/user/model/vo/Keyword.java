package com.kh.auction.user.model.vo;

public class Keyword {

	private String keyword;
	private int minPrice;
	private int maxPrice;
	private String material;
	private int minHeight;
	private int maxHeight;
	private int minWidth;
	private int maxWidth;
	private int deliveryFee;
	
	public Keyword() {}

	public Keyword(String keyword, int minPrice, int maxPrice, String material, int minHeight, int maxHeight,
			int minWidth, int maxWidth, int deliveryFee) {
		super();
		this.keyword = keyword;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.material = material;
		this.minHeight = minHeight;
		this.maxHeight = maxHeight;
		this.minWidth = minWidth;
		this.maxWidth = maxWidth;
		this.deliveryFee = deliveryFee;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public int getMinHeight() {
		return minHeight;
	}

	public void setMinHeight(int minHeight) {
		this.minHeight = minHeight;
	}

	public int getMaxHeight() {
		return maxHeight;
	}

	public void setMaxHeight(int maxHeight) {
		this.maxHeight = maxHeight;
	}

	public int getMinWidth() {
		return minWidth;
	}

	public void setMinWidth(int minWidth) {
		this.minWidth = minWidth;
	}

	public int getMaxWidth() {
		return maxWidth;
	}

	public void setMaxWidth(int maxWidth) {
		this.maxWidth = maxWidth;
	}

	public int getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	@Override
	public String toString() {
		return "Keyword [keyword=" + keyword + ", minPrice=" + minPrice + ", maxPrice=" + maxPrice + ", material="
				+ material + ", minHeight=" + minHeight + ", maxHeight=" + maxHeight + ", minWidth=" + minWidth
				+ ", maxWidth=" + maxWidth + ", deliveryFee=" + deliveryFee + "]";
	}

	
	
	

	
	
	
	
	
}
