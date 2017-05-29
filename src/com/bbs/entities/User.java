package com.bbs.entities;

import java.util.HashSet;
import java.util.Set;

public class User {
	private Integer userId;
	private String phoneNumber;
	private String weChat;
	private String name;
	private String password;
	private String identityId;
	private String gender; 
	private String role;
	private Integer recommendFre;


	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getWeChat() {
		return weChat;
	}

	public void setWeChat(String weChat) {
		this.weChat = weChat;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIdentityId() {
		return identityId;
	}

	public void setIdentityId(String identityId) {
		this.identityId = identityId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Integer getRecommendFre() {
		return recommendFre;
	}

	public void setRecommendFre(Integer recommendFre) {
		this.recommendFre = recommendFre;
	}
}
