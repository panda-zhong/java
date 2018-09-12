package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import dao.NewsMakerDao;
import pojo.Manage;
import pojo.NewsMaker;
import pojo.User;
import util.JDBCUtil;

public class NewsMakerDaoImpl implements NewsMakerDao {
	private Connection connect = JDBCUtil.getConnection();
	private String sql = null;
	private PreparedStatement preparedStatement = null;

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.NewsMakerDao#checkLogin(java.lang.String, java.lang.String)
	 */
	@Override
	public NewsMaker checkLogin(String account, String password) throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT NAME,account,password,logo,registerTime,state FROM newsMaker where account = ? and password = ?;";
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
			NewsMaker newsMaker = new NewsMaker(account, password, name, registerTime, logo);
			return newsMaker;
		}
		return null;
	}

	@Override
	public void register(NewsMaker newsMaker) throws SQLException {
		// TODO Auto-generated method stub
		String account = newsMaker.getAccount();
		String password = newsMaker.getPassword();
		String name = newsMaker.getName();
		String logo = newsMaker.getLogo();
		String Nowtime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		java.sql.Date mysqldate = java.sql.Date.valueOf(Nowtime);
		// 获得当天日期年-月-日
		sql = "insert INTO newsMaker(account,PASSWORD, name,logo,registerTime,state) VALUES(?,?,?,?,?,?);";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, account);
		preparedStatement.setString(2, password);
		preparedStatement.setString(3, name);
		preparedStatement.setString(4, logo);
		preparedStatement.setDate(5, mysqldate);
		preparedStatement.setString(6, "0");
		preparedStatement.execute();
		return;
	}

	@Override
	public boolean checkAccount(String account) throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT account FROM newsMaker where account = ?";
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
		sql = "UPDATE newsMaker set state = ? where account = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, state);
		preparedStatement.setString(2, account);
		preparedStatement.execute();
		return;
	}

	@Override
	public List<NewsMaker> getAllNewsMakerInfo() throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT account,name,registerTime,logo,state FROM newsMaker";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet newsMakerSet = preparedStatement.executeQuery();
		List<NewsMaker> newsMakers = new ArrayList<NewsMaker>();
		while (newsMakerSet.next()) {
			String account = newsMakerSet.getString("account");
			String name = newsMakerSet.getString("name");
			String registerTime = newsMakerSet.getString("registerTime");
			String logo = newsMakerSet.getString("logo");
			String state = newsMakerSet.getString("state");
			String password = null;
			NewsMaker newsMaker = new NewsMaker(account, password, name, registerTime, logo, state);
			newsMakers.add(newsMaker);
		}
		return newsMakers;
	}

	@Override
	public void setName(String account, String name) throws SQLException {
		// TODO Auto-generated method stub
		sql = "UPDATE NewsMaker set name = ? where account = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, name);
		preparedStatement.setString(2, account);
		preparedStatement.execute();
		return;
	}

	@Override
	public void setLogo(String account, String logo) throws SQLException {
		// TODO Auto-generated method stub
		sql = "UPDATE NewsMaker set logo = ? where account = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, logo);
		preparedStatement.setString(2, account);
		preparedStatement.execute();
		return;
	}

	@Override
	public String getNewsMakerSize() throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT count(*) as size FROM newsMaker;";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			String size = resultSet.getString("size");
			return size;
		}
		return "0";
	}
}
