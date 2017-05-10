package com.bbs.api;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import com.bbs.converters.JsonConverter;

public class AuthorizationManager {
	private String code = null;
	private String accessToken = null;
	private String refreshToken = null;
	private int expiresTime = 0;
	private Date startTime = null;
	private String openId = null;
	public void setCode(String argv) {
		code = argv;
	}

	public String getOpenID() throws NoneCodeException {
		if (startTime != null) {
			if ((new Date().getTime() - startTime.getTime()) < (long) ((expiresTime - 1) * 1000L)) {
				return openId;
			}
			else {
				try {
					URL url = new URL("https://api.weixin.qq.com/sns/oauth2/refresh_token?appid="+BasicAccountParam.getAppId()+"&grant_type=refresh_token&refresh_token="+refreshToken);
					HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
					InputStreamReader inputStreamReader = new InputStreamReader(httpsURLConnection.getInputStream());
					int i = inputStreamReader.read();
					String jsonMsg = "";
					while (i != -1) {
						jsonMsg += (char) i;
						i = inputStreamReader.read();
					}
					Map<String, Object> map = new JsonConverter().convertTonMap(jsonMsg);
					if (map.get("access_token")!=null) {
						accessToken = (String) map.get("access_token");
						expiresTime = (Integer) map.get("expires_in");
						refreshToken = (String) map.get("refresh_token");
						openId = (String) map.get("openid");
						return openId;
					}
				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		try {
			if (code == null) {
				throw new NoneCodeException();
			}
			URL url = new URL("https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + BasicAccountParam.getAppId()
					+ "&secret=" + BasicAccountParam.getAppSecrete() + "&code=" + code
					+ "&grant_type=authorization_code");
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			InputStreamReader inputStreamReader = new InputStreamReader(httpsURLConnection.getInputStream());
			int i = inputStreamReader.read();
			String jsonMsg = "";
			while (i != -1) {
				jsonMsg += (char) i;
				i = inputStreamReader.read();
			}
			Map<String, Object> map = new JsonConverter().convertTonMap(jsonMsg);
			accessToken = (String) map.get("access_token");
			expiresTime = (Integer) map.get("expires_in");
			refreshToken = (String) map.get("refresh_token");
			openId = (String) map.get("openid");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return openId;
	}
}
