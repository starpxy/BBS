package com.bbs.services;

import java.util.List;

import com.bbs.dao.UserDao;
import com.bbs.entities.AccessLog;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Comment;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;

public class UserService {
	private UserDao userDao;
	
	public List<AccessLog> checkLogs(User user){
		return userDao.checkLogs(user);
	}
	
	public List<BorrowedRecord> payState(User user) {
		return userDao.payState(user);
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public int getPages() {
		return userDao.getPages();
	}

	public boolean login(User user) {
		return userDao.login(user);
	}

	public void changeSomething(User user) {
		userDao.changeSomething(user);
	}

	public void register(User user) {
		userDao.register(user);
	}

	public User getInfo(User user) {
		return userDao.getInfo(user);
	}

	public User getUserInfo(User user) {
		return userDao.getUserInfo(user);
	}

	public boolean adminLogin(User user) {
		return userDao.adminLogin(user);
	}

	public void changePass(User user) {
		userDao.changePass(user);
	}

	public void setRecomFreq(User user) {
		userDao.setRecomFreq(user);
	}

	public List<BookItem> adminInitial(int page) {
		return userDao.adminInitial(page);
	}

	public List<User> adminUsers() {
		return userDao.adminUsers();
	}

	public List<BorrowedRecord> adminListRecords() {
		return userDao.adminListRecords();
	}

	public List<Reservation> adminListReservations() {
		return userDao.adminListReservations();
	}

	public List<Comment> adminListComments() {
		return userDao.adminListComments();
	}

	public void paySucceed(String outTradeNumber, String[] records) {
		userDao.paySucceed(outTradeNumber, records);
	}

	public User adminScanUser(String userId) {
		return userDao.adminScanUser(userId);
	}

	public List<BorrowedRecord> adminBorrow(String userId) {
		return userDao.adminBorrow(userId);
	}

	public void adminConfirmBorrow(String[] ids) {
		userDao.adminConfirmBorrow(ids);
	}

	public List<BorrowedRecord> adminReturn(String userId) {
		return userDao.adminReturn(userId);
	}

	public void adminConfirmReturn(String[] ids) {
		userDao.adminConfirmReturn(ids);
	}

	public void writeLog(AccessLog accessLog) {
		userDao.writeLog(accessLog);
	}
}