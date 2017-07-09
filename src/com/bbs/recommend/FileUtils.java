package com.bbs.recommend;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FileUtils {
	/**
	 * this static method is used to write the object in which the recommendation list of the target book is stored
	 * 
	 * @param fileID
	 *            here fileID is namely the target book 's ISBN because it is unique globally
	 * @return
	 * @throws IOException 
	 */

	public static void writeResults(List<Map<String, HashMap<String, Double>>> booksvectors, String fileID) throws IOException {

			File dir = new File("data");
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File file = new File("data/" + fileID);
			if (!file.exists()) {
				file.createNewFile();
			}
			ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(file));
			oos.writeObject(booksvectors);
			oos.flush();
			oos.close();
	}

	/**
	 * this static method is used to read the object in which the recommendation list of the target book is stored
	 * 
	 * @param fileID
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Map<String, HashMap<String, Double>>> readResults(String fileID) {
		List<Map<String, HashMap<String, Double>>> results = null;
		try {
			File dir = new File("data");
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File file = new File("data/" + fileID);
			if (!file.exists()) {
				file.createNewFile();
			}
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file));
			results = (List<Map<String, HashMap<String, Double>>>) ois.readObject();
			ois.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return results;
	}

	public static boolean deleteData(File dir, String tag) {
		if (dir.isDirectory()) {
			String[] children = dir.list();
			for (int i = 0; i < children.length; i++) {
				if (children[i].indexOf(tag) > -1) {
					boolean success = deleteData(new File(dir, children[i]), tag);
					if (!success) {
						return false;
					}
				}
			}
		}
		return dir.delete();
	}
}
