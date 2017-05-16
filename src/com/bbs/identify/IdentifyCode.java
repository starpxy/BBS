package com.bbs.identify;

import java.util.HashMap;
import java.util.Map;

public class IdentifyCode {
	private String userId;
	private String reservationID;
	private String code;
	private String cipherCode;
	private Map<Character, Character> codeMap=new HashMap<Character, Character>();
	public IdentifyCode(int userId, int reservationID) {
		userId+=reservationID*13+8;
		reservationID=reservationID*14-3;
		if(userId<10)
			this.userId="00"+userId;
		else if(userId<100)
			this.userId="0"+userId;
		else if(userId<1000)
			this.userId=""+userId;
		
		if(reservationID<10)
			this.reservationID="00"+reservationID;
		else if(reservationID<100)
			this.reservationID="0"+reservationID;
		else if(reservationID<1000)
			this.reservationID=""+reservationID;
		this.code=this.userId+this.reservationID;
//		System.out.println(this.code);
		this.codeMap.put('0', '3');
		this.codeMap.put('1', '7');
		this.codeMap.put('2', '6');
		this.codeMap.put('3', '1');
		this.codeMap.put('4', '9');
		this.codeMap.put('5', '2');
		this.codeMap.put('6', '8');
		this.codeMap.put('7', '0');
		this.codeMap.put('8', '4');
		this.codeMap.put('9', '5');
	}
	public Map<Character, Character> getCodeMap() {
		return codeMap;
	}
	public String getCipherCode() {
		char[] chars=this.code.toCharArray();
		for (int i=0;i<chars.length;i++){
			chars[i]=this.codeMap.get(chars[i]);
		}
		this.cipherCode=String.valueOf(chars);
//		System.out.println("After cipher"+cipherCode);
		return cipherCode;
	}
//	public static void main(String[] args) {
//		IdentifyCode code=new IdentifyCode(4, 3);
//		
//		code.getCipherCode();
//	}
	
}
