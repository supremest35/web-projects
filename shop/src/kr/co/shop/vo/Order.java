package kr.co.shop.vo;

import java.util.Date;

public class Order {

	private int no;
	private int userNo;
	private int amount;
	private String status;
	private String recName;
	private String recTel;
	private String recZipCode;
	private String recAddress;
	private String message;
	private int totalOrderPrice;
	private int usedPoint;
	private int totalPaymentPrice;
	private int bankNo;
	private String bankCardAccount;
	private Date createdDate;
	
	public Order() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRecName() {
		return recName;
	}

	public void setRecName(String recName) {
		this.recName = recName;
	}

	public String getRecTel() {
		return recTel;
	}

	public void setRecTel(String recTel) {
		this.recTel = recTel;
	}

	public String getRecZipCode() {
		return recZipCode;
	}

	public void setRecZipCode(String recZipCode) {
		this.recZipCode = recZipCode;
	}

	public String getRecAddress() {
		return recAddress;
	}

	public void setRecAddress(String recAddress) {
		this.recAddress = recAddress;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getTotalOrderPrice() {
		return totalOrderPrice;
	}

	public void setTotalOrderPrice(int totalOrderPrice) {
		this.totalOrderPrice = totalOrderPrice;
	}

	public int getUsedPoint() {
		return usedPoint;
	}

	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}

	public int getTotalPaymentPrice() {
		return totalPaymentPrice;
	}

	public void setTotalPaymentPrice(int totalPaymentPrice) {
		this.totalPaymentPrice = totalPaymentPrice;
	}

	public int getBankNo() {
		return bankNo;
	}

	public void setBankNo(int bankNo) {
		this.bankNo = bankNo;
	}

	public String getBankCardAccount() {
		return bankCardAccount;
	}

	public void setBankCardAccount(String bankCardAccount) {
		this.bankCardAccount = bankCardAccount;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	
}
