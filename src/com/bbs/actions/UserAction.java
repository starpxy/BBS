package com.bbs.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.api.JSAPIInitial;
import com.bbs.api.TopScanManager;
import com.bbs.api.UnifiedOrder;
import com.bbs.encrypt.IncorrectCipherTextLengthException;
import com.bbs.encrypt.SHC32;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;
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
		User user = (User) session.get("user");
		if (user != null && user.getRole().equals("admin")) {
			request.put("users", userService.adminUsers());
			return "adminUsers";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}
	
	public String userChart() {
		User user = (User) session.get("user");
		if (user != null && user.getRole().equals("admin")) {
			return "userChart";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}

	public String adminUsersAjax() {
		User user = (User) session.get("user");
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

	public String adminLogin() {
		User user = (User) session.get("user");
		if (user != null && user.getRole().equals("admin")) {
			request.put("books", userService.adminInitial());
			return "adminLoginSuccess";
		} else if (user != null) {
			return "adminLoginFail";
		}

		boolean check = userService.adminLogin(this.user);
		if (check) {
			session.put("user", userService.getInfo(this.user));
			request.put("books", userService.adminInitial());
			return "adminLoginSuccess";
		} else {
			return "adminLoginFail";
		}
	}

	public String adminLogout() {
		if (session.containsKey("user")) {
			session.remove("user");
		}
		status = new HashMap<>();
		status.put("state", 1);
		return "adminLogout";
	}

	public String adminListRecords() {
		User user = (User) session.get("user");
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
		User user = (User) session.get("user");
		if (user != null && user.getRole().equals("admin")) {
			request.put("reservations", userService.adminListReservations());
			return "adminListReservations";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}

	public String adminListComments() {
		User user = (User) session.get("user");
		if (user != null && user.getRole().equals("admin")) {
			request.put("comments", userService.adminListComments());
			return "adminListComments";
		} else if (user != null) {
			return "adminLoginFail";
		} else {
			return "adminLoginFail";
		}
	}
	public String adminConfirmBook(){
		String userInfo = httpServletRequest.getParameter("userInfo");
		SHC32 shc32 = SHC32.getInstance();
		shc32.setKey(TopScanManager.getStartTime());
		try {
			String text = shc32.decrypt(userInfo);
			System.out.println(text);
			String userId = null;
			status = new HashMap<>();
			if (text.startsWith("userId")&&text.endsWith("SHC")) {
				userId = text.substring(6, text.length()-3);
				if (userService.confrimBook(userId)) {
					status.put("state", 1);
				}
				else{
					status.put("state", 2);
				}
			}
			else {
				status.put("state", 2);
			}
		} catch (IncorrectCipherTextLengthException e) {
			e.printStackTrace();
		}
		return "confirmBook";
	}
	public String showQrCode() {
		String QrCode = TopScanManager.getQrCode(user.getUserId() + "");
		status = new HashMap<>();
		status.put("QrCode", QrCode);
		return "showQrCode";
	}
	public String payState(){
		status = new HashMap<>();
		user = (User) session.get("user");
		List<BorrowedRecord> payState = userService.payState(user);
		String ip = httpServletRequest.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = httpServletRequest.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = httpServletRequest.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = httpServletRequest.getRemoteAddr();
		}
		if (payState != null) {
			UnifiedOrder unifiedOrder = new UnifiedOrder();
			JSONObject jsonObject = JSONObject.fromObject(unifiedOrder.createOrder(user.getWeChat(), ip, 1*payState.size()));
			status.put("params", jsonObject.toString());
			status.put("pay", 1);
			status.put("payState", JSONArray.fromObject(payState));
		} else {
			status.put("pay", 0);
		}
		return "payState";
	}
	public String paySucceed(){
		String recordIds = httpServletRequest.getParameter("recordIds");
		String outTradeNumber = httpServletRequest.getParameter("outTradeNumber");
		int[] records = (int[]) JSONArray.toArray(JSONArray.fromObject(recordIds));
		userService.paySucceed(outTradeNumber, records);
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
	public String qrCode(){
		User user = (User) session.get("user");
		if (user!=null) {
			return "qrCodeSucceed";
		}
		else{
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
