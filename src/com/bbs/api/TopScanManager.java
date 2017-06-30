package com.bbs.api;

import java.util.Date;

import com.bbs.encrypt.ClearTextOutOfBoundException;
import com.bbs.encrypt.SHC32;


public class TopScanManager {
	private static long startTime;
	public static String getQrCode(String userId){
		Date date = new Date();
		if ((date.getTime()-startTime)>=6000000L) {
			startTime = date.getTime();
		}
		SHC32 shc32 = SHC32.getInstance();
		shc32.setKey(startTime);
		String qrText = null;
		try {
			qrText = shc32.encrypt("userId"+userId+"SHC");
		} catch (ClearTextOutOfBoundException e) {
			e.printStackTrace();
		}
		String QrCode = "http://qr.topscan.com/api.php?text="+qrText;
		return QrCode;
	}
	public static long getStartTime() {
		return startTime;
	}
//	public static String scanUser(String cipherText){
//		
//	}
}
