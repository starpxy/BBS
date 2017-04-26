package com.bbs.entities;

import java.util.Date;

public class BorrowedRecord {
	private Integer borrowedId;
	private User user;
	private BookItem bookItem;
	private Date borrowedAt;
	private Date returnAt;
	private String status;
	private Date updateAt;

	public Integer getBorrowedId() {
		return borrowedId;
	}

	public void setBorrowedId(Integer borrowedId) {
		this.borrowedId = borrowedId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BookItem getBookItem() {
		return bookItem;
	}

	public void setBookItem(BookItem bookItem) {
		this.bookItem = bookItem;
	}

	public Date getBorrowedAt() {
		return borrowedAt;
	}

	public void setBorrowedAt(Date borrowedAt) {
		this.borrowedAt = borrowedAt;
	}

	public Date getReturnAt() {
		return returnAt;
	}

	public void setReturnAt(Date returnAt) {
		this.returnAt = returnAt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

}
