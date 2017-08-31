package com.bbs.entities.rules;

import java.util.ArrayList;
import java.util.Arrays;

public class InfoRule {
	/**
	 * 该类制定了数字和状态的对应类型：
	 * 0-本科以下
	 * 1-本科以上
	 * -1为错误状态
	 */
	public static final ArrayList<String> status = new ArrayList<String>(Arrays.asList("本科以上", "本科以下"));

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
