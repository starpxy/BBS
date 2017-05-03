package com.bbs.actions;

import com.bbs.services.UserService;

public class UserAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String login(){
		return "granted";
	}
}
