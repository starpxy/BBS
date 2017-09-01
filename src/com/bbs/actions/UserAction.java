package com.bbs.actions;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.api.JSAPIInitial;
import com.bbs.api.TemplateMessagePushing;
import com.bbs.api.TopScanManager;
import com.bbs.api.UnifiedOrder;
import com.bbs.api.entities.UploadResult;
import com.bbs.encrypt.IncorrectCipherTextLengthException;
import com.bbs.encrypt.SHC32;
import com.bbs.entities.AccessLog;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.ExtraInfo;
import com.bbs.entities.User;
import com.bbs.io.ImageUploader;
import com.bbs.logs.IPUtil;
import com.bbs.logs.LogUtil;
import com.bbs.properties.PathProperty;
import com.bbs.redis.RedisManager;
import com.bbs.services.UserService;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
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

	public String adminUsers() {
		User user = (User) session.get("admin");
		if (user != null && user.getRole().equals("admin")) {
			request.put("users", userService.adminUsers());
			return "adminUsers";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}

	public String changeRole() {
		User user = (User) session.get("admin");
		status = new HashMap<>();
		if (user != null && user.getRole().equals("admin")) {
			String userId = httpServletRequest.getParameter("userId");
			String role = httpServletRequest.getParameter("role");
			status.put("state", userService.changeRole(userId, role));
		} else {
			status.put("state", 2);
		}
		return "adminUsersAjax";
	}

	public String adminInfo() {
		User user = (User) session.get("admin");
		if (user != null && user.getRole().equals("admin")) {
			List<AccessLog> accessLogs = userService.adminShowInfo();
			request.put("logs", accessLogs);
			return "adminInfo";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}

	public String userChart() {
		User user = (User) session.get("admin");
		if (user != null && user.getRole().equals("admin")) {
			return "userChart";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}

	public String bookChart() {
		User user = (User) session.get("admin");
		if (user != null && user.getRole().equals("admin")) {
			return "bookChart";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}

	public String changeName() {
		User user = (User) session.get("user");
		if (user == null) {
			return "refused";
		}
		String newName = httpServletRequest.getParameter("name");
		if (newName != null && !newName.equals("")) {
			user.setName(newName);
			userService.changeSomething(user);
			status = new HashMap<>();
			status.put("state", 1);
			session.put("user", user);
		} else {
			status.put("state", 2);
		}
		return "adminUsersAjax";
	}

	public String changePhoneNumber() {
		User user = (User) session.get("user");
		if (user == null) {
			return "refused";
		}
		String phoneNumber = httpServletRequest.getParameter("phoneNumber");
		if (phoneNumber != null && !phoneNumber.equals("")) {
			user.setPhoneNumber(phoneNumber);
			userService.changeSomething(user);
			status = new HashMap<>();
			status.put("state", 1);
			session.put("user", user);
		} else {
			status.put("state", 2);
		}
		return "adminUsersAjax";
	}

	public String changeRecommendFre() {
		User user = (User) session.get("user");
		if (user == null) {
			return "refused";
		}
		String recommendFre = httpServletRequest.getParameter("fre");
		if (recommendFre != null && !recommendFre.equals("")) {
			user.setRecommendFre(Integer.valueOf(recommendFre));
			userService.changeSomething(user);
			status = new HashMap<>();
			status.put("state", 1);
			session.put("user", user);
		} else {
			status.put("state", 2);
		}
		return "adminUsersAjax";
	}

	public String checkLogs() {
		User user = (User) session.get("user");
		if (user == null) {
			return "refused";
		}
		List<AccessLog> accessLogs = userService.checkLogs(user);
		status = new HashMap<>();
		status.put("logs", JSONArray.fromObject(accessLogs).toString());
		return "adminUsersAjax";
	}

	public String commentChart() {
		User user = (User) session.get("admin");
		if (user != null && user.getRole().equals("admin")) {
			return "commentChart";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}

	public String adminUsersAjax() {
		User user = (User) session.get("admin");
		status = new HashMap<>();
		if (user != null && user.getRole().equals("admin")) {
			status.put("users", JSONArray.fromObject(userService.adminUsers()));
			status.put("state", 1);
		} else if (user != null) {
			status.put("state", 2);
		} else {
			status.put("state", 2);
		}
		return "adminUsersAjax";
	}

	public String deleteReservation() {
		User user = (User) session.get("admin");
		status = new HashMap<>();
		if (user != null && user.getRole().equals("admin")) {
			String reservationId = httpServletRequest.getParameter("reservationId");
			if (reservationId == null) {
				status.put("state", 3);
				return "adminUsersAjax";
			}
			status.put("state", userService.deleteReservation(reservationId));
		} else if (user != null) {
			status.put("state", 2);
		} else {
			status.put("state", 2);
		}
		return "adminUsersAjax";
	}

	public String adminUsersAreaAjax() {
		User user = (User) session.get("admin");
		status = new HashMap<>();
		if (user != null && user.getRole().equals("admin")) {
			status.put("areas", JSONArray.fromObject(userService.adminUsersArea()));
			status.put("state", 1);
		} else if (user != null) {
			status.put("state", 2);
		} else {
			status.put("state", 2);
		}
		return "adminUsersAjaxArea";
	}

	public String adminBooks() {
		User user = (User) session.get("admin");
		if (user != null && user.getRole().equals("admin")) {
			String p = httpServletRequest.getParameter("page");
			int page = 1;
			if (p != null) {
				page = Integer.valueOf(p);
			}
			request.put("books", userService.adminInitial(page));
			request.put("pages", userService.getPages() + 1);
			request.put("page", page);
			return "adminBooks";
		} else {
			return "adminLoginFail";
		}
	}

	public String adminLogin() {
		User user = (User) session.get("admin");
		if (user != null && user.getRole().equals("admin")) {
			return "adminLoginSuccess";
		} else if (user != null) {
			return "adminLoginFail";
		}
		boolean check = userService.adminLogin(this.user);
		if (check) {
			session.put("admin", userService.getInfo(this.user));
			return "adminLoginSuccess";
		} else {
			return "adminLoginFail";
		}
	}

	public String adminLogout() {
		if (session.containsKey("admin")) {
			session.remove("admin");
		}
		status = new HashMap<>();
		status.put("state", 1);
		return "adminLogout";
	}

	public String adminListRecords() {
		User user = (User) session.get("admin");
		if (user != null && user.getRole().equals("admin")) {
			request.put("records", userService.adminListRecords());
			return "adminListRecords";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}

	public String adminListReservations() {
		User user = (User) session.get("admin");
		if (user != null && user.getRole().equals("admin")) {
			request.put("reservations", userService.adminListReservations());
			return "adminListReservations";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}

	public String addToSelected() {
		User user = (User) session.get("admin");
		status = new HashMap<>();
		if (user != null && user.getRole().equals("admin")) {
			status.put("state", userService.addToSelected(httpServletRequest.getParameter("commentId")));
		} else {
			status.put("state", 2);
		}
		return "adminUsersAjaxArea";
	}

	public String adminListComments() {
		User user = (User) session.get("admin");
		if (user != null && user.getRole().equals("admin")) {
			request.put("comments", userService.adminListComments());
			return "adminListComments";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}

	public String adminScanUser() {
		String userInfo = httpServletRequest.getParameter("userInfo");
		SHC32 shc32 = SHC32.getInstance();
		try {
			String text = shc32.decrypt(userInfo);
			System.out.println(text);
			String userId = null;
			status = new HashMap<>();
			if (text.startsWith("userId") && text.endsWith("SHC")) {
				userId = text.substring(6, text.length() - 3);
				User user = userService.adminScanUser(userId);
				if (user != null) {
					status.put("state", 1);
					status.put("user", user);
				} else {
					status.put("state", 2);
				}
			} else {
				status.put("state", 3);
			}
		} catch (IncorrectCipherTextLengthException e) {
			e.printStackTrace();
		}
		return "adminScanUser";
	}

	public String adminBorrow() {
		String userId = httpServletRequest.getParameter("userId");
		status = new HashMap<>();
		List<BorrowedRecord> borrowedRecords = userService.adminBorrow(userId);
		if (borrowedRecords.isEmpty()) {
			status.put("state", 2);
		} else {
			status.put("state", 1);
			status.put("records", JSONArray.fromObject(borrowedRecords));
		}
		return "adminBorrow";
	}

	public String adminConfirmBorrow() {
		String msg = httpServletRequest.getParameter("selecteditems");
		JSONArray jsonArray = JSONArray.fromObject(msg);
		String[] ids = new String[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			ids[i] = jsonArray.getString(i);
		}
		userService.adminConfirmBorrow(ids);
		return "adminConfirmBorrow";
	}

	public String adminReturn() {
		String userId = httpServletRequest.getParameter("userId");
		status = new HashMap<>();
		List<BorrowedRecord> borrowedRecords = userService.adminReturn(userId);
		if (borrowedRecords.isEmpty()) {
			status.put("state", 2);
		} else {
			status.put("state", 1);
			status.put("records", JSONArray.fromObject(borrowedRecords));
		}
		return "adminReturn";
	}

	public String adminConfirmReturn() {
		String msg = httpServletRequest.getParameter("selecteditems");
		JSONArray jsonArray = JSONArray.fromObject(msg);
		String[] ids = new String[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			ids[i] = jsonArray.getString(i);
		}
		userService.adminConfirmReturn(ids);
		return "adminConfirmReturn";
	}

	public String showQrCode() {
		String QrCode = TopScanManager.getQrCode(user.getUserId() + "");
		status = new HashMap<>();
		status.put("QrCode", QrCode);
		return "showQrCode";
	}

	public String payState() {
		status = new HashMap<>();
		user = (User) session.get("user");
		List<BorrowedRecord> payState = userService.payState(user);
		String ip = IPUtil.getIp(httpServletRequest);
		if (payState != null && !payState.isEmpty()) {
			UnifiedOrder unifiedOrder = new UnifiedOrder();
			float parm = (10 - user.getLevel()) * 0.1f;
			JSONObject jsonObject = JSONObject
					.fromObject(unifiedOrder.createOrder(user.getWeChat(), ip, (int) (parm * 10 * payState.size())));
			status.put("params", jsonObject.toString());
			status.put("pay", 1);
			status.put("ip", ip);
			status.put("payState", JSONArray.fromObject(payState));
		} else {
			status.put("pay", 0);
		}
		return "payState";
	}

	public String paySucceed() {
		String recordIds = httpServletRequest.getParameter("ids");
		String outTradeNumber = httpServletRequest.getParameter("outTradeNumber");
		JSONArray jsonArray = JSONArray.fromObject(recordIds);
		String[] records = new String[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			records[i] = jsonArray.getString(i);
		}
		userService.paySucceed(outTradeNumber, records);
		TemplateMessagePushing templateMessagePushing = new TemplateMessagePushing();
		templateMessagePushing.pushDepositConfirming(((User) session.get("user")).getWeChat(), records.length);
		return "paySucceed";
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

	public String settings() {
		return "settings";
	}

	public String myFavorites() {
		User user = (User) session.get("user");
		if (user == null) {
			return "refused";
		} else {
			request.put("favorites", userService.myFavorites(user));
			return "favorite";
		}
	}
	
	public String deleteFavorite() {
		User user = (User) session.get("user");
		status = new HashMap<>();
		String bookId = httpServletRequest.getParameter("bookId");
		if (user != null && bookId != null) {
			status.put("state", userService.deleteFavorite(user, bookId));
		} else {
			status.put("state", -1);
		}
		return "adminUsersAjax";
	}

	public String deleteAllFavorites() {
		User user = (User) session.get("user");
		status = new HashMap<>();
		if (user != null) {
			status.put("state", userService.deleteAllFavorites(user));
		} else {
			status.put("state", -1);
		}
		return "adminUsersAjax";
	}

	public String addToFavoriate() {
		User user = (User) session.get("user");
		status = new HashMap<>();
		String bookId = httpServletRequest.getParameter("bookId");
		if (user != null && bookId != null) {
			status.put("state", userService.addToFavorite(user, bookId));
		} else {
			status.put("state", -1);
		}
		return "adminUsersAjax";
	}

	public String login() {
		if (session.get("user") != null) {
			if (httpServletRequest.getParameter("meth") != null
					&& httpServletRequest.getParameter("meth").equals("wechat")) {
				AccessLog accessLog = new AccessLog();
				accessLog.setUser((User) session.get("user"));
				accessLog.setLogAt(new Date());
				accessLog.setIp(IPUtil.getIp(httpServletRequest));
				Map<String, Object> map = LogUtil.getInfo(accessLog.getIp());
				accessLog.setArea((String) map.get("area"));
				accessLog.setLocation((String) map.get("location"));
				accessLog.setMethod(1);
				request.put("logInfo", accessLog);
			}
			return "granted";
		} else if (userService.login(user)) {
			session.put("user", userService.getInfo(user));
			AccessLog accessLog = new AccessLog();
			accessLog.setUser((User) session.get("user"));
			accessLog.setLogAt(new Date());
			accessLog.setIp(IPUtil.getIp(httpServletRequest));
			Map<String, Object> map = LogUtil.getInfo(accessLog.getIp());
			accessLog.setArea((String) map.get("area"));
			accessLog.setLocation((String) map.get("location"));
			accessLog.setMethod(0);
			request.put("logInfo", accessLog);
			userService.writeLog(accessLog);
			return "granted";
		} else {
			return "refused";
		}
	}

	public String initialAPI() {
		JSAPIInitial jsapiInitial = new JSAPIInitial();
		String URL = httpServletRequest.getParameter("url");
		status = jsapiInitial.initialAPI(URL);
		return "initialAPI";
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

	public String uploadAvatar() {
		User user = (User) session.get("user");
		if (user != null) {
			UploadResult uploadResult = ImageUploader.upload(httpServletRequest,
					PathProperty.avatarPath + user.getUserId() + "", "face");
			String filename = uploadResult.getFileName();
			int state = uploadResult.getState();
			if (state == 1) {
				user.setAvatar(filename);
				userService.changeSomething(user);
			}
			session.remove("user");
			user = userService.getUserInfo(user);
			session.put("user", user);
		} else {
			return "refused";
		}
		return "avatarChanged";
	}

	public String setRecomFreq() {
		User user = (User) session.get("user");
		if (user != null) {
			user.setRecommendFre(this.user.getRecommendFre());
			userService.setRecomFreq(user);
		}
		return "setRecomFreq";
	}
	
	public String creditHistory(){
		User user = (User) session.get("user");
		if (user != null) {
			request.put("creditHistory", userService.creditHistory(user));
			request.put("userCredit", userService.userCredit(user));
			return "creditHistory";
		} else {
			return "refused";
		}
	}
	
	public String adminWeChatLogin(){
		Date date = new Date();
		RedisManager.setKvPair(""+date.getTime(), 60, -1+"");
		request.put("param", ""+date.getTime());
		return "adminWeChatLogin";
	}
	
	public String extraInfo(){
		User user = (User) session.get("user");
		if (user==null) {
			return "refused";
		}
		String type = httpServletRequest.getParameter("type");
		String school = httpServletRequest.getParameter("school");
		String companyEmail = httpServletRequest.getParameter("companyEmail");
		if (type==null) {
		}
		else{
			int type_int = Integer.valueOf(type);
			ExtraInfo extraInfo = userService.showExtraInfo(user);
			if (extraInfo == null) {
				extraInfo = new ExtraInfo();
			}
			extraInfo.setType(type_int);
			if (type_int == 1) {
				extraInfo.setSchool(school);
			}
			extraInfo.setUserId(user.getUserId());
			extraInfo.setCompanyEmail(companyEmail);
			userService.saveExtraInfo(extraInfo);
		}
		return "extraInfo";
	}
	
	public String adminState(){
		status = new HashMap<>();
		String param = httpServletRequest.getParameter("param");
		try{
			String userId = RedisManager.getStringByKey(param);
			if (userId == null) {
				status.put("state", 2);
			}
			else if(Integer.valueOf(userId)==-2){
				status.put("state", 4);
			}
			else if(Integer.valueOf(userId)!=-2&&Integer.valueOf(userId)!=-1){
				User user = new User();
				user.setUserId(Integer.valueOf(userId));
				user = userService.getUserInfo(user);
				if (user.getRole().equals("admin")) {
					session.put("admin", user);
					status.put("state", 1);
				}
				else{
					status.put("state", 2);
				}
			}
			else{
				status.put("state", 0);
			}
		}
		catch (Exception e) {
			status.put("state", 3);
			return "adminUsersAjax";
		}
		return "adminUsersAjax";
	}
	
	public String logout() {
		if (session.containsKey("user")) {
			session.remove("user");
		}
		return "logout";
	}

	public String qrCode() {
		User user = (User) session.get("user");
		if (user != null) {
			return "qrCodeSucceed";
		} else {
			return "qrCodeFail";
		}
	}

	public void prepareAdminLogin() {
		user = new User();
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
