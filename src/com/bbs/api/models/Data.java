package com.bbs.api.models;

public class Data {
	private KeyNotes first;
	private KeyNotes keyword1;
	private KeyNotes keyword2;
	private KeyNotes remark;
	public KeyNotes getFirst() {
		return first;
	}
	public void setFirst(KeyNotes first) {
		this.first = first;
	}
	public KeyNotes getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(KeyNotes keyword1) {
		this.keyword1 = keyword1;
	}
	public KeyNotes getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(KeyNotes keyword2) {
		this.keyword2 = keyword2;
	}
	public KeyNotes getRemark() {
		return remark;
	}
	public void setRemark(KeyNotes remark) {
		this.remark = remark;
	}
	public Data(KeyNotes first, KeyNotes keyword1, KeyNotes keyword2, KeyNotes remark) {
		super();
		this.first = first;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.remark = remark;
	}

	
}
