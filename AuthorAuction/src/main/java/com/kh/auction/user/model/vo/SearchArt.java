package com.kh.auction.user.model.vo;

public class SearchArt {
	private String artNameEn;
	private String artNameKo;
	private String writerName;
	private String materials;
	private String standard;
	private String artImg;
	private String year;
	
	public String getArtNameEn() {
		return artNameEn;
	}
	public void setArtNameEn(String artNameEn) {
		this.artNameEn = artNameEn;
	}
	public String getArtNameKo() {
		return artNameKo;
	}
	public void setArtNameKo(String artNameKo) {
		this.artNameKo = artNameKo;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getMaterials() {
		return materials;
	}
	public void setMaterials(String materials) {
		this.materials = materials;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getArtImg() {
		return artImg;
	}
	public void setArtImg(String artImg) {
		this.artImg = artImg;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	public SearchArt(){}
	
	public SearchArt(String artNameEn, String artNameKo, String writerName, String materials, String standard,
			String artImg, String year) {
		super();
		this.artNameEn = artNameEn;
		this.artNameKo = artNameKo;
		this.writerName = writerName;
		this.materials = materials;
		this.standard = standard;
		this.artImg = artImg;
		this.year = year;
	}
	
	@Override
	public String toString() {
		return "searchArt [artNameEn=" + artNameEn + ", artNameKo=" + artNameKo + ", writerName=" + writerName
				+ ", materials=" + materials + ", standard=" + standard + ", artImg=" + artImg + ", year=" + year + "]";
	}
}
