package com.bbs.api;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;


import net.sf.json.JSONObject;

public class AuthorizationManager {
	private String code = null;
	private String openId = null;
	public void setCode(String argv) {
		code = argv;
	}

	public String getOpenID() throws NoneCodeException {
		if (openId!=null) {
			return openId;
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
			System.out.println(jsonMsg);
			Map<String, Object> map = new HashMap<>();
			map.put("openid", String.class);
			map.put("errcode", Integer.class);
			JSONObject jsonObject = JSONObject.fromObject(jsonMsg);
			Map<String, Object> resultmap = (Map<String, Object>) JSONObject.toBean(jsonObject,Map.class,map);
			openId = (String) resultmap.get("openid");
			if (openId==null) {
				return jsonMsg+"THIS IS ERROR CODE";
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return openId;
	}
//	public String getAvatar() throws NoneCodeException {
//		
//	}
}
