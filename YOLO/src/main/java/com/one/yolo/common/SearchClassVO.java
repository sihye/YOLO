package com.one.yolo.common;

public class SearchClassVO extends SearchVO {
	private String searchplace;
	private String searchStartPrice;
	private String searchEndPrice;
	public String getSearchplace() {
		return searchplace;
	}
	public void setSearchplace(String searchplace) {
		this.searchplace = searchplace;
	}
	public String getSearchStartPrice() {
		return searchStartPrice;
	}
	public void setSearchStartPrice(String searchStartPrice) {
		this.searchStartPrice = searchStartPrice;
	}
	public String getSearchEndPrice() {
		return searchEndPrice;
	}
	public void setSearchEndPrice(String searchEndPrice) {
		this.searchEndPrice = searchEndPrice;
	}
	@Override
	public String toString() {
		return "SearchClassVO [searchplace=" + searchplace + ", searchStartPrice=" + searchStartPrice
				+ ", searchEndPrice=" + searchEndPrice + "]";
	}
	
}
