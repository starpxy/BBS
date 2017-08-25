package com.bbs.api;

import org.json.JSONArray;
import org.json.JSONObject;

import com.baidu.aip.speech.AipSpeech;

public class VoiceApiManger {
	private static final String APP_ID = "10049238";
	private static final String API_KEY = "f089wKPOOcTD3RpC7r1cmQu9";
	private static final String SECRET_KEY = "1oRATpLWAXVAfx7eE41xqAAGMmV7eB1G";
	private static AipSpeech client;

	private static AipSpeech getInstance() {
		if (client == null) {
			client = new AipSpeech(APP_ID, API_KEY, SECRET_KEY);
		}
		return client;
	}

	public static String binaryVoice(byte[] data, String format) {
		JSONObject res = getInstance().asr(data, format, 16000, null);
		if (res.getInt("err_no") == 0) {
			JSONArray result = res.getJSONArray("result");
			return result.getString(0);
		} else {
			return null;
		}
	}

}
