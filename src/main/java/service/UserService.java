package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import pojo.User;

public class UserService {
	private UserDao userDao = new UserDaoImpl();
	public User checkLogin(String account,String password) throws SQLException{
		return userDao.checkLogin(account, password);
	}
	public void register(User user) throws SQLException{
		userDao.register(user);
		return;
	}
	
	public boolean checkAccount(String account) throws SQLException{
		return userDao.checkAccount(account);
	}
	
	public List<User> getAllUserInfo() throws SQLException{
		return this.userDao.getAllUserInfo();
	}
	
	public void disableAccount(String account) throws SQLException{
		String disableState = "0";
		this.userDao.setState(account, disableState);
	}
	
	public void enableAccount(String account) throws SQLException{
		String enableState = "1";
		this.userDao.setState(account, enableState);
	}
	
	public void setName(String account,String name) throws SQLException{
		this.userDao.setName(account, name);
	}
	public void setLogo(String account,String logo) throws SQLException{
		this.userDao.setLogo(account, logo);
	}
	public String getUserSize() throws SQLException {
		return this.userDao.getUserSize();
	}
	
	public Map<String,String> getMonthSizeByYear(String year) throws SQLException {
		return this.userDao.getMonthSizeByYear(year);
	}
}
