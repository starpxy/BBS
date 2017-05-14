package com.bbs.dao;

import java.util.List;

import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.User;

public class BorrowedRecordDao extends BaseDao{
	public List<BorrowedRecord> checkBorrowedRecord(User user) {
		List<BorrowedRecord> records=null;
		String hql="FROM BorrowedRecord WHERE user.userId="+user.getUserId();
		records=getSession().createQuery(hql).list();
		return records;
	}
}
