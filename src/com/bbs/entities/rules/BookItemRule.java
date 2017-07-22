package com.bbs.entities.rules;
/**
 * 该类制定了数字和状态的对应类型：
 * 0为可借阅
 * 1为已被预定
 * 2为已添加借书单
 * 3为已借出
 * -1为错误状态
 */
import java.util.ArrayList;
import java.util.Arrays;

public class BookItemRule {
	public static final ArrayList<String> status = new ArrayList<String>(Arrays.asList("可借阅", "已被预定", "已添加借书单", "已借出"));

	public static String getStatus(int i) {
		if (i >= 0 && i < 4) {
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
