package com.bbs.entities.rules;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * 该类制定了数字和状态的对应类型：
 * 0为已预定
 * 1为预定过期
 * 2为已借书
 * -1为错误状态
 */
public class ReservationRule {
	public static final ArrayList<String> status = new ArrayList<String>(Arrays.asList("已预定", "预定过期", "已借书"));

	public static String getStatus(int i) {
		if (i >= 0 && i < 3) {
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
