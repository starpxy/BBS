package com.bbs.admin.settings;

import java.util.TimerTask;


public class StarTask extends TimerTask {
	private static StarTask starTask;
	private StarTask() {
		if (starTask == null) {
			starTask = new StarTask();
		}
	}

	@Override
	public void run() {
		
	}

	public StarTask getInstance() {
		if (starTask == null) {
			starTask = new StarTask();
			return starTask;
		} else {
			return starTask;
		}
	}
}
