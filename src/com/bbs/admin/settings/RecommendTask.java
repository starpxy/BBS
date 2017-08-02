package com.bbs.admin.settings;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TimerTask;

import com.bbs.api.TemplateMessagePushing;
import com.bbs.entities.Book;
import com.bbs.entities.Settings;
import com.bbs.entities.User;
import com.bbs.io.ObjectFileManager;
import com.bbs.services.SettingService;

public class RecommendTask extends TimerTask {
	private long interval;
	private SettingService settingService;
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

	public static RecommendTask getInstance(SettingService settingService, long interval) {
		if (recommendTask == null || !recommendTask.cancel()) {
			recommendTask = new RecommendTask(settingService, interval);
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
		List<User> users = settingService.selectUsers();
		Iterator<User> iterator = users.iterator();
		while (iterator.hasNext()) {
			User user = iterator.next();
			List<Book> books = settingService.recommendBook(user);
			ObjectFileManager.writeRecommendToFile(user, books);
			Book book = null;
			if (books != null) {
				book = books.get(0);
			}
			Date now = new Date();
			Long time = interval * 1000 * user.getRecommendFre();
			if (book != null && (user.getLastRecommend() == null
					|| (now.getTime() - user.getLastRecommend().getTime()) > time)) {
				TemplateMessagePushing templateMessagePushing = new TemplateMessagePushing();
				templateMessagePushing.pushRecommendBook(user, book);
				user.setLastRecommend(now);
				settingService.saveUser(user);
			}
		}
	}

}
