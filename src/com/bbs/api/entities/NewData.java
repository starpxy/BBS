package com.bbs.api.entities;

public class NewData extends Data {
	private KeyWord keyword3;
	private KeyWord keyword4;
	public void setKeyword4(KeyWord keyword4) {
		this.keyword4 = keyword4;
	}
	public KeyWord getKeyword4() {
		return keyword4;
	}
	public NewData(KeyWord first, KeyWord keyword1, KeyWord keyword2, KeyWord remark) {
		super(first, keyword1, keyword2, remark);
	}
	public KeyWord getKeyword3() {
		return keyword3;
	}
	public void setKeyword3(KeyWord keyword3) {
		this.keyword3 = keyword3;
	}
	public NewData(KeyWord first, KeyWord keyword1, KeyWord keyword2, KeyWord keyword3,KeyWord keyword4, KeyWord remark) {
		super(first, keyword1, keyword2, remark);
		this.keyword3 = keyword3;
		this.keyword4 = keyword4;
	}
	public NewData(KeyWord first, KeyWord keyword1, KeyWord keyword2, KeyWord keyword3, KeyWord remark) {
		super(first, keyword1, keyword2, remark);
		this.keyword3 = keyword3;
	}
}
