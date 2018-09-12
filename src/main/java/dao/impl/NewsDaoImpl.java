package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.NewsDao;
import pojo.Manage;
import pojo.News;
import util.JDBCUtil;

public class NewsDaoImpl implements NewsDao {
	private Connection connect = JDBCUtil.getConnection();
	private String sql = null;
	private PreparedStatement preparedStatement = null;

	@Override
	public void addNewsDraft(News news) throws SQLException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String newsAuthor = news.getNewsAuthor();
		String newsTitle = news.getNewsTitle();
		String savePath = news.getSavePath();
		String newsMakerAccount = news.getNewsMakerAccount();
		long saveDate = news.getSaveDate().getTime();
		String kind = news.getKind();
		String titleImage = news.getTitleImage();
		Timestamp timestamp = new Timestamp(saveDate);
		// 获得保存时间戳
		sql = "insert INTO news(newsAuthor,newsTitle,savePath,saveDate,newsMakerAccount,kind,titleImage) VALUES(?,?,?,?,?,?,?);";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, newsAuthor);
		preparedStatement.setString(2, newsTitle);
		preparedStatement.setString(3, savePath);
		preparedStatement.setTimestamp(4, timestamp);
		preparedStatement.setString(5, newsMakerAccount);
		preparedStatement.setString(6, kind);
		preparedStatement.setString(7, titleImage);
		preparedStatement.execute();
		return;
	}

	@Override
	public String getNextId() throws SQLException {
		sql = "SELECT MAX(id)as maxId FROM news";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			String maxIdStr = resultSet.getString("maxId");
			int nextId = Integer.parseInt(maxIdStr) + 1;
			return nextId + "";
		}
		return "1";
	}

	@Override
	public List<News> getAllNews(String newsMakerAccount) throws SQLException, ParseException {
		// TODO Auto-generated method stub
		sql = "SELECT news.newsAuthor as newsAuthor, news.newsTitle as newsTitle, "
				+ "news.savePath as savePath, news.saveDate as saveDate,"
				+ "news.newsMakerAccount as newsMakerAccount,news.kind as kind, news.id as id, "
				+ "news.titleImage as titleImage,newsdeal.state as state,newsdeal.publishDate as publishDate,"
				+ "newsdeal.dealId as  dealId FROM news "
				+ "left JOIN newsdeal ON news.id = newsdeal.newsId where newsMakerAccount = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, newsMakerAccount);
		ResultSet newsSet = preparedStatement.executeQuery();
		List<News> newsList = new ArrayList<News>();
		while (newsSet.next()) {
			String newsAuthor = newsSet.getString("newsAuthor");
			String newsTitle = newsSet.getString("newsTitle");
			String savePath = newsSet.getString("savePath");
			String kind = newsSet.getString("kind");
			String id = newsSet.getString("id");
			String titleImage = newsSet.getString("titleImage");
			String state = newsSet.getString("state");
			String publishDate = newsSet.getString("publishDate");
			String dealId = newsSet.getString("dealId");
			Timestamp timestamp = newsSet.getTimestamp("saveDate");
			Date toSaveDate = new Date(timestamp.getTime());
			News news = new News(newsAuthor, newsTitle, newsMakerAccount, savePath, toSaveDate, kind, id, titleImage);
			news.setState(state);
			news.setPublishDate(publishDate);
			news.setDealId(dealId);
			newsList.add(news);
		}
		return newsList;
	}

	@Override
	public void modiyfyNewsDraft(String newsId, News news) throws SQLException {
		// TODO Auto-generated method stub
		String newsAuthor = news.getNewsAuthor();
		String newsTitle = news.getNewsTitle();
		String savePath = news.getSavePath();
		String newsMakerAccount = news.getNewsMakerAccount();
		long saveDate = news.getSaveDate().getTime();
		String kind = news.getKind();
		String titleImage = news.getTitleImage();
		Timestamp timestamp = new Timestamp(saveDate);
		// 获得保存时间戳
		sql = "UPDATE news set newsAuthor= ?,newsTitle=?,savePath=? , " + "saveDate = ?, newsMakerAccount=?, kind=? , "
				+ "titleImage=? where id = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, newsAuthor);
		preparedStatement.setString(2, newsTitle);
		preparedStatement.setString(3, savePath);
		preparedStatement.setTimestamp(4, timestamp);
		preparedStatement.setString(5, newsMakerAccount);
		preparedStatement.setString(6, kind);
		preparedStatement.setString(7, titleImage);
		preparedStatement.setString(8, newsId);
		preparedStatement.execute();
		return;
	}

	@Override
	public List<News> getNewsByState(String state) throws SQLException, ParseException {
		// TODO Auto-generated method stub
		sql = "SELECT newsdeal.state AS state, newsdeal.publishDate AS publishDate,"
				+ "news.newsAuthor AS newsAuthor, news.newsTitle AS newsTitle, "
				+ "news.savePath AS savePath,news.id as id,news.saveDate AS saveDate,"
				+ "news.newsMakerAccount AS newsMakerAccount,news.kind AS kind,"
				+ "news.titleImage AS titleImage,newsdeal.newsId AS newsId, newsdeal.dealId AS dealId "
				+ "FROM newsdeal " + "left JOIN news ON newsdeal.newsId = news.id WHERE state = ?"
				+ "ORDER BY publishDate";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, state);
		ResultSet newsSet = preparedStatement.executeQuery();
		List<News> newsList = new ArrayList<News>();
		while (newsSet.next()) {
			String newsAuthor = newsSet.getString("newsAuthor");
			String newsTitle = newsSet.getString("newsTitle");
			String savePath = newsSet.getString("savePath");
			String kind = newsSet.getString("kind");
			String id = newsSet.getString("id");
			String newsMakerAccount = newsSet.getString("newsMakerAccount");
			String titleImage = newsSet.getString("titleImage");
			String publishDate = newsSet.getString("publishDate");
			String dealId = newsSet.getString("dealId");
			Timestamp timestamp = newsSet.getTimestamp("saveDate");
			Date toSaveDate = new Date(timestamp.getTime());
			News news = new News(newsAuthor, newsTitle, newsMakerAccount, savePath, toSaveDate, kind, id, titleImage);
			news.setState(state);
			news.setPublishDate(publishDate);
			news.setDealId(dealId);
			newsList.add(news);
		}
		return newsList;
	}

	@Override
	public List<News> getNewsOrderByTime() throws SQLException, ParseException {
		// TODO Auto-generated method stub
		sql = "SELECT news.newsAuthor as newsAuthor," + "news.newsTitle as newsTitle,news.savePath as savePath,"
				+ "news.saveDate as saveDate,news.newsMakerAccount as newsMakerAccount, news.kind as kind,"
				+ "news.id as id,newsdeal.state as state ,newsdeal.publishDate as publishDate,newsDeal.dealId as dealId,"
				+ "news.titleImage as titleImage FROM news "
				+ "INNER JOIN newsdeal ON newsdeal.newsId = news.id WHERE state = 1 " + "ORDER BY publishDate";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet newsSet = preparedStatement.executeQuery();
		List<News> newsList = new ArrayList<News>();
		while (newsSet.next()) {
			String newsAuthor = newsSet.getString("newsAuthor");
			String newsTitle = newsSet.getString("newsTitle");
			String savePath = newsSet.getString("savePath");
			String kind = newsSet.getString("kind");
			String id = newsSet.getString("id");
			String newsMakerAccount = newsSet.getString("newsMakerAccount");
			String titleImage = newsSet.getString("titleImage");
			String newsState = newsSet.getString("state");
			String publishDate = newsSet.getString("publishDate");
			String dealId = newsSet.getString("dealId");
			Timestamp timestamp = newsSet.getTimestamp("saveDate");
			Date toSaveDate = new Date(timestamp.getTime());
			News news = new News(newsAuthor, newsTitle, newsMakerAccount, savePath, toSaveDate, kind, id, titleImage);
			news.setState(newsState);
			news.setPublishDate(publishDate);
			news.setDealId(dealId);
			newsList.add(news);
		}
		return newsList;
	}

	@Override
	public void deleteNews(String newId) throws SQLException {
		// TODO Auto-generated method stub
		sql = "DELETE from news where id  = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, newId);
		preparedStatement.execute();
		return;
	}

	@Override
	public List<News> getNewsOrderByKind(String kind) throws SQLException, ParseException {
		// TODO Auto-generated method stub
		sql = "SELECT news.newsAuthor as newsAuthor," + "news.newsTitle as newsTitle,news.savePath as savePath,"
				+ "news.saveDate as saveDate,news.newsMakerAccount as newsMakerAccount, news.kind as kind,"
				+ "news.id as id,newsdeal.state as state ,newsdeal.publishDate as publishDate,newsDeal.dealId as dealId,"
				+ "news.titleImage as titleImage FROM news "
				+ "INNER JOIN newsdeal ON newsdeal.newsId = news.id WHERE state = 1 and kind = ?"
				+ "ORDER BY publishDate";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, kind);
		ResultSet newsSet = preparedStatement.executeQuery();
		List<News> newsList = new ArrayList<News>();
		while (newsSet.next()) {
			String newsAuthor = newsSet.getString("newsAuthor");
			String newsTitle = newsSet.getString("newsTitle");
			String savePath = newsSet.getString("savePath");
			String id = newsSet.getString("id");
			String newsMakerAccount = newsSet.getString("newsMakerAccount");
			String titleImage = newsSet.getString("titleImage");
			String newsState = newsSet.getString("state");
			String publishDate = newsSet.getString("publishDate");
			String dealId = newsSet.getString("dealId");
			Timestamp timestamp = newsSet.getTimestamp("saveDate");
			Date toSaveDate = new Date(timestamp.getTime());
			News news = new News(newsAuthor, newsTitle, newsMakerAccount, savePath, toSaveDate, kind, id, titleImage);
			news.setState(newsState);
			news.setPublishDate(publishDate);
			news.setDealId(dealId);
			newsList.add(news);
		}
		return newsList;
	}

	@Override
	public String getNewsSize() throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT newsdeal.state as state,COUNT(*) AS size "
				+ " FROM news INNER JOIN newsdeal ON newsdeal.newsId = news.id "
				+ "WHERE state = 1";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			String size = resultSet.getString("size");
			return size;
		}
		return "0";
	}


	@Override
	public List<News> get5NewsOrderByState(String state,int page) throws SQLException, ParseException {
		// TODO Auto-generated method stub
		sql = "SELECT news.newsAuthor as newsAuthor," + "news.newsTitle as newsTitle,news.savePath as savePath,"
				+ "news.saveDate as saveDate,news.newsMakerAccount as newsMakerAccount, news.kind as kind,"
				+ "news.id as id,newsdeal.state as state ,newsdeal.publishDate as publishDate,newsDeal.dealId as dealId,"
				+ "news.titleImage as titleImage FROM news "
				+ "INNER JOIN newsdeal ON newsdeal.newsId = news.id WHERE state = ? " + "ORDER BY publishDate  LIMIT ?,5";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, state);
		int begin = (page-1)*5;
		preparedStatement.setInt(2, begin);
		ResultSet newsSet = preparedStatement.executeQuery();
		List<News> newsList = new ArrayList<News>();
		while (newsSet.next()) {
			String newsAuthor = newsSet.getString("newsAuthor");
			String newsTitle = newsSet.getString("newsTitle");
			String savePath = newsSet.getString("savePath");
			String kind = newsSet.getString("kind");
			String id = newsSet.getString("id");
			String newsMakerAccount = newsSet.getString("newsMakerAccount");
			String titleImage = newsSet.getString("titleImage");
			String newsState = newsSet.getString("state");
			String publishDate = newsSet.getString("publishDate");
			String dealId = newsSet.getString("dealId");
			Timestamp timestamp = newsSet.getTimestamp("saveDate");
			Date toSaveDate = new Date(timestamp.getTime());
			News news = new News(newsAuthor, newsTitle, newsMakerAccount, savePath, toSaveDate, kind, id, titleImage);
			news.setState(newsState);
			news.setPublishDate(publishDate);
			news.setDealId(dealId);
			newsList.add(news);
		}
		return newsList;
	}

	@Override
	public Map<String, String> getNewsMonthSizeByYear(String year) throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT COUNT(*)as size,DATE_FORMAT(publishDate, 'month%m') as month FROM newsdeal WHERE  YEAR(publishDate)=? AND state = 1 GROUP BY DATE_FORMAT(publishDate, '%Y-%m')";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, year);
		ResultSet resultSet = preparedStatement.executeQuery();
		HashMap<String, String> news_month_size = new HashMap<String, String>();
		while (resultSet.next()) {
			String size = resultSet.getString("size");
			String month  = resultSet.getString("month");
			news_month_size.put(month, size);
		}
		return news_month_size;
	}

}
