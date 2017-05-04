package com.bbs.services;

import com.bbs.dao.UserDao;
import com.bbs.entities.User;

public class UserService {
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public boolean login(User user){
		return userDao.login(user);
	}
	public void register(User user){
		userDao.register(user);
	}
}
