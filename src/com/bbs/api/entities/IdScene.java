package com.bbs.api.entities;

public class IdScene implements Scene{
	private int scene_id;
	public void setScene_id(int scene_id) {
		this.scene_id = scene_id;
	}
	public int getScene_id() {
		return scene_id;
	}
	public IdScene(int scene_id) {
		this.scene_id = scene_id;
	}
}
