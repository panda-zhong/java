package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import pojo.User;

public interface UserDao {
	public User checkLogin(String account,String password) throws SQLException;
	public void register(User manage) throws SQLException;
	public boolean checkAccount(String account) throws SQLException;
	public void setState(String account,String state) throws SQLException;
	public List<User> getAllUserInfo() throws SQLException;
	public void setName(String account,String name) throws SQLException;
	public void setLogo(String account,String logo) throws SQLException;
	public String getUserSize() throws SQLException;
	public Map<String, String> getMonthSizeByYear(String year) throws SQLException;
}
