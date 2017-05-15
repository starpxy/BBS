package com.bbs.api;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
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
			httpsURLConnection.setDoOutput(true);
			KeyNotes first = new KeyNotes("这是潘星宇发来的测试推送", "#9D9D9D");
			KeyNotes keynote1 = new KeyNotes("这个是推送内容", "#9D9D9D");
			Date date = new Date();
			KeyNotes keynote2 = new KeyNotes(date.toInstant().now().toString().substring(0, 10), "#9D9D9D");
			Data data = new Data(first, keynote1, keynote2, new KeyNotes("谢谢！", "#9D9D9D"));
			Templete templete = new Templete(openid, "DqUQWPy9BQcvBfiYWVy4k1DkJ3ZTHp3YB8kQuAJgRDw", data);
			JSONObject jsonObject = JSONObject.fromObject(templete);
			String temp = "{\"touser\":\"" + openid + "\","
					+ "\"template_id\":\"DqUQWPy9BQcvBfiYWVy4k1DkJ3ZTHp3YB8kQuAJgRDw\",\"data\":{\"first\":{\"value\":\"这是潘星宇发来的测试推送\",\"color\":\"#9D9D9D\"},\"keyword1\":{\"value\":\"这是潘星宇发来的测试推送\",\"color\":\"#9D9D9D\"},\"keyword2\":{\"value\":\"2017-05-14\",\"color\":\"#9D9D9D\"}}";
			System.out.println(temp);
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
