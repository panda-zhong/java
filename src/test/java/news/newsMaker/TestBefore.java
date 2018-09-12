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
		newsMakerService = new NewsMakerService();
	}
	
	@AfterClass
	static public void close(){
//		newsMakerService;
		System.out.println("close");
		System.gc();
	}
	
	@Test
	public void test() throws SQLException {
		newsMakerService.getAllNewsMakerInfo();
	}

}
