package com.bbs.api;

import java.util.Date;

import com.bbs.encrypt.ClearTextOutOfBoundException;
import com.bbs.encrypt.SHC32;

public class TopScanManager {
	private static long startTime;

	/*
	 * 静态方法，传入值为用户ID，返回值为用户二维码。 用微信扫一扫扫描二维码会得到SHC签名后的用户ID 
	 * 解码后格式为：userId*SHC 
	 * "*" 为用户ID
	 */
	public static String getQrCode(String userId) {
		Date date = new Date();
		if ((date.getTime() - startTime) > 60000L) {
			startTime = date.getTime();
		}
		SHC32 shc32 = SHC32.getInstance();
		shc32.setKey(startTime);
		String qrText = null;
		try {
			qrText = shc32.encrypt("userId" + userId + "SHC");
		} catch (ClearTextOutOfBoundException e) {
			e.printStackTrace();
		}
		String QrCode = "http://qr.topscan.com/api.php?text=" + qrText;
		return QrCode;
	}

	public static long getStartTime() {
		return startTime;
	}
}
