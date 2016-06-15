import org.junit.Assert;
import org.junit.Test;

import controller.AppForTesting;

public class TestApp1 {

	@Test
	public void testPrintHelloWorld() {

		Assert.assertEquals(AppForTesting.getHelloWorld(), "Hello World");

	}

}
