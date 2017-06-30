package com.bbs.api.entities;

public class Data implements DataUtil{
	private KeyWord first;
	private KeyWord keyword1;
	private KeyWord keyword2;
	private KeyWord remark;
	public KeyWord getFirst() {
		return first;
	}
	public void setFirst(KeyWord first) {
		this.first = first;
	}
	public KeyWord getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(KeyWord keyword1) {
		this.keyword1 = keyword1;
	}
	public KeyWord getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(KeyWord keyword2) {
		this.keyword2 = keyword2;
	}
	public KeyWord getRemark() {
		return remark;
	}
	public void setRemark(KeyWord remark) {
		this.remark = remark;
	}
	public Data(KeyWord first, KeyWord keyword1, KeyWord keyword2, KeyWord remark) {
		super();
		this.first = first;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.remark = remark;
	}

	
}
