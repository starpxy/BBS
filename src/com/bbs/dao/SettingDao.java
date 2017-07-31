package com.bbs.dao;

import java.util.List;

import com.bbs.entities.Settings;

public class SettingDao extends BaseDao{
	public Settings showSettings(){
		String hql = "FROM Settings";
		List<Settings> settings = getSession().createQuery(hql).list();
		if (settings.isEmpty()) {
			Settings setting = new Settings();
			getSession().save(setting);
			return setting;
		}
		else{
			return settings.get(0);
		}
	}
	
	public void update(Settings settings){
		getSession().update(settings);
	}
	
}
