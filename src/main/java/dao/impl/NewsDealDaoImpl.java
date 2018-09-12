package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import dao.NewsDealDao;
import pojo.News;
import util.JDBCUtil;

public class NewsDealDaoImpl implements NewsDealDao {
	private Connection connect = JDBCUtil.getConnection();
	private String sql = null;
	private PreparedStatement preparedStatement = null;

	@Override
	public void addNewsApply(News news) throws SQLException {
		// TODO Auto-generated method stub
		sql = "INSERT INTO newsdeal(newsId,dealId,publishDate,state) VALUES(?,?,?,?)";
		preparedStatement = connect.prepareStatement(sql);
		String newsId = news.getId();
		String newsDealId = news.getDealId();
		String Nowtime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		java.sql.Date mysqldate = java.sql.Date.valueOf(Nowtime);
		String noDealstate = "2";
		preparedStatement.setString(1, newsId);
		preparedStatement.setString(2, newsDealId);
		preparedStatement.setDate(3, mysqldate);
		preparedStatement.setString(4, noDealstate);
		preparedStatement.execute();
		return;
	}

	@Override
	public int getNextId() throws SQLException {
		sql = "SELECT MAX(dealId)as maxId FROM newsDeal";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			String maxIdStr = resultSet.getString("maxId");
			int nextId = Integer.parseInt(maxIdStr) + 1;
			return nextId;
		}
		return 0;
	}

	@Override
	public void setState(String dealId, String dealAccount, String state) throws SQLException {
		// TODO Auto-generated method stub
		sql = "UPDATE newsdeal set state = ?,dealAccount = ? where dealId = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, state);
		preparedStatement.setString(2, dealAccount);
		preparedStatement.setString(3, dealId);
		preparedStatement.execute();
		return;
	}

	@Override
	public String getNewsDealSize() throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT COUNT(*) as size FROM newsdeal where state = 2";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			String size = resultSet.getString("size");
			return size;
		}
		return "0";
	}
}
