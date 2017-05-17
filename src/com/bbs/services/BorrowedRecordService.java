package com.bbs.services;

import java.util.List;

import com.bbs.dao.BorrowedRecordDao;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.User;

public class BorrowedRecordService{
	BorrowedRecordDao borrowedRecordDao;
	public void setBorrowedRecordDao(BorrowedRecordDao borrowedRecordDao) {
		this.borrowedRecordDao = borrowedRecordDao;
	}
	public List<BorrowedRecord> checkBorrowedRecord(User user) {
		return borrowedRecordDao.checkBorrowedRecord(user);
	}
	
	public BorrowedRecord createBorrowedRecord(User user, BookItem bookItem){
			return borrowedRecordDao.createBorrowedRecord(user, bookItem);
	}
}
