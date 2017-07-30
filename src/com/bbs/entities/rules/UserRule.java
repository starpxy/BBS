package com.bbs.entities.rules;

public class UserRule {
	public static String getRole(String role){
		if (role.equals("admin")) {
			return "管理员";
		}else{
			return "普通用户";
		}
	}
}
