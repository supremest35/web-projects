package kr.co.shop.dto;

import java.util.Date;

import kr.co.shop.vo.Book;
import kr.co.shop.vo.User;

public class CartItemDto {

	private int no;
	private Book book;
	private User user;
	private int amount;
	private Date createdDate;
	
	public CartItemDto() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	
}
