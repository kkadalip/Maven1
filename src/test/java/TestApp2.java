import org.junit.Assert;
import org.junit.Test;

import controller.AppForTesting;

public class TestApp2 {

	@Test
	public void testPrintHelloWorld2() {

		Assert.assertEquals(AppForTesting.getHelloWorld2(), "Hello World 2");

	}

}
