package com.bbs.entities;

import com.bbs.entities.rules.BookItemRule;

public class BookItem {
	private Integer itemId;
	private Book book;
	private int status;

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getStatus() {
		return status;
	}

	public String getStatus(Class<String> class1) {
		return BookItemRule.getStatus(status);
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setStatus(String status) {
		setStatus(BookItemRule.getStatus(status));
	}
}
