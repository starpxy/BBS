package com.bbs.identify;

import java.util.HashMap;
import java.util.Map;

public class Decipher {
	private String cipherCode;
	private int userId;
	private int reservationId;
	private char[] chars=new char[6];
	private Map<Character, Character> codeMap=new HashMap<Character, Character>();
	public Decipher(String cipherCode) {
		this.chars=cipherCode.toCharArray();
		this.codeMap.put('3', '0');
		this.codeMap.put('7', '1');
		this.codeMap.put('6', '2');
		this.codeMap.put('1', '3');
		this.codeMap.put('9', '4');
		this.codeMap.put('2', '5');
		this.codeMap.put('8', '6');
		this.codeMap.put('0', '7');
		this.codeMap.put('4', '8');
		this.codeMap.put('5', '9');
		for(int i=0;i<chars.length;i++){
			this.chars[i]=this.codeMap.get(chars[i]);
		}
		int rawUserId=(this.chars[0]-'0')*100+(this.chars[1]-'0')*10+(this.chars[2]-'0');
		int rawReservationId=(this.chars[3]-'0')*100+(this.chars[4]-'0')*10+(this.chars[5]-'0');
//		System.out.println("rawUserId= "+rawUserId+" rawReservationId= "+rawReservationId);
		double rId=(float)(rawReservationId+3)/14;
		double uId=(float)(rawUserId-rId*13-8);
//		System.out.println(rId+" : "+uId);
		if(rId==(int)rId&&uId==(int)uId&&rId>0&&uId>0){
			this.reservationId=(int)rId;
			this.userId=(int)uId;
		}
		else{
			this.reservationId=-1;
			this.userId=-1;
		}
	}
	public int getUserId() {
		return this.userId;
	}
	public int getReservationId() {
		return reservationId;
	}
	
//	public static void main(String[] args) {
//		Decipher decipher=new Decipher("389477");
//		System.out.println("userId= "+decipher.getUserId()+" ReservationId= "+decipher.getReservationId());
//	}
}
