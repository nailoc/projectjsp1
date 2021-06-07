package com.hk.jsp.vo;

public class Order_ListVo {
	
	private String orderno;
	private String deliveryno;
	private String p_no;
	private int amount;
	private int price2;
	private String buy_datetime;
	
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public String getDeliveryno() {
		return deliveryno;
	}
	public void setDeliveryno(String deliveryno) {
		this.deliveryno = deliveryno;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public String getBuy_datetime() {
		return buy_datetime;
	}
	public void setBuy_datetime(String buy_datetime) {
		this.buy_datetime = buy_datetime;
	}
	
	
	
}
