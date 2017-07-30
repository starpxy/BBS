package com.bbs.services;

import com.bbs.dao.SettingDao;
import com.bbs.entities.Settings;

public class SettingService {
	private SettingDao settingDao;

	public SettingDao getSettingDao() {
		return settingDao;
	}

	public void setSettingDao(SettingDao settingDao) {
		this.settingDao = settingDao;
	}

	public Settings showSettings() {
		return settingDao.showSettings();
	}

	public void update(Settings settings) {
		settingDao.update(settings);
	}
}
