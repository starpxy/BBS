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
import com.bbs.api.entities.ReserveData;
import com.bbs.api.entities.Template;
import com.bbs.encrypt.IdentifyCode;
import com.bbs.entities.Book;
import com.bbs.entities.User;

import net.sf.json.JSONObject;

public class TemplateMessagePushing {
	/*
	 * 此方法为提醒还书方法，实例化此类后即可调用。
	 * openid参数为用户对于公众号的openid，示例openid（此ID为萌萌小朋友的）：oQe5IuBxLw5PKLiQDyfKuCnpDxg0
	 * bookTitle是借的书的书名。 days是几天后过期。
	 */
	public void pushReturningBooks(String openid, String bookTitle, int days) {
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
					+ AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("您有一条待办事件：还书通知", "#000000");
			KeyWord keynote1 = new KeyWord("您借阅的书籍《" + bookTitle + "》将于" + days + "天后到期，请及时还书！", "#000079");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord keynote2 = new KeyWord(simpleDateFormat.format(date), "#000079");
			Data data = new Data(first, keynote1, keynote2, new KeyWord("若不能按时还书，您的押金将不会被返还。", "#930000"));
			Template template = new Template(openid, "DqUQWPy9BQcvBfiYWVy4k1DkJ3ZTHp3YB8kQuAJgRDw", data);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(
					new OutputStreamWriter(httpsURLConnection.getOutputStream(), "UTF-8"));
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

	/*
	 * 推荐通知。
	 */
	public void pushRecommendBook(User user, Book book) {
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
					+ AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("嗨，这里有一本你喜欢的书哦！", "#000000");
			KeyWord keynote1 = new KeyWord("推荐给你这本《" + book.getBookTitle() + "》，希望你能喜欢。", "#000079");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord keynote2 = new KeyWord(simpleDateFormat.format(date), "#000079");
			Data data = new Data(first, keynote1, keynote2, new KeyWord("登陆后点击此消息查看书籍详情。", "#930000"));
			Template template = new Template(user.getWeChat(), "DqUQWPy9BQcvBfiYWVy4k1DkJ3ZTHp3YB8kQuAJgRDw",
					"http://pxyzmy.com.cn/BBS/views/book-bookDetails?bookId=" + book.getBookId(), data);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(
					new OutputStreamWriter(httpsURLConnection.getOutputStream(), "UTF-8"));
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

	/*
	 * 愿望单到货通知
	 */
	public void pushWishingBook(User user, Book book) {
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
					+ AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("您愿望单中的书有库存咯～", "#000000");
			KeyWord keynote1 = new KeyWord("您曾添加到愿望单中的《" + book.getBookTitle() + "》已到货，记得预订哦！", "#000079");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord keynote2 = new KeyWord(simpleDateFormat.format(date), "#000079");
			Data data = new Data(first, keynote1, keynote2, new KeyWord("登陆后点击此消息查看书籍详情。", "#930000"));
			Template template = new Template(user.getWeChat(), "DqUQWPy9BQcvBfiYWVy4k1DkJ3ZTHp3YB8kQuAJgRDw",
					"http://pxyzmy.com.cn/BBS/views/book-bookDetails?bookId=" + book.getBookId(), data);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(
					new OutputStreamWriter(httpsURLConnection.getOutputStream(), "UTF-8"));
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

	/*
	 * 预订过期通知
	 */
	public void pushReserveOverdue(User user, Book book) {
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
					+ AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("真遗憾！您忘记来取预定的书啦！", "#000000");
			KeyWord keynote1 = new KeyWord("您曾经预定的《" + book.getBookTitle() + "》现已过期，请您点击此处重新预订。", "#000079");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord keynote2 = new KeyWord(simpleDateFormat.format(date), "#000079");
			Data data = new Data(first, keynote1, keynote2, new KeyWord("登陆后点击此消息查看书籍详情。", "#930000"));
			Template template = new Template(user.getWeChat(), "DqUQWPy9BQcvBfiYWVy4k1DkJ3ZTHp3YB8kQuAJgRDw",
					"http://pxyzmy.com.cn/BBS/views/book-bookDetails?bookId=" + book.getBookId(), data);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(
					new OutputStreamWriter(httpsURLConnection.getOutputStream(), "UTF-8"));
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

	/*
	 * 还书过期通知
	 */
	public void pushRecordOverdue(User user, Book book) {
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
					+ AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("您忘记来还书啦！", "#000000");
			KeyWord keynote1 = new KeyWord("您曾经借出的《" + book.getBookTitle() + "》现已过期，请来我馆缴纳罚金并归还书籍。", "#000079");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord keynote2 = new KeyWord(simpleDateFormat.format(date), "#000079");
			Data data = new Data(first, keynote1, keynote2, new KeyWord("逾期不还书馆馆可是要生气的哦！", "#930000"));
			Template template = new Template(user.getWeChat(), "DqUQWPy9BQcvBfiYWVy4k1DkJ3ZTHp3YB8kQuAJgRDw", data);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(
					new OutputStreamWriter(httpsURLConnection.getOutputStream(), "UTF-8"));
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

	/*
	 * 押金验证通知。 openid不做解释。bookNum为所借图书数量。
	 */
	public void pushDepositConfirming(String openid, int bookNum) {
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
					+ AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("您的" + bookNum + "份图书押金已经支付成功。", "#000000");
			KeyWord keynote1 = new KeyWord("无需验证，扫描用户二维码", "#000000");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord keynote2 = new KeyWord(simpleDateFormat.format(date), "#000000");
			Data data = new NewData(first, keynote1, new KeyWord(bookNum + "", "#000000"),
					new KeyWord(20 * bookNum + "元", "#000000"), keynote2, new KeyWord("由于证书无法下载，暂时不能进行退款。", "#000079"));
			Template template = new Template(openid, "-mDlmXytJHmD5c7w58PA6jkloX12O934b0Em8wiY7xU",
					"http://qr.liantu.com/api.php?text=测试数据", data);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(
					new OutputStreamWriter(httpsURLConnection.getOutputStream(), "UTF-8"));
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

	/*
	 * 退款推送。 identifiCode已废弃。 此方法无需测试。
	 */
	public void pushDepositRefund(String openid, int bookNum, String identifiCode) {
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
					+ AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("您的" + bookNum + "份图书押金已经退款成功。", "#000000");
			KeyWord keynote1 = new KeyWord(identifiCode, "#000079");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord keynote2 = new KeyWord(simpleDateFormat.format(date), "#000079");
			Data data = new NewData(first, keynote1, new KeyWord(20 * bookNum + "元", "#000079"), keynote2,
					new KeyWord("若有任何疑问请致电客服：18500463581", "#000079"));
			Template template = new Template(openid, "Exm4J9gALXY_RUNezo3ligodLpaW2lWDNQ5ikN7uoiw", data);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(
					new OutputStreamWriter(httpsURLConnection.getOutputStream(), "UTF-8"));
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

	/*
	 * 预定成功推送。
	 */
	public void pushReservation(String openid, String bookTitle) {
		// id:rTDou8851rtrLfcfGJIkRemb2FYh2LpQ-7Ji5itSoLA
		try {
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
					+ AccessTokenManager.getAccessToken());
			HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setRequestMethod("POST");
			httpsURLConnection.setInstanceFollowRedirects(true);
			httpsURLConnection.setDoOutput(true);
			httpsURLConnection.setUseCaches(false);
			httpsURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			httpsURLConnection.connect();
			KeyWord first = new KeyWord("书籍预定成功通知", "#000000");
			KeyWord type = new KeyWord("开发团队", "#000000");
			KeyWord name = new KeyWord("SHC小组Ebook图书借阅系统", "#000000");
			KeyWord productType = new KeyWord("书籍", "#000000");
			KeyWord serviceName = new KeyWord(bookTitle, "#000000");
			KeyWord remark = new KeyWord("请尽快到图书馆取您预定的书籍！", "#000000");
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			KeyWord time = new KeyWord(simpleDateFormat.format(date), "#000000");
			ReserveData reserveData = new ReserveData(first, type, name, productType, serviceName, time, remark);
			Template template = new Template(openid, "rTDou8851rtrLfcfGJIkRemb2FYh2LpQ-7Ji5itSoLA", reserveData);
			template.setTopcolor("#000000");
			JSONObject jsonObject = JSONObject.fromObject(template);
			PrintWriter printWriter = new PrintWriter(
					new OutputStreamWriter(httpsURLConnection.getOutputStream(), "UTF-8"));
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

	// 下面就是调用的示例。
	public static void main(String[] args) {
		// new
		// TemplateMessagePushing().pushDepositConfirming("oQe5IuOG4oLF1N57aEQjmGEg5peU",2,
		// new IdentifyCode(1, 29).getCipherCode());
		new TemplateMessagePushing().pushReturningBooks("oQe5IuB9KNLkOTLY_fZKfnfRxXGA", "你好哟，欢迎关注我们的微信公众号", 1);
	}
}
