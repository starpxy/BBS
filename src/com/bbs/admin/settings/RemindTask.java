package com.bbs.admin.settings;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TimerTask;

import com.bbs.api.TemplateMessagePushing;
import com.bbs.entities.Book;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Settings;
import com.bbs.entities.User;
import com.bbs.entities.WaitList;
import com.bbs.services.SettingService;
import com.sun.org.apache.bcel.internal.generic.DADD;

public class RemindTask extends TimerTask {
	private long interval;
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
		List<BorrowedRecord> borrowedRecords = settingService.showRecordsToReturn();
		Iterator<BorrowedRecord> iterator = borrowedRecords.iterator();
		while (iterator.hasNext()) {
			BorrowedRecord borrowedRecord = iterator.next();
			Long now = new Date().getTime();
			if ((borrowedRecord.getBorrowedAt().getTime() + interval * 1000) < now) {
				Book book = borrowedRecord.getBookItem().getBook();
				User user = borrowedRecord.getUser();
				TemplateMessagePushing templateMessagePushing = new TemplateMessagePushing();
				templateMessagePushing.pushRecordOverdue(user, book);
				borrowedRecord.setStatus(4);
				settingService.changeRecordStatus(borrowedRecord);
			}
			else if((now-borrowedRecord.getBorrowedAt().getTime())>(interval*2300/30)){
				TemplateMessagePushing templateMessagePushing = new TemplateMessagePushing();
				int days = (int) (30-(now-borrowedRecord.getBorrowedAt().getTime())/(interval*1000/30));
				templateMessagePushing.pushReturningBooks(borrowedRecord.getUser().getWeChat(), borrowedRecord.getBookItem().getBook().getBookTitle(), days);
			}
		}
	}
}
