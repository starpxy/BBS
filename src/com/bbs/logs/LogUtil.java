package com.bbs.logs;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

public class LogUtil {
	private static String key = "0142b902f95b6084075792c5a6d42764";
	public static Map<String,Object> getInfo(String ip){
		URL url = null;
		Map<String, Object> result;
		HttpURLConnection httpsURLConnection;
		InputStreamReader inputStreamReader;
		Map<String, Object> map = null;
		int errorcode = -1;
		try {
			String urlAddr = null;
			urlAddr = "http://apis.juhe.cn/ip/ip2addr?ip="+ip+"&key="+key;
			url = new URL(urlAddr);
			httpsURLConnection = (HttpURLConnection) url.openConnection();
			inputStreamReader = new InputStreamReader(httpsURLConnection.getInputStream());
			int i = inputStreamReader.read();
			String temp = "";
			while(i!=-1){
				temp+=(char)i;
				i = inputStreamReader.read();
			}
			JSONObject jsonObject = JSONObject.fromObject(temp);
			map = (Map<String, Object>) JSONObject.toBean(jsonObject, Map.class, map);
			errorcode = (Integer)map.get("error_code");
			System.out.println(temp);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (errorcode==0) {
			JSONObject re = JSONObject.fromObject(map.get("result"));
			result = (Map<String, Object>) JSONObject.toBean(re, Map.class, map);
			return result;
		}
		else{
			return new LinkedHashMap<>();
		}
	}
}
