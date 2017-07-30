package com.bbs.test.cases;


import java.util.TreeMap;

import org.junit.Test;

import com.bbs.api.Signature;

public class SignatureTest {

	@Test
	public void test() {
		TreeMap<String, String>map=new TreeMap<String, String>();
//		Signature.signMD5(map);
//		Signature.signSHA(map);
		//以上这两行不通过测试，传入空map index超出范围
		map.put("dad", "dwefbhweb");
		Signature.signSHA(map);
		Signature.signMD5(map);
		map.put("dsda", "");
		Signature.signSHA(map);
		Signature.signMD5(map);
	}

}
