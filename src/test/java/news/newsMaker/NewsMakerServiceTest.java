package news.newsMaker;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.Test;

import pojo.NewsMaker;
import service.NewsMakerService;

public class NewsMakerServiceTest {
	private NewsMakerService newsMakerServiceTest = new NewsMakerService();
	@Test
	public void test() {
		String account = "123";
		boolean flag = true;
		try {
			flag = this.newsMakerServiceTest.checkAccount(account);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(true, flag);
	}
	@Test
	public void testGetNewsMaker() throws Exception {
		List<NewsMaker> newsMaker = this.newsMakerServiceTest.getAllNewsMakerInfo();
		assertNotNull(newsMaker);
	}

}
