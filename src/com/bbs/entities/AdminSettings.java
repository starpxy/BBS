package com.bbs.entities;

import java.util.Date;

public class AdminSettings {
	private int id;
	private int recommendSwitch;
	private long recommendPeriod;
	private int remindSwitch;
	private long remindPeriod;
	private int starSwitch;
	private long starPeriod;
	private long returnInterval;
	private Date updateAt;

	public void setReturnInterval(long returnInterval) {
		this.returnInterval = returnInterval;
	}

	public long getReturnInterval() {
		return returnInterval;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRecommendSwitch() {
		return recommendSwitch;
	}

	public void setRecommendSwitch(int recommendSwitch) {
		this.recommendSwitch = recommendSwitch;
	}

	public long getRecommendPeriod() {
		return recommendPeriod;
	}

	public void setRecommendPeriod(long recommendPeriod) {
		this.recommendPeriod = recommendPeriod;
	}

	public int getRemindSwitch() {
		return remindSwitch;
	}

	public void setRemindSwitch(int remindSwitch) {
		this.remindSwitch = remindSwitch;
	}

	public long getRemindPeriod() {
		return remindPeriod;
	}

	public void setRemindPeriod(long remindPeriod) {
		this.remindPeriod = remindPeriod;
	}

	public int getStarSwitch() {
		return starSwitch;
	}

	public void setStarSwitch(int starSwitch) {
		this.starSwitch = starSwitch;
	}

	public long getStarPeriod() {
		return starPeriod;
	}

	public void setStarPeriod(long starPeriod) {
		this.starPeriod = starPeriod;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

}
