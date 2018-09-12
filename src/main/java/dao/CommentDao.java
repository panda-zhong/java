package dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import pojo.Comment;

public interface CommentDao {
	public void addComment(Comment comment) throws SQLException;
	public List<Comment> getCommentByNewsId(String newsId) throws SQLException, ParseException;
	public void modifyComment(Comment oldComment,Comment newComment) throws SQLException;
	public List<Comment> getCommentByUserId(String newsId) throws SQLException, ParseException;
	public String getCommentSize() throws SQLException;
	public Map<String, String> getCommentMonthSizeByYear(String year) throws SQLException;
	public void deleteComment(Comment comment) throws SQLException;
}
