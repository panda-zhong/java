package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import dao.ManageDao;
import pojo.Manage;
import pojo.NewsMaker;
import util.JDBCUtil;

public class ManageDaoImpl implements ManageDao {
	private Connection connect = JDBCUtil.getConnection();
	private String sql = null;
	private PreparedStatement preparedStatement = null;

	@Override
	public Manage checkLogin(String account, String password) throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT NAME,account,password,logo,registerTime,state FROM Manage where account = ? and password = ?;";
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
			Manage manage = new Manage(account, password, name, registerTime, logo);
			return manage;
		}
		return null;
	}

	@Override
	public void register(Manage manage) throws SQLException {
		// TODO Auto-generated method stub
		String account = manage.getAccount();
		String password = manage.getPassword();
		String name = manage.getName();
		String logo = manage.getLogo();
		String Nowtime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		java.sql.Date mysqldate = java.sql.Date.valueOf(Nowtime);
		// 获得当天日期年-月-日
		sql = "insert INTO manage(account,PASSWORD, name,logo,registerTime,state) VALUES(?,?,?,?,?,?);";
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
		sql = "SELECT account FROM MANAGE where account = ?";
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
		sql = "UPDATE manage set state = ? where account = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, state);
		preparedStatement.setString(2, account);
		preparedStatement.execute();
		return;
	}

	@Override
	public List<Manage> getAllManageInfo() throws SQLException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		sql = "SELECT account,name,registerTime,logo,state FROM manage";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet manageSet = preparedStatement.executeQuery();
		List<Manage> manages = new ArrayList<Manage>();
		while (manageSet.next()) {
			String account = manageSet.getString("account");
			String name = manageSet.getString("name");
			String registerTime = manageSet.getString("registerTime");
			String logo = manageSet.getString("logo");
			String state = manageSet.getString("state");
			String password = null;
			Manage manage = new Manage(account, password, name, registerTime, logo, state);
			manages.add(manage);
		}
		return manages;
	}

	@Override
	public void setName(String account, String name) throws SQLException {
		// TODO Auto-generated method stub
		sql = "UPDATE manage set name = ? where account = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, name);
		preparedStatement.setString(2, account);
		preparedStatement.execute();
		return;
	}

	@Override
	public void setLogo(String account, String logo) throws SQLException {
		// TODO Auto-generated method stub
		sql = "UPDATE manage set logo = ? where account = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, logo);
		preparedStatement.setString(2, account);
		preparedStatement.execute();
		return;
	}

}
