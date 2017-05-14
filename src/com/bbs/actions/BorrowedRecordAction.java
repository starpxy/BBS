package com.bbs.actions;


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

}
