package com.bbs.services;

import java.util.List;

import com.bbs.dao.UserDao;
import com.bbs.entities.AccessLog;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Comment;
import com.bbs.entities.CreditHistory;
import com.bbs.entities.ExtraInfo;
import com.bbs.entities.Favorite;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;
import com.bbs.entities.UserCredit;

public class UserService {
	private UserDao userDao;

	public List<AccessLog> checkLogs(User user) {
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

	public List<CreditHistory> creditHistory(User user) {
		return userDao.creditHistory(user);
	}

	public UserCredit userCredit(User user) {
		return userDao.userCredit(user);
	}

	public ExtraInfo showExtraInfo(User user) {
		return userDao.showExtraInfo(user);
	}
	
	public void saveExtraInfo(ExtraInfo extraInfo){
		userDao.saveExtraInfo(extraInfo);
	}
	
	public List<BookItem> adminInitial(int page) {
		return userDao.adminInitial(page);
	}

	public List<User> adminUsers() {
		return userDao.adminUsers();
	}

	public List<AccessLog> adminUsersArea() {
		return userDao.adminUsersArea();
	}

	public List<AccessLog> adminShowInfo() {
		return userDao.adminShowInfo();
	}

	public List<BorrowedRecord> adminListRecords() {
		return userDao.adminListRecords();
	}

	public int changeRole(String userId, String role) {
		return userDao.changeRole(userId, role);
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

	public int addToFavorite(User user, String bookId) {
		return userDao.addToFavorite(user, bookId);
	}

	public int addToSelected(String commentId) {
		return userDao.addToSelected(commentId);
	}

	public List<Favorite> myFavorites(User user) {
		return userDao.myFavorites(user);
	}

	public int deleteReservation(String reservationId) {
		return userDao.deleteReservation(reservationId);
	}

	public int deleteFavorite(User user, String bookId) {
		return userDao.deleteFavorite(user, bookId);
	}

	public int deleteAllFavorites(User user) {
		return userDao.deleteAllFavorites(user);
	}
}