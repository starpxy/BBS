package com.bbs.api.entities;

public class UploadResult {
	private int state = -1;
	private String fileName = null;

	public void setState(int state) {
		this.state = state;
	}

	public int getState() {
		return state;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileName() {
		return fileName;
	}
}
