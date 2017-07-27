package com.bbs.entities.rules;

import java.util.ArrayList;
import java.util.Arrays;

public class WaitListRule {
	public static final ArrayList<String> status = new ArrayList<String>(Arrays.asList("等待借书", "已借书","已取消"));

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
