package service;

import java.sql.SQLException;
import java.util.Map;

import dao.CommentDao;
import dao.NewsDao;
import dao.impl.CommentDaoImpl;
import dao.impl.NewsDaoImpl;

public class StatisticService {
	private CommentDao commentDao = new CommentDaoImpl();
	private NewsDao newsDao = new NewsDaoImpl();
	public Map<String, String> getCommentMonthSizeByYear(String year) throws SQLException {
		return this.commentDao.getCommentMonthSizeByYear(year);
	}
	public Map<String, String> getNewsMonthSizeByYear(String year) throws SQLException {
		return this.newsDao.getNewsMonthSizeByYear(year);
	}
}
