package com.bbs.entities.rules;

import java.util.ArrayList;
import java.util.Arrays;

public class UserRule {
	public static String getRole(String role){
		if (role.equals("admin")) {
			return "管理员";
		}else{
			return "普通用户";
		}
	}

	public static String getFre(int i) {
		switch (i) {
		case 0:
			return "从不推荐";
		case 1:
			return "一天一次";
		case 7:
			return "七天一次";
		case 14:
			return "半个月一次";
		default:
			return "从不提醒";
		}
	}
}
