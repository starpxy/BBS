package com.bbs.redis;

import redis.clients.jedis.Jedis;

public class RedisManager {
	private static Jedis jedis = new Jedis("127.0.0.1");

	private static Jedis getInstance() {
		if (jedis == null) {
			jedis = new Jedis();
		}
		return jedis;
	}

	public static void setKvPair(String key, String value) {
		getInstance().set(key, value);
	}

	public static void setKvPair(String key, int expireTime, String value) {
		getInstance().setex(key, expireTime, value);
	}

	public static String getStringByKey(String key) {
		return getInstance().get(key);
	}
	
}
