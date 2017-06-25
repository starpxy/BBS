package com.bbs.actions;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.User;
import com.bbs.services.BorrowedRecordService;
import com.opensymphony.xwork2.ModelDriven;


public class BorrowedRecordAction extends BaseAction implements ModelDriven<BorrowedRecord>,ServletRequestAware{
	private static final long serialVersionUID = 1L;
	private BorrowedRecordService borrowedRecordService;
	private BorrowedRecord borrowedRecord;
	private HttpServletRequest httpServletRequest;
	private Map<String, Object> borrowedMap;
	public Map<String, Object> getBorrowedMap() {
		return borrowedMap;
	}
	public void setBorrowedRecord(BorrowedRecord borrowedRecord) {
		this.borrowedRecord = borrowedRecord;
	}

	public BorrowedRecord getBorrowedRecord() {
		return borrowedRecord;
	}

	public void setBorrowedRecordService(BorrowedRecordService borrowedRecordService) {
		this.borrowedRecordService = borrowedRecordService;
	}

	public String checkBorrowedRecord() {
		User user = (User) session.get("user");
		if (user != null) {
			request.put("borrowedRecord", borrowedRecordService.checkBorrowedRecord(user));
		}
		return "checkBorrowedRecord";
	}
//	public String borrowlist(){
//		
//	}
	public String createRecord() {
		borrowedRecord.setUser((User)session.get("user"));
		borrowedRecord.setUpdateAt(new Date());
		borrowedRecord.setStatus("unconfirmed");
		BookItem bookItem = new BookItem();
		bookItem.setItemId(Integer.valueOf(httpServletRequest.getParameter("itemId")));
		borrowedRecord.setBookItem(bookItem);
		borrowedRecord.setBorrowedAt(new Date());
		int i = borrowedRecordService.createRecord(borrowedRecord);
		borrowedMap= new HashMap<>();
		borrowedMap.put("state", i);
		return "createRecord";
	}
	public String borrowlist(){
		User user = (User) session.get("user");
		return "borrowlist";
	}
	public void prepareCreateRecord(){
		this.borrowedRecord = new BorrowedRecord();
	}
	@Override
	public BorrowedRecord getModel() {
		return null;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		httpServletRequest = request;
	}

}
