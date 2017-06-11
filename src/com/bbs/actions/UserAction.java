package com.bbs.actions;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.api.TopScanManager;
import com.bbs.api.entities.QrCode;
import com.bbs.encrypt.ClearTextOutOfBoundException;
import com.bbs.encrypt.SHC32;
import com.bbs.entities.User;
import com.bbs.services.UserService;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONObject;

public class UserAction extends BaseAction implements ModelDriven<User>, ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest httpServletRequest;
	private UserService userService;
	private User user;
	private Map<String, Object> status;

	public Map<String, Object> getStatus() {
		return status;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String showQrCode() {
		String QrCode = TopScanManager.getQrCode(user.getUserId()+"");
		String ip = httpServletRequest.getHeader("x-forwarded-for");
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = httpServletRequest.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = httpServletRequest.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = httpServletRequest.getRemoteAddr();
		}
		status = new HashMap<>();
		status.put("QrCode", QrCode);
		return "showQrCode";
	}

	public String changePass() {
		userService.changePass(user);
		status = new HashMap<>();
		status.put("state", 1);
		if (session.containsKey("user")) {
			session.remove("user");
		}
		session.put("user", user);
		return "changeSucceed";
	}

	public String login() {
		if (session.get("user") != null) {
			return "granted";
		} else if (userService.login(user)) {
			session.put("user", userService.getInfo(user));
			return "granted";
		} else {
			return "refused";
		}
	}

	public String register() {
		String openid = null;
		openid = (String) session.get("openId");
		user.setWeChat(openid);
		user.setRole("user");
		user.setRecommendFre(1);
		userService.register(user);
		return "register";
	}

	public String setRecomFreq() {
		User user = (User) session.get("user");
		user.setRecommendFre(this.user.getRecommendFre());
		if (user != null) {
			userService.setRecomFreq(user);
		}
		return "setRecomFreq";
	}

	public String logout() {
		if (session.containsKey("user")) {
			session.remove("user");
		}
		return "logout";
	}

	public void prepareChangePass() {
		user = new User();
	}

	public void prepareLogin() {
		user = new User();
	}

	public void prepareRegister() {
		user = new User();
	}

	public void prepareSetRecomFreq() {
		user = new User();
	}

	public void prepareShowQrCode() {
		user = new User();
	}

	@Override
	public User getModel() {
		return user;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.httpServletRequest = request;
	}
}
