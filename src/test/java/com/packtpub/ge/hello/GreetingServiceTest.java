package com.packtpub.ge.hello;

import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class GreetingServiceTest {
	GreetingService service;

	@Before
	public void setup(){
		service = new GreetingService();
	}

	@Test
	public void testGreet(){
		// assertEquals("Hello Test", service.greet("Test"));
		assertEquals("Hello Test", service.greet("Guest"));
	}
}
