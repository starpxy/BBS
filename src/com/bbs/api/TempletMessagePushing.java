package com.bbs.api;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

public class TempletMessagePushing {
	private String accessToken = null;
	public TempletMessagePushing() {
		this.accessToken = AccessTokenManager.getAccessToken();
	}
	public void pushing(){
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+accessToken);
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
