package com.bbs.services;

import com.bbs.dao.UserDao;

public class UserService {
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
}
