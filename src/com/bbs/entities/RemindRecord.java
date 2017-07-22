package com.bbs.entities;

import java.util.Date;

public class RemindRecord {
	private int userId;
	private int borrowedId;
	private Date remindTime;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getBorrowedId() {
		return borrowedId;
	}

	public void setBorrowedId(int borrowedId) {
		this.borrowedId = borrowedId;
	}

	public Date getRemindTime() {
		return remindTime;
	}

	public void setRemindTime(Date remindTime) {
		this.remindTime = remindTime;
	}

}
