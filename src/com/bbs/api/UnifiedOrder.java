package com.bbs.api;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;

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
	private String body = "SHC: Book Fee";
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
			PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(httpsURLConnection.getOutputStream(),"UTF-8"));
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
		result.put("outTradeNumber", outTradeNo);
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
		TreeMap<String, String> map = new TreeMap<>();
		map.put("appId", appid);
		map.put("nonceStr", nonceStr);
		map.put("package", "prepay_id="+prepayId);
		map.put("signType", "MD5");
		map.put("timeStamp", timeStamp);
		map.put("key", key);
		String result = Signature.signMD5(map);
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
		TreeMap<String, String> map = new TreeMap<>();
		map.put("appid", appid);
		map.put("body", body);
		map.put("mch_id", mchId);
		map.put("nonce_str", nonceStr);
		map.put("notify_url", notifyURL);
		map.put("openid", openId);
		map.put("out_trade_no", outTradeNo);
		map.put("spbill_create_ip", spbillCreateIp);
		map.put("total_fee", totalFee+"");
		map.put("trade_type", tradeType);
		map.put("key", key);
		String result = Signature.signMD5(map);
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
}
