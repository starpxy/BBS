package com.bbs.encrypt;


import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

/**
 * 
 * @author Star
 * 
 * Tool Class for SHC-32 or SHC-64
 * 
 * SHC: Star Hester CC
 *
 */
class SHCManager {
	private long key;
	private static SHCManager shcManager;
	private Map<Character, Character> map;
	private Map<Character, Character> inverseMap;
	private Random random;
	public static SHCManager getInstance(){
		if (shcManager!=null) {
			return shcManager;
		}
		else{
			shcManager = new SHCManager();
			return shcManager;
		}
	}
	public String encrypt(String clearText,int count){
		if (map.isEmpty()) {
			generateMapping();
		}
		if (count!=0) {
			String cipherText = "";
			for (char c : clearText.toCharArray()) {
				cipherText += map.get(c);
			}
			count--;
			return encrypt(cipherText, count);
		}
		else{
			return clearText;
		}
	}
	public String decrypt(String cipherText,int count){
		if (map.isEmpty()) {
			generateMapping();
		}
		initialInverseMap();
		if (count!=0) {
			String clearText = "";
			for (char c : cipherText.toCharArray()) {
				clearText += inverseMap.get(c);
			}
			count--;
			return decrypt(clearText, count);
		}
		else{
			return cipherText;
		}
	}
	private void generateMapping(){
		random = new Random(key);
		map = new HashMap<>();
		for (int i = 0; i < 62; i++) {
			if (i<10) {
				map.put((char)(i+48), (char)generateCharater());
			}
			else if (i<36){
				map.put((char)(i+55), (char)generateCharater());
			}
			else {
				map.put((char)(i+61), (char)generateCharater());
			}
		}
	}
	private int generateCharater(){
		int result = random.nextInt(26);
		int probability = random.nextInt(10000);
		if (probability%3 == 0 && result<10) {
			result+=48;
		}
		else if(probability%3 == 1){
			result+=65;
		}
		else{
			result+=97;
		}
		if (map.containsValue((char)result)) {
			return generateCharater();
		}
		else{
			return result;
		}
	}
	private SHCManager() {
		key = 0;
		map = new HashMap<Character,Character>();
		inverseMap = new HashMap<Character,Character>();
	}
	private void initialInverseMap(){
		if (inverseMap.isEmpty()) {
			Iterator<Character> iterator = map.keySet().iterator();
			while (iterator.hasNext()) {
				char c = iterator.next();
				inverseMap.put(map.get(c), c);
			}
		}
	}
	public void setKey(long key) {
		this.key = key;
		generateMapping();
	}
	public long getKey() {
		return key;
	}
}
