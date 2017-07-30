package com.bbs.admin.settings;

import java.util.TimerTask;

import com.bbs.services.SettingService;

public class StarTask extends TimerTask {
	private long interval;
	private SettingService settingService;
	private static StarTask starTask;

	private StarTask() {
		super();
	}

	public static StarTask getInstance() {
		if (starTask == null || !starTask.cancel()) {
			starTask = new StarTask();
			return starTask;
		} else {
			return starTask;
		}
	}

	public static StarTask getInstance(SettingService settingService, long interval) {
		if (starTask == null || !starTask.cancel()) {
			starTask = new StarTask(settingService, interval);
			return starTask;
		} else {
			return starTask;
		}
	}

	public void setSettingService(SettingService settingService) {
		this.settingService = settingService;
	}

	public void setInterval(long interval) {
		this.interval = interval;
	}

	private StarTask(SettingService settingService, long interval) {
		super();
		this.interval = interval;
		this.settingService = settingService;
	}

	@Override
	public void run() {

	}

}
