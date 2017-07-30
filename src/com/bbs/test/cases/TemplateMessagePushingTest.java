package com.bbs.test.cases;


import org.junit.Test;

import com.bbs.api.TemplateMessagePushing;

public class TemplateMessagePushingTest {

	TemplateMessagePushing templateMassagePushing=new TemplateMessagePushing();
	@Test
	public void test() {
		templateMassagePushing.pushReturningBooks("oQe5IuBxLw5PKLiQDyfKuCnpDxg0", "挪威森林", 3);
		templateMassagePushing.pushDepositConfirming("oQe5IuBxLw5PKLiQDyfKuCnpDxg0", 5);
		templateMassagePushing.pushReservation("oQe5IuBxLw5PKLiQDyfKuCnpDxg0", "解忧杂货铺");
	}

}
