package com.bbs.entities;

public class UserCredit {
	private int id;
	private int userId;
	private int credit;
	private int activeDegree;
	private int commentQulity;
	private int identity;
	private int behavior;
	private int overAll;

	public void setOverAll(int overAll) {
		this.overAll = overAll;
	}

	public int getOverAll() {
		return overAll;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getActiveDegree() {
		return activeDegree;
	}

	public void setActiveDegree(int activeDegree) {
		this.activeDegree = activeDegree;
	}

	public int getCommentQulity() {
		return commentQulity;
	}

	public void setCommentQulity(int commentQulity) {
		this.commentQulity = commentQulity;
	}

	public int getIdentity() {
		return identity;
	}

	public void setIdentity(int identity) {
		this.identity = identity;
	}

	public int getBehavior() {
		return behavior;
	}

	public void setBehavior(int behavior) {
		this.behavior = behavior;
	}

}
