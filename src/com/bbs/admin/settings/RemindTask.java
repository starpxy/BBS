package com.bbs.admin.settings;

import java.util.TimerTask;

public class RemindTask extends TimerTask {
	private static RemindTask remindTask;

	private RemindTask() {
		if (remindTask == null) {
			remindTask = new RemindTask();
		}
	}

	@Override
	public void run() {

	}

	public RemindTask getInstance() {
		if (remindTask == null) {
			remindTask = new RemindTask();
			return remindTask;
		} else {
			return remindTask;
		}
	}
}
