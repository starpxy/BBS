package com.bbs.services;

import com.bbs.api.AuthorizationManager;
import com.bbs.dao.AuthorizationDao;
import com.bbs.entities.User;

public class AuthorizationService {
	private AuthorizationDao authorizationDao;
	public void setAuthorizationDao(AuthorizationDao authorizationDao) {
		this.authorizationDao = authorizationDao;
	}
	public User wechatLogin(AuthorizationManager authorizationManager){
		return authorizationDao.wechatLogin(authorizationManager);
	}
}
