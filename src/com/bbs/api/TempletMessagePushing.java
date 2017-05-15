package com.bbs.api;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import com.bbs.api.models.Data;
import com.bbs.api.models.KeyNotes;
import com.bbs.api.models.Templete;
import net.sf.json.JSONObject;

public class TempletMessagePushing {
	private String accessToken = null;

	public TempletMessagePushing() {
		this.accessToken = AccessTokenManager.getAccessToken();
	}

	public void pushingReturningBooks(String openid) {
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" + accessToken);
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyNotes first = new KeyNotes("这是潘星宇发来的测试推送", "#000000");
			KeyNotes keynote1 = new KeyNotes("这个是推送内容", "#000000");
			Date date = new Date();
			KeyNotes keynote2 = new KeyNotes(date.toInstant().now().toString().substring(0, 10), "#000000");
			Data data = new Data(first, keynote1, keynote2, new KeyNotes("谢谢！", "#000000"));
			Templete templete = new Templete(openid, "DqUQWPy9BQcvBfiYWVy4k1DkJ3ZTHp3YB8kQuAJgRDw", data);
			templete.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(templete);
			String temp = "{\"touser\":\"" + openid + "\","
					+ "\"template_id\":\"DqUQWPy9BQcvBfiYWVy4k1DkJ3ZTHp3YB8kQuAJgRDw\",\"url\":\"http://weixin.qq.com/download\",\"data\":{\"first\":{\"value\":\"这是潘星宇发来的测试推送\",\"color\":\"#000000\"},\"keyword1\":{\"value\":\"这是潘星宇发来的测试推送\",\"color\":\"#000000\"},\"keyword2\":{\"value\":\"2017-05-14\",\"color\":\"#000000\"},\"remark\":{\"value\":\"嘻嘻嘻\",\"color\":\"#000000\"}}}";
			System.out.println(temp);
			System.out.println(jsonObject.toString());
			DataOutputStream dataOutputStream = new DataOutputStream(httpsURLConnection.getOutputStream());
			dataOutputStream.writeBytes(temp);
			dataOutputStream.flush();
			dataOutputStream.close();
			InputStreamReader inputStreamReader = new InputStreamReader(httpsURLConnection.getInputStream());
			int i = inputStreamReader.read();
			String jsonMsg = "";
			while (i != -1) {
				jsonMsg += (char) i;
				i = inputStreamReader.read();
			}
			Map<String, Object> map = new HashMap<>();
			map.put("errcode", Integer.class);
			JSONObject jsonObject2 = JSONObject.fromObject(jsonMsg);
			Map<String, Object> resultmap = (Map<String, Object>) JSONObject.toBean(jsonObject2, Map.class, map);
			System.out.println(resultmap.get("errcode"));
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
