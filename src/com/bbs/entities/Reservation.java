package com.bbs.entities;

import java.util.Date;

public class Reservation {
	private Integer reservationId;
	private User user;
	private BookItem bookItem;
	private Date createAt;
	private Date fetchDate;
	private Date updateAt;
	private int status;

	public void setFetchDate(Date fetchDate) {
		this.fetchDate = fetchDate;
	}

	public Date getFetchDate() {
		return fetchDate;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getStatus() {
		return status;
	}

	public Integer getReservationId() {
		return reservationId;
	}

	public void setReservationId(Integer reservationId) {
		this.reservationId = reservationId;
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

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

}
