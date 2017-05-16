package com.bbs.api.entities;

public class ActionInfo {
	private Scene scene;
	public void setScene(Scene scene) {
		this.scene = scene;
	}
	public Scene getScene() {
		return scene;
	}
	public ActionInfo(Scene scene) {
		this.scene = scene;
	}
}
