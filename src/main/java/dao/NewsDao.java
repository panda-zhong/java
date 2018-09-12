package dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import pojo.News;

public interface NewsDao {
	public void addNewsDraft(News news) throws SQLException;
	public  String getNextId() throws SQLException;
	public List<News> getAllNews(String newsMakerAccount) throws SQLException, ParseException;
	public void modiyfyNewsDraft(String newsId,News news) throws SQLException;
	public List<News> getNewsByState(String state) throws SQLException, ParseException;
	public List<News> getNewsOrderByTime() throws SQLException, ParseException;
	public List<News> get5NewsOrderByState(String state,int begin) throws SQLException, ParseException;
	public List<News> getNewsOrderByKind(String kind) throws SQLException, ParseException;
	public void deleteNews(String newId) throws SQLException;
	public String getNewsSize() throws SQLException;
	public Map<String, String> getNewsMonthSizeByYear(String year) throws SQLException;
//	public List<News> getNews5Apply() throws SQLException, ParseException;
}
