package com.bbs.encrypt;

/**
 * @version 1.0
 * 
 * @author Star
 * 
 * SHC-32: Last byte is a checking character which contains the number of pad characters.
 * 
 * Set key before encrypting and decrypting, otherwise it will use its default key:0
 * 
 * ClearTextOutOfBoundException will be thrown if the length of clear text is longer than 31.
 * 
 * IncorrectCipherTextLengthException will be thrown if the length of cipher text is not equal 32. 
 * 
 * The algorithm is not good enough, and I will improve it later.
 *
 */
public class SHC32 {
	private SHCManager shcManager;
	private static SHC32 shc32;
	public static SHC32 getInstance(){
		if (shc32!=null) {
			return shc32;
		}
		else {
			shc32 = new SHC32();
			return shc32;
		}
	}
	public String encrypt(String clearText) throws ClearTextOutOfBoundException{
		if (clearText.toCharArray().length>31) {
			throw new ClearTextOutOfBoundException();
		}
		int len = clearText.toCharArray().length;
		char[] array = clearText.toCharArray();
		String clearText32 = "";
		for (char c : array) {
			clearText32 += c;
		}
		for (int i = 32-len; i > 1; i--) {
			clearText32 += (char)(65+i%26);
		}
		if (32-len<10) {
			clearText32 += (char)(48+31-len);
		}
		else{
			clearText32 += (char)(97+20-len);
		}
		return shcManager.encrypt(clearText32, 32);
	}
	public String decrypt(String cipherText) throws IncorrectCipherTextLengthException{
		if (cipherText.toCharArray().length!=32) {
			throw new IncorrectCipherTextLengthException();
		}
		cipherText = shcManager.decrypt(cipherText, 32);
		char[] array = cipherText.toCharArray();
		int l = array[31];
		String result = "";
		if (l>97) {
			for (int i = 0; i < array.length-(l-97+12); i++) {
				result += array[i];
			}
		}
		else {
			for (int i = 0; i < array.length-(l-48+1); i++) {
				result += array[i];
			}
		}
		return result;
	}
	public void setKey(long key){
		shcManager.setKey(key);
	}
	public long getKey(){
		return shcManager.getKey();
	}
	private SHC32(){
		shcManager = SHCManager.getInstance();
	}
	public static void main(String[] args) {
		SHC32 shc32 = SHC32.getInstance();
		try {
			shc32.setKey(123456789L);
			System.out.println(shc32.encrypt("ILoveHester"));
		} catch (ClearTextOutOfBoundException e) {
			e.printStackTrace();
		}
	}
}
