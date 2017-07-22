package com.bbs.entities.rules;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * 该类制定了数字和状态的对应类型：
 * 0为未审核
 * 1为精选
 * -1为错误状态
 */
public class CommentRule {
	public static final ArrayList<String> status = new ArrayList<String>(Arrays.asList("未审核", "精选"));

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
