package com.bbs.entities.rules;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * 该类制定了数字和状态的对应类型：
 * 0-按时取到预约书籍
 * 1-评论被加入精选
 * 2-按时还书
 * 3-预约过期
 * 4-还书过期
 * -1为错误状态
 */

public class CreditHistoryRule {
	public static final ArrayList<String> status = new ArrayList<String>(Arrays.asList("按时取到预约书籍", "评论被加入精选", "按时还书", "预约过期", "还书过期"));

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
