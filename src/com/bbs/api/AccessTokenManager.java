package com.bbs.api;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

import javax.net.ssl.HttpsURLConnection;
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
			url = new URL("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx95311e6c3749af30&secret=c9cf6453de2e7b471625f4747f79e75f");
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
			String[] strings = temp.split("\"");
			accessToken = strings[3];
			expiresTime = Integer.valueOf(strings[6].substring(1,5));
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return accessToken;
	}
}
