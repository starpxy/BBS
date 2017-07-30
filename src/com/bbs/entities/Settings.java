package com.bbs.entities;

public class Settings {
	private int id;
	private int recommend = 0;
	private int remind = 0;
	private int waitList = 0;
	private int reserveOverdue = 0;
	private long reserveInterval = 0;
	private long recInterval = 0;
	private long remindInterval = 0;
	private long waitInterval = 0;
	private long reservePeriod = 0;
	private long recPeriod = 0;
	private long remindPeriod = 0;
	private long waitPeriod = 0;

	public void setReservePeriod(long reservePeriod) {
		this.reservePeriod = reservePeriod;
	}

	public long getReserveInterval() {
		return reserveInterval;
	}

	public long getReservePeriod() {
		return reservePeriod;
	}

	public int getReserveOverdue() {
		return reserveOverdue;
	}

	public void setReserveInterval(long reserveInterval) {
		this.reserveInterval = reserveInterval;
	}

	public void setReserveOverdue(int reserveOverdue) {
		this.reserveOverdue = reserveOverdue;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getWaitList() {
		return waitList;
	}

	public void setWaitList(int waitList) {
		this.waitList = waitList;
	}

	public long getRecInterval() {
		return recInterval;
	}

	public void setRecInterval(long recInterval) {
		this.recInterval = recInterval;
	}

	public int getRemind() {
		return remind;
	}

	public void setRemind(int remind) {
		this.remind = remind;
	}

	public long getRemindPeriod() {
		return remindPeriod;
	}

	public void setRemindInterval(long remindInterval) {
		this.remindInterval = remindInterval;
	}

	public void setRemindPeriod(long remindPeriod) {
		this.remindPeriod = remindPeriod;
	}

	public long getRemindInterval() {
		return remindInterval;
	}

	public long getWaitInterval() {
		return waitInterval;
	}

	public void setWaitInterval(long waitInterval) {
		this.waitInterval = waitInterval;
	}

	public long getRecPeriod() {
		return recPeriod;
	}

	public void setRecPeriod(long recPeriod) {
		this.recPeriod = recPeriod;
	}

	public long getWaitPeriod() {
		return waitPeriod;
	}

	public void setWaitPeriod(long waitPeriod) {
		this.waitPeriod = waitPeriod;
	}
}
