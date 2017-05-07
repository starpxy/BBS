package com.bbs.converters;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class JsonConverter {
	public String convertToJson(Map<String, Object> args){
		String result = "{";
		Iterator<String> iterator = args.keySet().iterator();
		while (iterator.hasNext()) {
			String key = iterator.next();
			Object value = args.get(key);
			result+=("\""+key+"\":");
			if (value instanceof String) {
				result+=("\""+value+"\",");
			}
			else if (value instanceof Integer) {
				result+=(key+",");
			}
		}
		result = result.substring(0, result.length()-1);
		result+="}";
		return result;
	}
	public Map<String, Object> convertTonMap(String jsonString){
		HashMap<String, Object> result = new HashMap<String, Object>();
		String[] blocks = jsonString.split(",");
		for (int i = 0; i < blocks.length; i++) {
			if (i==0) {
				blocks[i] = blocks[i].substring(1);
			}
			else if (i==blocks.length-1) {
				blocks[i] = blocks[i].substring(0, blocks[i].length()-1);
			}
			String[] values = blocks[i].split(":");
			if (values[1].startsWith("\"")) {
				result.put(values[0].substring(1, values[0].length()-1), values[1].substring(1, values[1].length()-1));
			}
			else{
				result.put(values[0].substring(1, values[0].length()-1), values[1]);
			}
		}
		return result;
	}
}
