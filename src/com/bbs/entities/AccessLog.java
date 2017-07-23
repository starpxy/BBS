package com.bbs.entities;

import java.util.Date;

public class AccessLog {
	private Integer id;
	private User user;
	private String ip;
	private String area;
	private String location;
	private Integer method;
	private Date logAt;

	public void setMethod(int method) {
		this.method = method;
	}

	public int getMethod() {
		return method;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getLogAt() {
		return logAt;
	}

	public void setLogAt(Date logAt) {
		this.logAt = logAt;
	}
}
