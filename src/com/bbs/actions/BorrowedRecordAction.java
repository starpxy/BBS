package com.bbs.actions;


import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.User;
import com.bbs.services.BorrowedRecordService;

public class BorrowedRecordAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	BorrowedRecordService borrowedRecordService;
	public void setBorrowedRecordService(BorrowedRecordService borrowedRecordService) {
		this.borrowedRecordService = borrowedRecordService;
	}
	public String checkBorrowedRecord() {
		User user=(User) session.get("user");
		if(user!=null){
			request.put("borrowedRecord", borrowedRecordService.checkBorrowedRecord(user));
		}
		return "checkBorrowedRecord";
	}
	
	public String createBorrowedRecord(){
		User user=(User) session.get("user");
		BookItem bookItem=(BookItem) session.get("bookItem");
		BorrowedRecord borrowedRecord=borrowedRecordService.createBorrowedRecord(user, bookItem);
		if(borrowedRecord!=null){
			request.put("borrowRecord", borrowedRecord);
			return "createBorrowedRecord";
		}
		else{
			return "outOfBorrowLimit";
		}
	}
	
	

}
