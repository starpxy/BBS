package com.bbs.admin.settings;

import java.util.TimerTask;

import com.bbs.entities.Settings;
import com.bbs.services.SettingService;

public class WaitTask extends TimerTask {
	private long interval;
	private static int count = 0;
	private SettingService settingService;
	private static WaitTask waitTask;

	private WaitTask() {
		super();
	}

	public static WaitTask getInstance() {
		if (waitTask == null || !waitTask.cancel()) {
			waitTask = new WaitTask();
			return waitTask;
		} else {
			return waitTask;
		}
	}

	public static WaitTask getInstance(SettingService settingService, long interval) {
		if (waitTask == null || !waitTask.cancel()) {
			waitTask = new WaitTask(settingService, interval);
			return waitTask;
		} else {
			return waitTask;
		}
	}

	public void setSettingService(SettingService settingService) {
		this.settingService = settingService;
	}

	public void setInterval(long interval) {
		this.interval = interval;
	}

	private WaitTask(SettingService settingService, long interval) {
		super();
		this.interval = interval;
		this.settingService = settingService;
	}

	public void cancelTask() {
		waitTask.cancel();
		Settings settings = settingService.showSettings();
		settings.setWaitList(0);
		settingService.update(settings);
	}

	@Override
	public void run() {
		System.out.println("wait " + count);
		count++;
	}

}
