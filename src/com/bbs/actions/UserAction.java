package com.bbs.actions;

import com.bbs.api.TempletMessagePushing;
import com.bbs.entities.User;
import com.bbs.services.UserService;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends BaseAction implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private UserService userService;
	private User user;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String login(){
		if (session.get("user")!=null) {
			return "granted";
		}
		else if (userService.login(user)) {
			session.put("user", userService.getInfo(user));
			return "granted";
		}
		else{
			return "refused";
		}
	}
	public void pushing(){
		TempletMessagePushing templetMessagePushing = new TempletMessagePushing();
		templetMessagePushing.pushingReturningBooks("oQe5IuOG4oLF1N57aEQjmGEg5peU");
	}
	public void prepareLogin(){
		user = new User();
	}
	public void prepareRegister(){
		user = new User();
	}
	public String register(){
		String openid = null;
		openid = (String) session.get("openId");
		user.setWeChat(openid);
		user.setRole("user");
		user.setRecommendFre(1);
		userService.register(user);
		return "register";
	}
	@Override
	public User getModel() {
		return user;
	}
}
