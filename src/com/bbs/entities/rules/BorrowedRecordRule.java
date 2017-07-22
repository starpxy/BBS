package com.bbs.entities.rules;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * 该类制定了数字和状态的对应类型：
 * 0为待确认
 * 1为待支付
 * 2为已借出
 * 3为已还书
 * 4为还书过期
 * -1为错误状态
 */
public class BorrowedRecordRule {
	public static final ArrayList<String> status = new ArrayList<String>(Arrays.asList("待确认", "待支付", "已借出", "已还书","还书过期"));

	public static String getStatus(int i) {
		if (i >= 0 && i < 5) {
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
