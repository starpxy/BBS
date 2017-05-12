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
		User wUser = authorizationService.wechatLogin(manager);
		session.put("user", wUser);
		if (wUser.getPhoneNumber()==null) {
			return "newMember";
		}
		else {
			return SUCCESS;
		}
	}
	public void prepareWechatLogin(){
		manager = new AuthorizationManager();
	}
	@Override
	public AuthorizationManager getModel() {
		return manager;
	}

}
