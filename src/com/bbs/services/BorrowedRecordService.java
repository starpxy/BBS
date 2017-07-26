package com.bbs.services;

import java.util.List;

import com.bbs.dao.BorrowedRecordDao;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.User;

public class BorrowedRecordService {
	private BorrowedRecordDao borrowedRecordDao;

	public void setBorrowedRecordDao(BorrowedRecordDao borrowedRecordDao) {
		this.borrowedRecordDao = borrowedRecordDao;
	}

	public List<BorrowedRecord> checkBorrowedRecord(User user) {
		return borrowedRecordDao.checkBorrowedRecord(user);
	}

	public List<BorrowedRecord> borrowlist(User user) {
		return borrowedRecordDao.borrowlist(user);
	}

	public int createRecord(BorrowedRecord borrowedRecord) {
		return borrowedRecordDao.createRecord(borrowedRecord);
	}

	public boolean returnRemaining(String userId, String borrowedId) {
		return borrowedRecordDao.returnRemaining(userId, borrowedId);
	}

	public int cancel(User user, String recordId) {
		return borrowedRecordDao.cancel(user, recordId);
	}

	public List<BorrowedRecord> borrowHistory(User user) {
		return borrowedRecordDao.borrowHistory(user);
	}
}
