package com.bbs.entities;

public class Settings {
	private int id;
	private int recommend;
	private int star;
	private int waitList;
	private long recInterval;
	private long starInterval;
	private long waitInterval;
	private long recPeriod;
	private long starPeriod;
	private long waitPeriod;

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

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
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

	public long getStarInterval() {
		return starInterval;
	}

	public void setStarInterval(long starInterval) {
		this.starInterval = starInterval;
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

	public long getStarPeriod() {
		return starPeriod;
	}

	public void setStarPeriod(long starPeriod) {
		this.starPeriod = starPeriod;
	}

	public long getWaitPeriod() {
		return waitPeriod;
	}

	public void setWaitPeriod(long waitPeriod) {
		this.waitPeriod = waitPeriod;
	}
}
