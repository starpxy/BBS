package com.bbs.services;

import java.util.List;

import com.bbs.dao.UserDao;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.User;

public class UserService {
	private UserDao userDao;

	public List<BorrowedRecord> payState(User user) {
		return userDao.payState(user);
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public boolean login(User user) {
		return userDao.login(user);
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

	public String adminLogin(User user) {
		return userDao.adminLogin(user);
	}

	public void changePass(User user) {
		userDao.changePass(user);
	}

	public void setRecomFreq(User user) {
		userDao.setRecomFreq(user);
	}
}
