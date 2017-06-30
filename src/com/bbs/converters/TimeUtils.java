package com.bbs.converters;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {

	public static long calTimeDiff(Date now, String before) {
		DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date d1;
		long days = 0;
		try {
			d1 = df2.parse(before);
			long diff =  (d1.getTime()+30*1000*3600*24L)-now.getTime();
			days = diff / (1000 * 60 * 60 * 24);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return days;
	}

}
