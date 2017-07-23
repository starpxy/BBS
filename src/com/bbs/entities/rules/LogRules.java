package com.bbs.entities.rules;

import java.util.ArrayList;
import java.util.Arrays;

public class LogRules {
	public static final ArrayList<String> status = new ArrayList<String>(Arrays.asList("账号密码登陆", "微信登陆"));

	public static String getStatus(int i) {
		if (i >= 0 && i < 2) {
			return status.get(i);
		} else {
			return null;
		}
	}

	public static int getStatus(String state) {
		if (status.contains(state)) {
			return status.indexOf(state);
		} else {
			return -1;
		}
	}
}
