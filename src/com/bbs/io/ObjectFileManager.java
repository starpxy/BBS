package com.bbs.io;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.bbs.entities.Book;
import com.bbs.entities.User;
import com.bbs.properties.PathProperty;

public class ObjectFileManager {
	/**
	 * Root should be changed to absolute path when push the project to net.
	 * Root should end with "/"
	 */
	private static String root = PathProperty.recommendPath;

	public static void writeRecommendToFile(User user, List<Book> books) {
		try {
			String path = root + user.getUserId() + "\\";
			File file = new File(path);
			if (!file.exists()) {
				file.mkdirs();
			}
			FileOutputStream fileOutputStream = new FileOutputStream(path + "recommendList.dat");
			ObjectOutputStream objectOutputStream = new ObjectOutputStream(fileOutputStream);
			List<Integer> bookIds = new LinkedList<>();
			Iterator<Book> iterator = books.iterator();
			while (iterator.hasNext()) {
				Book temp = iterator.next();
				bookIds.add(temp.getBookId());
			}
			objectOutputStream.writeObject(bookIds);
			objectOutputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static List<Integer> readRecommend(User user) {
		String path = root + user.getUserId() + "/";
		File file = new File(path);
		if (!file.exists()) {
			return null;
		}
		List<Integer> result = null;
		try {
			ObjectInputStream objectInputStream = new ObjectInputStream(
					new FileInputStream(path + "recommendList.dat"));
			result = (List<Integer>) objectInputStream.readObject();
			objectInputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}

}
