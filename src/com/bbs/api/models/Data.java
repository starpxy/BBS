package com.bbs.api.models;

public class Data {
	private KeyNotes first;
	private KeyNotes keynote1;
	private KeyNotes keynote2;

	public KeyNotes getFirst() {
		return first;
	}

	public void setFirst(KeyNotes first) {
		this.first = first;
	}

	public KeyNotes getKeynote1() {
		return keynote1;
	}

	public void setKeynote1(KeyNotes keynote1) {
		this.keynote1 = keynote1;
	}

	public KeyNotes getKeynote2() {
		return keynote2;
	}

	public void setKeynote2(KeyNotes keynote2) {
		this.keynote2 = keynote2;
	}

	public Data(KeyNotes first, KeyNotes keynote1, KeyNotes keynote2) {
		super();
		this.first = first;
		this.keynote1 = keynote1;
		this.keynote2 = keynote2;
	}

}
