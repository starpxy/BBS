package com.bbs.api;
/**
 * 15/05/2017
 * 
 * @author Star
 * 
 * Initialize the class.
 * 
 * Then call the methods. Give the parameter as the name says.
 * 
 * 
 */
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import com.bbs.api.entities.Data;
import com.bbs.api.entities.KeyWord;
import com.bbs.api.entities.NewData;
import com.bbs.api.entities.Template;

import net.sf.json.JSONObject;

public class TemplateMessagePushing {

	public void pushReturningBooks(String openid,String bookTitle,int days) {
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("您有一条待办事件：还书通知", "#000000");
			KeyWord keynote1 = new KeyWord("您借阅的书籍《"+bookTitle+"》将于"+days+"天后到期，请及时还书！", "#000079");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord keynote2 = new KeyWord(simpleDateFormat.format(date), "#000079");
			Data data = new Data(first, keynote1, keynote2, new KeyWord("若不能按时还书，您的押金将不会被返还。", "#930000"));
			Template template = new Template(openid, "DqUQWPy9BQcvBfiYWVy4k1DkJ3ZTHp3YB8kQuAJgRDw", data);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(httpsURLConnection.getOutputStream()));
			printWriter.print(jsonObject.toString());
			printWriter.flush();
			printWriter.close();
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
	public void pushDepositConfirming(String openid,int bookNum,String identifiCode){
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("您的"+bookNum+"份图书押金已经支付成功。", "#000000");
			KeyWord keynote1 = new KeyWord(identifiCode, "#000079");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord keynote2 = new KeyWord(simpleDateFormat.format(date), "#000079");
			Data data = new NewData(first, keynote1,new KeyWord(bookNum+"", "#000079"), new KeyWord(20*bookNum+"元", "#000079"),keynote2,new KeyWord("您可以点击本链接打开退款二维码或向管理员提交退款验证码进行退款。", "#000079"));
			Template template = new Template(openid, "-mDlmXytJHmD5c7w58PA6jkloX12O934b0Em8wiY7xU","http://qr.liantu.com/api.php?text=http://pxyzmy.com.cn/BBS/views/admin-confirmReturn?identifiCode="+identifiCode+"&bg=f3f3f3&fg=ff2200&gc=22ff22&w=300&el=l", data);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(httpsURLConnection.getOutputStream()));
			printWriter.print(jsonObject.toString());
			printWriter.flush();
			printWriter.close();
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
	public void pushDepositRefund(String openid,int bookNum,String identifiCode){
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("您的"+bookNum+"份图书押金已经退款成功。", "#000000");
			KeyWord keynote1 = new KeyWord(identifiCode, "#000079");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord keynote2 = new KeyWord(simpleDateFormat.format(date), "#000079");
			Data data = new NewData(first, keynote1, new KeyWord(20*bookNum+"元", "#000079"),keynote2,new KeyWord("若有任何疑问请致电客服：18500463581", "#000079"));
			Template template = new Template(openid, "Exm4J9gALXY_RUNezo3ligodLpaW2lWDNQ5ikN7uoiw", data);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(httpsURLConnection.getOutputStream()));
			printWriter.print(jsonObject.toString());
			printWriter.flush();
			printWriter.close();
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
//	public static void main(String[] args) {
//		new TemplateMessagePushing().pushDepositConfirming("oQe5IuE5_HM6rkTKIxOUOCj_-DEY", 2, new IdentifyCode(1, 29).getCipherCode());
//		new TemplateMessagePushing().pushReturningBooks("oQe5IuBxLw5PKLiQDyfKuCnpDxg0", "可爱的萌宝儿", 1);
//	}
}
