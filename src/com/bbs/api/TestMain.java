package com.bbs.api;

public class TestMain {
	public static void main(String[] args) {
		QrCodeManager qrCodeManager = new QrCodeManager();
		qrCodeManager.generateTempQrCodeTicket(100, 1000);
	}
}
