package com.bbs.api;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;


/**
 * 
 * @author Star
 * 
 * 
 *         
 */
public class UnifiedOrder {
	private final String appid = BasicAccountParam.getAppId();
	private final String key = BasicAccountParam.getKey();
	private final String mchId = "1423223602";
	private String nonceStr;
	private String sign;
	private String body = "test";
	private String outTradeNo;
	private int totalFee;
	private String spbillCreateIp;
	private String notifyURL = "http://pxyzmy.com.cn";
	private String tradeType = "JSAPI";
	private String openId;
	private Map<String, Object> resultMap;
	public Map<String, Object> getLastOrder(){
		return resultMap;
	}
	public Map<String, Object> createOrder(String openId,String spbillCreateIp, int totalFee){
		Map<String,Object> result = new HashMap<String,Object>();
		Map<String,Object> tempResult = new HashMap<String,Object>();
		this.openId = openId;
		this.totalFee = totalFee;
		this.spbillCreateIp = spbillCreateIp;
		nonceStr = generateNoceStr();
		outTradeNo = generateOutTrade(nonceStr);
		sign = calculateSign();
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("xml");
		Element appidEl = root.addElement("appid");
		Element bodyEl = root.addElement("body");
		Element mchEl = root.addElement("mch_id");
		Element nonceEl = root.addElement("nonce_str");
		Element notiEl = root.addElement("notify_url");
		Element openEl = root.addElement("openid");
		Element outEl = root.addElement("out_trade_no");
		Element spbillEl = root.addElement("spbill_create_ip");
		Element totalEl = root.addElement("total_fee");
		Element tradeEl = root.addElement("trade_type");
		Element signEl = root.addElement("sign");
		appidEl.setText(appid);
		bodyEl.setText(body);
		mchEl.setText(mchId);
		nonceEl.setText(nonceStr);
		notiEl.setText(notifyURL);
		openEl.setText(openId);
		outEl.setText(outTradeNo);
		spbillEl.setText(spbillCreateIp);
		totalEl.setText(totalFee+"");
		tradeEl.setText(tradeType);
		signEl.setText(sign);
		URL url = null;
		String msg = null;
		try {
			url = new URL("https://api.mch.weixin.qq.com/pay/unifiedorder");
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(httpsURLConnection.getOutputStream()));
			printWriter.print(document.asXML());
			printWriter.flush();
			printWriter.close();
			InputStreamReader inputStreamReader = new InputStreamReader(httpsURLConnection.getInputStream());
			int i = inputStreamReader.read();
			msg = "";
			while (i != -1) {
				msg += (char) i;
				i = inputStreamReader.read();
			}
			Document doc = DocumentHelper.parseText(msg);
			Element rootEl = doc.getRootElement();
			Iterator<Element> iterator = rootEl.elementIterator();
			while(iterator.hasNext()){
				Element temp = iterator.next();
				tempResult.put(temp.getName(), temp.getText());
			}
			result = getPaySign((String) tempResult.get("prepay_id"));
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return result;
	}
	public String getOutTradeNo() {
		return outTradeNo;
	}
	
	public String getNonceStr() {
		return nonceStr;
	}
	
	public String getSign() {
		return sign;
	}
	private Map<String, Object> getPaySign(String prepayId){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Date date = new Date();
		String timeStamp = (date.getTime()/1000)+"";
		String star = "appId="+appid+"&nonceStr="+nonceStr+"&package=prepay_id="+prepayId+"&signType=MD5"+"&timeStamp="+timeStamp+"&key="+key;
		MessageDigest messageDigest=null;
		try {
			messageDigest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		messageDigest.update(star.getBytes());
		byte b[] = messageDigest.digest();
		int i;
		StringBuffer buf = new StringBuffer("");
		for (int offset = 0; offset < b.length; offset++) {
			i = b[offset];
			if (i < 0)
				i += 256;
			if (i < 16)
				buf.append("0");
			buf.append(Integer.toHexString(i));
		}
		String result = buf.toString();
		resultMap.put("appId", appid);
		resultMap.put("nonceStr", nonceStr);
		resultMap.put("pac", "prepay_id="+prepayId);
		resultMap.put("signType", "MD5");
		resultMap.put("timeStamp", timeStamp);
		resultMap.put("paySign", result.toUpperCase());
		this.resultMap = resultMap;
		return resultMap;
	}
	private String calculateSign(){
		String star = "" + "appid=" + appid + "&body=" + body + "&mch_id=" + mchId + "&nonce_str=" + nonceStr
				+ "&notify_url=" + notifyURL + "&openid=" + openId + "&out_trade_no=" + outTradeNo
				+ "&spbill_create_ip=" + spbillCreateIp + "&total_fee=" + totalFee + "&trade_type=" + tradeType
				+ "&key=" + key;
		MessageDigest messageDigest=null;
		try {
			messageDigest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		messageDigest.update(star.getBytes());
		byte b[] = messageDigest.digest();
		int i;
		StringBuffer buf = new StringBuffer("");
		for (int offset = 0; offset < b.length; offset++) {
			i = b[offset];
			if (i < 0)
				i += 256;
			if (i < 16)
				buf.append("0");
			buf.append(Integer.toHexString(i));
		}
		String result = buf.toString();
		return result.toUpperCase();
	}

	private String generateNoceStr() {
		String result = "";
		Random random = new Random(new Date().getTime());
		for (int i = 0; i < 16; i++) {
			result += generateCharacter(random);
		}
		return result;
	}

	private char generateCharacter(Random random) {
		int c = (random.nextInt(73) + 48);
		if ((c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122)) {
			return (char) (c);
		} else {
			return generateCharacter(random);
		}
	}

	private String generateOutTrade(String nonceStr) {
		Date date = new Date();
		String result = date.getTime() + nonceStr;
		return result;
	}
//	public static void main(String[] args) {
//		UnifiedOrder unifiedOrder = new UnifiedOrder();
//		Map<String,Object> map = unifiedOrder.createOrder("oQe5IuBxLw5PKLiQDyfKuCnpDxg0", "113.242.248.187", 1);
//		Iterator<String> iterator = map.keySet().iterator();
//		while(iterator.hasNext()){
//			String temp = iterator.next();
//			System.out.println(temp+" : "+ map.get(temp));
//		}
//	}
}
