package com.bbs.admin.settings;

import java.util.TimerTask;

public class RecommendTask extends TimerTask {

	private static RecommendTask recommendTask;

	private RecommendTask() {
		if (recommendTask == null) {
			recommendTask = new RecommendTask();
		}
	}

	@Override
	public void run() {

	}

	public RecommendTask getInstance() {
		if (recommendTask == null) {
			recommendTask = new RecommendTask();
			return recommendTask;
		} else {
			return recommendTask;
		}
	}

}
