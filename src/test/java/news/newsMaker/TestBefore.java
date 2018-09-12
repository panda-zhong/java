package news.newsMaker;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import service.NewsMakerService;

public class TestBefore {
	static private NewsMakerService newsMakerService;
	@BeforeClass
	static public void ini(){
		System.out.println("@BeforeClass在一个Java中执行一次");
		newsMakerService = new NewsMakerService();
	}
	
	@Before
	public void before(){
		System.out.println("before每个test执行一次");
	}
	
	@AfterClass
	static public void close(){
//		newsMakerService;
		System.out.println("close");
		System.gc();
	}
	
	@Test
	public void test() throws SQLException {
		System.out.println("test1");
		newsMakerService.getAllNewsMakerInfo();
	}
	@Test
	public void test2() throws Exception {
	System.out.println("test2()");
		String size = newsMakerService.getNewsMakerSize();
		assertNotNull(size);
	}

}
