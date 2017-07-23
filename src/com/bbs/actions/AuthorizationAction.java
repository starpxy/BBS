package com.bbs.actions;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.api.AuthorizationManager;
import com.bbs.entities.AccessLog;
import com.bbs.entities.User;
import com.bbs.logs.IPUtil;
import com.bbs.logs.LogUtil;
import com.bbs.services.AuthorizationService;
import com.opensymphony.xwork2.ModelDriven;

public class AuthorizationAction extends BaseAction implements ModelDriven<AuthorizationManager>,ServletRequestAware{

	/**
	 * 
	 */
	private HttpServletRequest httpServletRequest;
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
			AccessLog accessLog = new AccessLog();
			accessLog.setUser((User)session.get("user"));
			accessLog.setLogAt(new Date());
			accessLog.setIp(IPUtil.getIp(httpServletRequest));
			Map<String, Object> map = LogUtil.getInfo(accessLog.getIp());
			accessLog.setArea((String)map.get("area"));
			accessLog.setLocation((String)map.get("location"));
			accessLog.setMethod(1);
			authorizationService.writeLog(accessLog);
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
	@Override
	public void setServletRequest(HttpServletRequest request) {
		httpServletRequest = request;
	}

}
