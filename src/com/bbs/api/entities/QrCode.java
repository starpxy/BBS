package com.bbs.api.entities;

public class QrCode {
	public static final String QR_SCENE = "QR_SCENE";
	public static final String QR_LIMIT_SCENE = "QR_LIMIT_SCENE";
	public static final String QR_LIMIT_STR_SCENE = "QR_LIMIT_STR_SCENE";
	private int expire_seconds;
	private String action_name;
	private ActionInfo action_info;

	public int getExpire_seconds() {
		return expire_seconds;
	}

	public void setExpire_seconds(int expire_seconds) {
		this.expire_seconds = expire_seconds;
	}

	public String getAction_name() {
		return action_name;
	}

	public void setAction_name(String action_name) {
		this.action_name = action_name;
	}

	public ActionInfo getAction_info() {
		return action_info;
	}

	public void setAction_info(ActionInfo action_info) {
		this.action_info = action_info;
	}

	public QrCode(int expire_seconds, String action_name, ActionInfo action_info) {
		super();
		this.expire_seconds = expire_seconds;
		this.action_name = action_name;
		this.action_info = action_info;
	}

}