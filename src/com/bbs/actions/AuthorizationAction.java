package com.bbs.actions;

import com.bbs.api.AuthorizationManager;
import com.bbs.entities.User;
import com.bbs.services.AuthorizationService;
import com.opensymphony.xwork2.ModelDriven;

public class AuthorizationAction extends BaseAction implements ModelDriven<AuthorizationManager>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AuthorizationManager manager;
	private AuthorizationService authorizationService;
	public void setAuthorizationService(AuthorizationService authorizationService) {
		this.authorizationService = authorizationService;
	}
	public String wechatLogin(){
		User user = authorizationService.wechatLogin(manager);
		session.put("openId", user.getWeChat());
		if (user.getPhoneNumber()==null) {
			return "newMember";
		}
		else if (user.getWeChat()!=null) 
		{
			session.put("user", authorizationService.getUserInfo(user.getWeChat()));
			return SUCCESS;
		}
		else {
			return ERROR;
		}
	}
	public String register(){
		User user = authorizationService.wechatLogin(manager);
		session.put("openId", user.getWeChat());
		if (user.getPhoneNumber()!=null) {
			session.put("user", authorizationService.getUserInfo(user.getWeChat()));
			return "exist";
		}
		else if(user.getWeChat()!=null){
			return "newMember";
		}
		else{
			return ERROR;
		}
	}
	public void prepareWechatLogin(){
		manager = new AuthorizationManager();
	}
	public void prepareRegister(){
		manager = new AuthorizationManager();
	}
	@Override
	public AuthorizationManager getModel() {
		return manager;
	}

}
