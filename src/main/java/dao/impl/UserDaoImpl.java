package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.UserDao;
import pojo.ApplyMessage;
import pojo.NewsMaker;
import pojo.User;
import util.JDBCUtil;

public class UserDaoImpl implements UserDao {
	private Connection connect = JDBCUtil.getConnection();
	private String sql = null;
	private PreparedStatement preparedStatement = null;

	@Override
	public User checkLogin(String account, String password) throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT NAME,account,password,logo,registerTime,state FROM user where account = ? and password = ?;";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, account);
		preparedStatement.setString(2, password);
		ResultSet manageSet = preparedStatement.executeQuery();
		while (manageSet.next()) {
			String name = manageSet.getString("name");
			String logo = manageSet.getString("logo");
			String registerTime = manageSet.getString("registerTime");
			String state = manageSet.getString("state");
			// 0表示还未经过审核或者被封号
			if ("0".equals(state))
				return null;
			User user = new User(account, password, name, registerTime, logo);
			return user;
		}
		return null;
	}

	@Override
	public void register(User user) throws SQLException {
		// TODO Auto-generated method stub
		String account = user.getAccount();
		String password = user.getPassword();
		String name = user.getName();
		String logo = user.getLogo();
		String Nowtime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		java.sql.Date mysqldate = java.sql.Date.valueOf(Nowtime);
		// 获得当天日期年-月-日
		sql = "insert INTO user(account,PASSWORD, name,logo,registerTime,state) VALUES(?,?,?,?,?,?);";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, account);
		preparedStatement.setString(2, password);
		preparedStatement.setString(3, name);
		preparedStatement.setString(4, logo);
		preparedStatement.setDate(5, mysqldate);
		preparedStatement.setString(6, "1");
		preparedStatement.execute();
		return;
	}

	@Override
	public boolean checkAccount(String account) throws SQLException {
		sql = "SELECT account FROM user where account = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, account);
		ResultSet accountSet = preparedStatement.executeQuery();
		while (accountSet.next()) {
			return false;
		}
		return true;
	}

	@Override
	public void setState(String account, String state) throws SQLException {
		// TODO Auto-generated method stub
		sql = "UPDATE user set state = ? where account = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, state);
		preparedStatement.setString(2, account);
		preparedStatement.execute();
		return;
	}

	@Override
	public List<User> getAllUserInfo() throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT account,name,registerTime,logo,state FROM user";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet userSet = preparedStatement.executeQuery();
		List<User> users = new ArrayList<User>();
		while (userSet.next()) {
			String account = userSet.getString("account");
			String name = userSet.getString("name");
			String registerTime = userSet.getString("registerTime");
			String logo = userSet.getString("logo");
			String state = userSet.getString("state");
			String password = null;
			User user = new User(account, password, name, registerTime, logo, state);
			users.add(user);
		}
		return users;
	}

	@Override
	public void setName(String account, String name) throws SQLException {
		// TODO Auto-generated method stub
		sql = "UPDATE User set name = ? where account = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, name);
		preparedStatement.setString(2, account);
		preparedStatement.execute();
		return;
	}

	@Override
	public void setLogo(String account, String logo) throws SQLException {
		// TODO Auto-generated method stub
		sql = "UPDATE User set logo = ? where account = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, logo);
		preparedStatement.setString(2, account);
		preparedStatement.execute();
		return;
	}

	@Override
	public String getUserSize() throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT count(*) as size FROM user;";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			String size = resultSet.getString("size");
			return size;
		}
		return "0";
	}

	@Override
	public Map<String,String> getMonthSizeByYear(String year) throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT COUNT(*)as size,DATE_FORMAT(registerTime, '%m') as month FROM user WHERE  YEAR(registerTime)=? GROUP BY DATE_FORMAT(registerTime, '%Y-%m') ";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, year);
		ResultSet resultSet = preparedStatement.executeQuery();
		HashMap<String, String> user_month_size = new HashMap<String, String>();
		while (resultSet.next()) {
			String size = resultSet.getString("size");
			String month  = resultSet.getString("month");
			user_month_size.put(month, size);
		}
		return user_month_size;
	}
}
