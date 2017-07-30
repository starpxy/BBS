package com.bbs.test.cases;


import org.junit.Test;

import com.bbs.api.TopScanManager;

public class TopScanManagerTest {

	@Test
	public void test() {
		TopScanManager.getQrCode("*");
	}

}
