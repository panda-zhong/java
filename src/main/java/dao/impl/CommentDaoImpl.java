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

import dao.CommentDao;
import pojo.Comment;
import pojo.News;
import pojo.User;
import util.JDBCUtil;

public class CommentDaoImpl implements CommentDao {
	private Connection connect = JDBCUtil.getConnection();
	private String sql = null;
	private PreparedStatement preparedStatement = null;

	@Override
	public void addComment(Comment comment) throws SQLException {
		// TODO Auto-generated method stub
		String context = comment.getContext();
		String userId = comment.getUser().getAccount();
		Date time = comment.getTime();
		Timestamp timestamp = new Timestamp(time.getTime());
		String newsId = comment.getNewsId();
		sql = "INSERT INTO comment(context,userId,time,newsId) VALUES(?,?,?,?)";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, context);
		preparedStatement.setString(2, userId);
		preparedStatement.setTimestamp(3, timestamp);
		preparedStatement.setString(4, newsId);
		preparedStatement.execute();
		return;
	}

	@Override
	public List<Comment> getCommentByNewsId(String newsId) throws SQLException, ParseException {
		// TODO Auto-generated method stub
		sql = "SELECT comment.context as context,comment.userId as userId,"
				+ "comment.time as time,comment.newsId as newsId," + "user.name as name,user.logo as logo FROM comment "
				+ "INNER JOIN user ON comment.userId = user.account " + "WHERE newsId = ? order by time desc";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, newsId);
		ResultSet newsSet = preparedStatement.executeQuery();
		List<Comment> commentList = new ArrayList<Comment>();
		while (newsSet.next()) {
			String context = newsSet.getString("context");
			String userAccount = newsSet.getString("userId");
			String userName = newsSet.getString("name");
			String userLogo = newsSet.getString("logo");
			Timestamp time = newsSet.getTimestamp("time");
			// SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd
			// HH:mm:ss");
			Date toSaveDate = new Date(time.getTime());
			User user = new User(userAccount, userName, userLogo);
			Comment comment = new Comment(context, toSaveDate, newsId, user);
			commentList.add(comment);
		}
		return commentList;
	}

	@Override
	public void modifyComment(Comment oldComment, Comment newComment) throws SQLException {
		// TODO Auto-generated method stub
		String context = newComment.getContext();
		String userId = oldComment.getUser().getAccount();
		long time = oldComment.getTime().getTime();
		Timestamp timestamp = new Timestamp(time);
		sql = "UPDATE comment set context = ? where userId = ? and time = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, context);
		preparedStatement.setString(2, userId);
		preparedStatement.setTimestamp(3, timestamp);
		preparedStatement.execute();
	}

	@Override
	public List<Comment> getCommentByUserId(String userId) throws SQLException, ParseException {
		sql = "SELECT comment.context as context,comment.userId as userId,"
				+ "comment.time as time,comment.newsId as newsId," + "user.name as name,user.logo as logo FROM comment "
				+ "INNER JOIN user ON comment.userId = user.account " + "WHERE userId = ? order by time desc";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, userId);
		ResultSet newsSet = preparedStatement.executeQuery();
		List<Comment> commentList = new ArrayList<Comment>();
		while (newsSet.next()) {
			String context = newsSet.getString("context");
			String userAccount = newsSet.getString("userId");
			String userName = newsSet.getString("name");
			String userLogo = newsSet.getString("logo");
			String newsId = newsSet.getString("newsId");
			Timestamp time = newsSet.getTimestamp("time");
			// SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd
			// HH:mm:ss");
			Date toSaveDate = new Date(time.getTime());
			User user = new User(userAccount, userName, userLogo);
			Comment comment = new Comment(context, toSaveDate, newsId, user);
			commentList.add(comment);
		}
		return commentList;
	}

	@Override
	public String getCommentSize() throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT COUNT(*) as size from comment";
		preparedStatement = connect.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			String size = resultSet.getString("size");
			return size;
		}
		return "0";
	}

	@Override
	public Map<String, String> getCommentMonthSizeByYear(String year) throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT COUNT(*)as size,DATE_FORMAT(time, 'month%m') as month FROM comment "
				+ "WHERE  YEAR(time)=? GROUP BY DATE_FORMAT(time, '%Y-%m')";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, year);
		ResultSet resultSet = preparedStatement.executeQuery();
		HashMap<String, String> comment_month_size = new HashMap<String, String>();
		while (resultSet.next()) {
			String size = resultSet.getString("size");
			String month = resultSet.getString("month");
			comment_month_size.put(month, size);
		}
		return comment_month_size;
	}

	@Override
	public void deleteComment(Comment comment) throws SQLException {
		// TODO Auto-generated method stub
		String userId = comment.getUser().getAccount();
		Date date = comment.getTime();
		Timestamp timestamp = new Timestamp(date.getTime());
		String newsId = comment.getNewsId();
		sql = "DELETE from comment where userId  = ? and time = ? and newsId = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, userId);
		preparedStatement.setTimestamp(2, timestamp);
		preparedStatement.setString(3, newsId);
		preparedStatement.execute();
		return;
	}

}
