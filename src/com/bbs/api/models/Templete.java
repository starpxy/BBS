package com.bbs.api.models;

public class Templete {
	private String touser;
	private String template_id;
	private String url;
	private Data data;

	public String getTouser() {
		return touser;
	}

	public void setTouser(String touser) {
		this.touser = touser;
	}

	public String getTemplate_id() {
		return template_id;
	}

	public void setTemplate_id(String template_id) {
		this.template_id = template_id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	public Templete(String touser, String template_id, String url, Data data) {
		super();
		this.touser = touser;
		this.template_id = template_id;
		this.url = url;
		this.data = data;
	}

	public Templete(String touser, String template_id, Data data) {
		super();
		this.touser = touser;
		this.template_id = template_id;
		this.data = data;
	}

}
