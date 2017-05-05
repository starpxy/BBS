package com.bbs.actions;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class BaseAction  extends ActionSupport implements RequestAware,SessionAware,Preparable{
	protected Map<String, Object> request;
	protected Map<String, Object> session;
	private static final long serialVersionUID = 1L;

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	@Override
	public void prepare() throws Exception {}
}
