package com.bbs.dao;

import java.util.List;

import com.bbs.entities.BorrowedRecord;
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
	
	public List<BorrowedRecord> unreturnedRecords(){
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.status=2";
		List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
		return borrowedRecords;
	}
	
}
