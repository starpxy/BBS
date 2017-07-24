package com.bbs.entities.rules;

/**
 * �����ƶ������ֺ�״̬�Ķ�Ӧ���ͣ�
 * 0Ϊ�ɽ���
 * 1Ϊ�ѱ�Ԥ��
 * 2Ϊ����ӽ��鵥
 * 3Ϊ�ѽ��
 * -1Ϊ����״̬
 */
import java.util.ArrayList;
import java.util.Arrays;

public class BookItemRule {
	public static final ArrayList<String> status = new ArrayList<String>(Arrays.asList("�ɽ���", "�ѱ�Ԥ��", "����ӽ��鵥", "�ѽ��"));

	public static String getStatus(int i) {
		if (i >= 0 && i < 4) {
			return status.get(i);
		} else {
			return null;
		}
	}

	public static int getStatus(String state) {
		if (status.contains(state)) {
			return status.indexOf(state);
		} else {
			return -1;
		}
	}
}