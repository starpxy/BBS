package com.bbs.dao;

import java.util.List;

import com.bbs.entities.Settings;

public class SettingDao extends BaseDao{
	public List<Settings> showSettings(){
		String hql = "FROM Settings";
		return getSession().createQuery(hql).list();
	}
}
