package com.bbs.actions;

import java.util.HashMap;
import java.util.Map;
import java.util.Timer;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.admin.settings.RecommendTask;
import com.bbs.entities.Settings;
import com.bbs.entities.User;
import com.bbs.services.SettingService;
import com.opensymphony.xwork2.ModelDriven;

public class SettingAction extends BaseAction implements ModelDriven<Settings>, ServletRequestAware {

	/**
	 * 
	 */
	private Settings settings;
	private HttpServletRequest httpServletRequest;
	private Map<String, Object> settingStatus;
	private static final long serialVersionUID = 1L;
	private SettingService settingService;

	public Map<String, Object> getSettingStatus() {
		return settingStatus;
	}

	public void setSettingStatus(Map<String, Object> settingStatus) {
		this.settingStatus = settingStatus;
	}

	public void setSettingService(SettingService settingService) {
		this.settingService = settingService;
	}

	public SettingService getSettingService() {
		return settingService;
	}

	public String turnOnRecommend() {
		User user = (User) session.get("user");
		settingStatus = new HashMap<>();
		if (user == null || !user.getRole().equals("admin")) {
			settingStatus.put("state", 2);
			return "settingAjax";
		}
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(RecommendTask.getInstance(), 0, 1000);
		settingStatus = new HashMap<>();
		settingStatus.put("state", 1);
		return "settingAjax";
	}

	public String turnOffRecommend() {
		User user = (User) session.get("user");
		settingStatus = new HashMap<>();
		if (user == null || !user.getRole().equals("admin")) {
			settingStatus.put("state", 2);
			return "settingAjax";
		}
		RecommendTask recommendTask = RecommendTask.getInstance();
		recommendTask.cancel();
		settingStatus.put("state", 1);
		return "settingAjax";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.httpServletRequest = request;
	}

	@Override
	public Settings getModel() {
		return settings;
	}
}
