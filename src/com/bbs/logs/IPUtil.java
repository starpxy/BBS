package com.bbs.logs;

import javax.servlet.http.HttpServletRequest;

public class IPUtil {
	public static String getIp(HttpServletRequest httpServletRequest){
		String ip = httpServletRequest.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = httpServletRequest.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = httpServletRequest.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = httpServletRequest.getRemoteAddr();
		}
		if (ip.equals("0:0:0:0:0:0:0:1")) {
			return "124.207.38.22";
		}
		return ip;
	}
}
