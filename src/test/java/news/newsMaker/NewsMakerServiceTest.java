package news.newsMaker;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import pojo.NewsMaker;
import service.NewsMakerService;

public class NewsMakerServiceTest {
	public static NewsMakerService newsMakerServiceTest = new NewsMakerService();
	@BeforeClass
	public static void before(){
		System.out.println("@BeforeClassINNewsMakerService");
	}
	
	@Test
	public void test() {
		System.out.println("checkAccount");
		String account = "123";
		boolean flag = true;
		try {
			flag = newsMakerServiceTest.checkAccount(account);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(true, flag);
	}
	@Test
	public void testGetNewsMaker() throws Exception {
		System.out.println("getAllNewsMakerInfo");
		List<NewsMaker> newsMaker = newsMakerServiceTest.getAllNewsMakerInfo();
		assertNotNull(newsMaker);
	}

}
