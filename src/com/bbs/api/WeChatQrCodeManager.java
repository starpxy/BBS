package com.bbs.api;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import com.bbs.api.entities.ActionInfo;
import com.bbs.api.entities.IdScene;
import com.bbs.api.entities.QrCode;

import net.sf.json.JSONObject;

public class WeChatQrCodeManager {
	/*
	 * 
	 * 此类废弃。无需测试。
	 * 
	 */
	public String generateTempQrCodeTicket(int sceneId,int expireTime){
		String ticket = null;
		IdScene idScene = new IdScene(sceneId);
		ActionInfo action_info = new ActionInfo(idScene);
		QrCode qrCode = new QrCode(expireTime, QrCode.QR_SCENE, action_info);
		JSONObject jsonObject = JSONObject.fromObject(qrCode);
		URL url;
		try {
			url = new URL("https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token="+AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(httpsURLConnection.getOutputStream()));
			printWriter.print(jsonObject.toString());
			printWriter.flush();
			printWriter.close();
			InputStreamReader inputStreamReader = new InputStreamReader(httpsURLConnection.getInputStream());
			int i = inputStreamReader.read();
			String jsonMsg = "";
			while (i != -1) {
				jsonMsg += (char) i;
				i = inputStreamReader.read();
			}
			Map<String, Object> map = new HashMap<>();
			map.put("ticket", String.class);
			map.put("url", String.class);
			JSONObject jsonObject2 = JSONObject.fromObject(jsonMsg);
			Map<String, Object> resultmap = (Map<String, Object>) JSONObject.toBean(jsonObject2, Map.class, map);
			System.out.println(resultmap.get("ticket"));
			System.out.println(resultmap.get("url"));
			ticket = (String) resultmap.get("ticket");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ticket;
	}
	public String generatePerpetualQrCodeTicket(int sceneId,String sceneStr){
		return null;
	}
	public String getQrCodeURL(String ticket){
		return null;
	}
}
