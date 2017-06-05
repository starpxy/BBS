package com.bbs.api;
/**
 * 
 * 15/05/2017
 * 
 * @author Star
 * 
 * This class is to store the AppId and secrete of WeChat public account.
 * 
 * You can use this project for other account by changing appId and appSecrete below.
 *
 */
public class BasicAccountParam {
	private static final String appId="wx95311e6c3749af30";
	private static final String appSecrete="c9cf6453de2e7b471625f4747f79e75f";
	private static final String mchId="1423223602";
	private static final String key="star1234567890abcdefghijklmnopqr";
	protected static String getKey() {
		return key;
	}
	protected static String getMchid() {
		return mchId;
	}
	protected static String getAppId() {
		return appId;
	}
	protected static String getAppSecrete() {
		return appSecrete;
	}
}
