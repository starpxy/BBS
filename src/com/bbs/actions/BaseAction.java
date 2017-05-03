package com.bbs.actions;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements RequestAware{

	/**
	 * 
	 */
	private Map<String, Object> request;
	private static final long serialVersionUID = 1L;

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}
	
}
