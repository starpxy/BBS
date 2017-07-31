package com.bbs.admin.settings;

import java.util.TimerTask;

import com.bbs.entities.Settings;
import com.bbs.services.SettingService;

public class RemindTask extends TimerTask {
	private long interval;
	private static int count = 0;
	private SettingService settingService;
	private static RemindTask remindTask;

	private RemindTask() {
		super();
	}

	public static RemindTask getInstance() {
		if (remindTask == null || !remindTask.cancel()) {
			remindTask = new RemindTask();
			return remindTask;
		} else {
			return remindTask;
		}
	}

	public void cancelTask() {
		remindTask.cancel();
		Settings settings = settingService.showSettings();
		settings.setRemind(0);
		settingService.update(settings);
	}

	public static RemindTask getInstance(SettingService settingService, long interval) {
		if (remindTask == null || !remindTask.cancel()) {
			remindTask = new RemindTask(settingService, interval);
			return remindTask;
		} else {
			return remindTask;
		}
	}

	public void setSettingService(SettingService settingService) {
		this.settingService = settingService;
	}

	public void setInterval(long interval) {
		this.interval = interval;
	}

	private RemindTask(SettingService settingService, long interval) {
		super();
		this.interval = interval;
		this.settingService = settingService;
	}

	@Override
	public void run() {
		System.out.println("remind"+count);
		count++;
	}
}
