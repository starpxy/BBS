package com.bbs.admin.settings;

import java.util.Iterator;
import java.util.List;
import java.util.TimerTask;

import com.bbs.api.TemplateMessagePushing;
import com.bbs.entities.Book;
import com.bbs.entities.Settings;
import com.bbs.entities.User;
import com.bbs.entities.WaitList;
import com.bbs.services.SettingService;

public class WaitTask extends TimerTask {
	private long interval;
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
		try {
			List<WaitList> waitLists = settingService.showWaitLists();
			Iterator<WaitList> iterator = waitLists.iterator();
			while (iterator.hasNext()) {
				WaitList waitList = iterator.next();
				User user = waitList.getUser();
				Book book = waitList.getBook();
				if (settingService.isBookAva(book) && waitList.getStatus() == 0) {
					TemplateMessagePushing templateMessagePushing = new TemplateMessagePushing();
					templateMessagePushing.pushWishingBook(user, book);
					waitList.setStatus(1);
					settingService.changeWaitStatus(waitList);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
