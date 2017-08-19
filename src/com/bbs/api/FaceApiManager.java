package com.bbs.api;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import com.baidu.aip.face.AipFace;
import com.bbs.properties.PathProperty;

public class FaceApiManager {
	private static final String APP_ID = "10011807";
	private static final String API_KEY = "u904anZ3SHxG3TxC3IuvYCyQ";
	private static final String SECRET_KEY = "BuL3W5SMGK9tQFDDGqI6TE0hpXBNj0jO";
	private static AipFace client;

	private static AipFace getInstance() {
		if (client == null) {
			return new AipFace(APP_ID, API_KEY, SECRET_KEY);
		} else {
			return client;
		}
	}

	public static String recongnizeFaces(String filename) {
		String path = parsePath(filename);
		JSONObject response = getInstance().detect(path, new HashMap<String, String>());
		return response.toString();
	}

	public static float[][] compareFaces(List<String> pathList) {
		List<String> resultList = new ArrayList<>();
		while (!pathList.isEmpty()) {
			String temp = pathList.remove(0);
			temp = parsePath(temp);
			resultList.add(temp);
		}
		JSONObject response = getInstance().match(resultList, new HashMap<String, String>());
		String errorMsg = response.optString("error_msg");
		if (errorMsg == null || errorMsg.equals("")) {
			JSONArray result = response.getJSONArray("result");
			float[][] scores = new float[resultList.size()][resultList.size()];
			Iterator<Object> iterator = result.iterator();
			while (iterator.hasNext()) {
				JSONObject temp = (JSONObject) iterator.next();
				scores[temp.getInt("index_i")][temp.getInt("index_j")] = temp.getInt("score");
			}
			return scores;
		} else {
			return null;
		}
	}

	public static boolean registerNewUsers(String imgName, String userId, String userInfo, String groupName) {
		AipFace client = getInstance();
		imgName = parsePath(imgName);
		HashMap<String, String> options = new HashMap<String, String>();
		JSONObject res = client.addUser(userId, userInfo, Arrays.asList(groupName), imgName, options);
		String errorMsg = res.optString("error_msg");
		if (errorMsg == null || errorMsg.equals("")) {
			return true;
		} else {
			return false;
		}
	}

	public static String recognizeUserInGroup(String imgName, String groupName) {
		String path = parsePath(imgName);
		HashMap<String, Object> options = new HashMap<>();
		options.put("user_top_num", 1);
		JSONObject res = getInstance().identifyUser(Arrays.asList(groupName), path, options);
		String errorMsg = res.optString("error_msg");
		if (errorMsg == null || errorMsg.equals("")) {
			JSONArray result = res.getJSONArray("result");
			JSONObject info = result.getJSONObject(0);
			String uid = info.getString("uid");
			JSONArray scores = info.getJSONArray("scores");
			int score = scores.getInt(0);
			if (score >= 80) {
				return uid;
			}
		}
		return null;
	}

	private static String parsePath(String path) {
		String resultPath = PathProperty.facePath;
		resultPath += path;
		return resultPath;
	}

	public static boolean deleteUser(String groupName, String uid) {
		JSONObject res = getInstance().deleteGroupUser(Arrays.asList(groupName), uid);
		String errorMsg = res.optString("error_msg");
		if (errorMsg == null || errorMsg.equals("")) {
			return true;
		} else {
			return false;
		}
	}

	public static void main(String[] args) {
		// ArrayList<String> arrayList = new ArrayList<>();
		// arrayList.add("avatar.jpg");
		// arrayList.add("huawei.jpg");
		System.out.println(recognizeUserInGroup("huawei.jpg", "test_group"));
	}
}
