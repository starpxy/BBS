package com.bbs.test.cases;


import org.junit.Test;

import com.bbs.api.JSAPIInitial;

public class JSAPIInitialTest {
	JSAPIInitial jsapiInitial=new JSAPIInitial();

	@Test
	public void test() {
		jsapiInitial.initialAPI("https://www.baidu.com");
		jsapiInitial.initialAPI("https://gre.etest.net.cn/myStatus.do?neeaID=71409257");
	}

}
