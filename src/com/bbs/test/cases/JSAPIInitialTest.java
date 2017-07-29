package com.bbs.test.cases;

import static org.junit.Assert.*;

import org.junit.Test;

import com.bbs.api.JSAPIInitial;

public class JSAPIInitialTest {
	JSAPIInitial jsapiInitial=new JSAPIInitial();

	@Test
	public void test() {
		jsapiInitial.initialAPI("www.baidu.com");
		fail("Not yet implemented");
	}

}
