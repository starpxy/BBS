package com.bbs.actions;

import java.util.HashMap;
import java.util.Map;
import java.util.Timer;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.admin.settings.RecommendTask;
import com.bbs.admin.settings.RemindTask;
import com.bbs.admin.settings.ReserveTask;
import com.bbs.admin.settings.WaitTask;
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

	public String turnOn() {
		User user = (User) session.get("admin");
		settingStatus = new HashMap<>();
		if (user == null || !user.getRole().equals("admin")) {
			settingStatus.put("state", 2);
			return "settingAjax";
		}
		Settings settings = settingService.showSettings();
		String settingNo = httpServletRequest.getParameter("settingNo");
		String runInterval = httpServletRequest.getParameter("runInterval");
		String checkInterval = httpServletRequest.getParameter("checkInterval");
		if (settingNo == null || runInterval == null || checkInterval == null) {
			settingStatus.put("state", 3);
			return "settingAjax";
		}
		Timer timer = new Timer();
		int num = Integer.valueOf(settingNo);
		switch (num) {
		case 1:
			ReserveTask reserveTask = ReserveTask.getInstance(settingService,Long.valueOf(checkInterval));
			settings.setReserveInterval(Long.valueOf(checkInterval));
			settings.setReservePeriod(Long.valueOf(runInterval));
			settings.setReserveOverdue(1);
			settingService.update(settings);
			timer.scheduleAtFixedRate(reserveTask, 0, settings.getReservePeriod());
			settingStatus.put("state", 1);
			break;
		case 2:
			RecommendTask recommendTask = RecommendTask.getInstance(settingService,Long.valueOf(checkInterval));
			settings.setRecInterval(Long.valueOf(checkInterval));
			settings.setRecPeriod(Long.valueOf(runInterval));
			settings.setRecommend(1);
			settingService.update(settings);
			timer.scheduleAtFixedRate(recommendTask, 0, settings.getRecPeriod());
			settingStatus.put("state", 1);
			break;
		case 3:
			RemindTask remindTask = RemindTask.getInstance(settingService,Long.valueOf(checkInterval));
			settings.setRemindInterval(Long.valueOf(checkInterval));
			settings.setRemindPeriod(Long.valueOf(runInterval));
			settings.setRemind(1);
			settingService.update(settings);
			timer.scheduleAtFixedRate(remindTask, 0, settings.getRemindPeriod());
			settingStatus.put("state", 1);
			break;
		case 4:
			WaitTask waitTask = WaitTask.getInstance(settingService,Long.valueOf(checkInterval));
			settings.setWaitInterval(Long.valueOf(checkInterval));
			settings.setWaitPeriod(Long.valueOf(runInterval));
			settings.setWaitList(1);
			settingService.update(settings);
			timer.scheduleAtFixedRate(waitTask, 0, settings.getWaitPeriod());
			settingStatus.put("state", 1);
			break;
		default:
			settingStatus.put("state", 3);
			break;
		}
		settingStatus.put("state", 1);
		return "settingAjax";
	}

	public String turnOff() {
		User user = (User) session.get("admin");
		settingStatus = new HashMap<>();
		if (user == null || !user.getRole().equals("admin")) {
			settingStatus.put("state", 2);
			return "settingAjax";
		}
		String settingNo = httpServletRequest.getParameter("settingNo");
		int num = Integer.valueOf(settingNo);
		switch (num) {
		case 1:
			ReserveTask reserveTask = ReserveTask.getInstance();
			reserveTask.setSettingService(settingService);
			reserveTask.cancelTask();
			settingStatus.put("state", 1);
			break;
		case 2:
			RecommendTask recommendTask = RecommendTask.getInstance();
			recommendTask.setSettingService(settingService);
			recommendTask.cancelTask();
			settingStatus.put("state", 1);
			break;
		case 3:
			RemindTask remindTask = RemindTask.getInstance();
			remindTask.setSettingService(settingService);
			remindTask.cancelTask();
			settingStatus.put("state", 1);
			break;
		case 4:
			WaitTask waitTask = WaitTask.getInstance();
			waitTask.setSettingService(settingService);
			waitTask.cancelTask();
			settingStatus.put("state", 1);
			break;
		default:
			settingStatus.put("state", 3);
			break;
		}
		return "settingAjax";
	}

	public String settings() {
		User user = (User) session.get("admin");
		if (user == null || !user.getRole().equals("admin")) {
			return "loginFail";
		} else {
			request.put("setting", settingService.showSettings());
			return "settings";
		}
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
