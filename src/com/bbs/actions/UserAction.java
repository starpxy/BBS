package com.bbs.actions;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.bbs.entities.User;
import com.bbs.services.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class UserAction extends ActionSupport implements RequestAware,ModelDriven<User>,Preparable{
	/**
	 * 
	 */
	private Map<String, Object> request;
	private static final long serialVersionUID = 1L;

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}
	private UserService userService;
	private User user;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String login(){
		if (userService.login(user)) {
			request.put("user", user);
			return "granted";
		}
		else{
			return "refused";
		}
	}
	public void prepareLogin(){
		user = new User();
	}
	public void prepareRegister(){
		user = new User();
	}
	public String register(){
		user.setRole("user");
		user.setRecommendFre(1);
		userService.register(user);
		return "register";
	}
	@Override
	public User getModel() {
		return user;
	}
	@Override
	public void prepare() throws Exception {}
}
