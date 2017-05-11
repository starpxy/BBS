package com.bbs.api;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import com.bbs.converters.JsonConverter;
/**
 * 07/05/2017
 * 
 * @author Star
 * 
 * AccessTokenManager is a class to get the access token from Wechat Server.
 * 
 * The static method is to get the access token.
 * 
 * It will simply return the exiting token if we have one which is not expired.
 *  
 * Otherwise, we will get it from the server again.
 */
public class AccessTokenManager {
	private static String accessToken = "";
	private static int expiresTime = 0;
	private static Date startTime = null;
	public static String getAccessToken(){
		URL url;
		HttpsURLConnection httpsURLConnection;
		InputStreamReader inputStreamReader;
		if (startTime!=null) {
			if ((new Date().getTime()-startTime.getTime())<(expiresTime*1000-1000L)) {
				System.out.println("reuse");
				return accessToken;
			}
		}
		try {
			url = new URL("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+BasicAccountParam.getAppId()+"&secret="+BasicAccountParam.getAppSecrete());
			httpsURLConnection = (HttpsURLConnection) url.openConnection();
			inputStreamReader = new InputStreamReader(httpsURLConnection.getInputStream());
			int i = inputStreamReader.read();
			String temp = "";
			while(i!=-1){
				temp+=(char)i;
				i = inputStreamReader.read();
			}
			startTime = new Date();
			System.out.println("get new");
			JsonConverter converter = new JsonConverter();
			Map<String, Object> map = converter.convertTonMap(temp);
			accessToken = (String) map.get("access_token");
			expiresTime = (int) map.get("expires_in");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return accessToken;
	}
}
