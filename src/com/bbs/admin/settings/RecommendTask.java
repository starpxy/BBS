package com.bbs.admin.settings;

import java.util.TimerTask;

import com.bbs.entities.Settings;
import com.bbs.services.SettingService;

public class RecommendTask extends TimerTask {
	private long interval;
	private SettingService settingService;
	private static int count = 0;
	private static RecommendTask recommendTask;

	private RecommendTask() {
		super();
	}

	public static RecommendTask getInstance() {
		if (recommendTask == null || !recommendTask.cancel()) {
			recommendTask = new RecommendTask();
			return recommendTask;
		} else {
			return recommendTask;
		}
	}
	
	public static RecommendTask getInstance(SettingService settingService,long interval) {
		if (recommendTask == null || !recommendTask.cancel()) {
			recommendTask = new RecommendTask(settingService,interval);
			return recommendTask;
		} else {
			return recommendTask;
		}
	}
	
	public void setSettingService(SettingService settingService) {
		this.settingService = settingService;
	}

	public void setInterval(long interval) {
		this.interval = interval;
	}

	private RecommendTask(SettingService settingService, long interval) {
		super();
		this.interval = interval;
		this.settingService = settingService;
	}

	public void cancelTask() {
		recommendTask.cancel();
		Settings settings = settingService.showSettings();
		settings.setRecommend(0);
		settingService.update(settings);
	}

	@Override
	public void run() {
		System.out.println("hello: " + count);
		count++;
	}

}
