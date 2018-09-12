package service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import dao.CommentDao;
import dao.NewsDao;
import dao.NewsDealDao;
import dao.impl.CommentDaoImpl;
import dao.impl.NewsDaoImpl;
import dao.impl.NewsDealDaoImpl;
import pojo.Comment;
import pojo.News;

public class NewsService {
	private NewsDao newsDao = new NewsDaoImpl();
	private NewsDealDao newsDealDao = new NewsDealDaoImpl();
	private CommentDao commentDao = new CommentDaoImpl();

	public void addNewsDraft(News news) throws SQLException {
		this.newsDao.addNewsDraft(news);
		return;
	}

	public String getNextNewsId() throws SQLException {
		return this.newsDao.getNextId();
	}

	public List<News> getAllNews(String newsMakerAccount) throws SQLException, ParseException {
		return this.newsDao.getAllNews(newsMakerAccount);
	}

	public void modiyfyNewsDraft(News oldNews, News newNews) throws SQLException {
		String state = oldNews.getState();
		// null为提交审核 0审核不通过 1审核通过 2待审核
		String dealId = oldNews.getDealId();
		if ("0".equals(state)) {
			// 审核不通过，需要改变NewDeal表的state和publishDate
			this.newsDealDao.setState(dealId, null, null);
		} else if ("1".equals(state)) {
			// 审核通过，只需要改变NewDeal表的state 让它重新待审核
			this.newsDealDao.setState(dealId, null, "2");
		} else {
			// do nothing
		}
		this.newsDao.modiyfyNewsDraft(oldNews.getId(), newNews);
	}

	public List<News> getAllNewsApply() throws SQLException, ParseException {
		String noDealState = "2";
		return this.newsDao.getNewsByState(noDealState);
	}

	public int getNextNewsDealId() throws SQLException {
		return this.newsDealDao.getNextId();
	}

	public void addNewsApply(News news) throws SQLException {
		this.newsDealDao.addNewsApply(news);
	}

	/**
	 * @param dealId
	 * @param dealAccount
	 * @throws SQLException
	 */
	public void acceptNews(String dealId, String dealAccount) throws SQLException {
		String acceptState = "1";
		this.newsDealDao.setState(dealId, dealAccount, acceptState);
	}

	public void refuseNews(String dealId, String dealAccount) throws SQLException {
		String refuseState = "0";
		this.newsDealDao.setState(dealId, dealAccount, refuseState);
	}

	//
	public List<News> getNewsOrderByTime() throws SQLException, ParseException {
		return this.newsDao.getNewsOrderByTime();
	}

	public List<News> getNewsOrderByKind(String kind) throws SQLException, ParseException{
		return this.newsDao.getNewsOrderByKind(kind);
	}
	public void deleteNews(String newId) throws SQLException {
		this.newsDao.deleteNews(newId);
	}

	public void addComment(Comment comment) throws SQLException {
		this.commentDao.addComment(comment);
	}

	public List<Comment> getCommentByNewsId(String newsId) throws SQLException, ParseException {
		return this.commentDao.getCommentByNewsId(newsId);
	}

	public void modifyComment(Comment oldComment, Comment newComment) throws SQLException {
		this.commentDao.modifyComment(oldComment, newComment);
	}
	
	public List<Comment> getCommentByUserId(String newsId) throws SQLException, ParseException{
		return this.commentDao.getCommentByNewsId(newsId);
	}
	
	public String getCommentSize() throws SQLException{
		return this.commentDao.getCommentSize();
	}
	
	public String getNewsSize() throws SQLException{
		return this.newsDao.getNewsSize();
	}
	
	public String getNewsDealSize() throws SQLException {
		return this.newsDealDao.getNewsDealSize();
	}
	
	public List<News> get5NewsOrderByTime(String pageStr) throws SQLException, ParseException {
		String publishState = "1";
		int page = Integer.parseInt(pageStr);
		return this.newsDao.get5NewsOrderByState(publishState,page);
	}
	public List<News> get5NewsDealOrderByTime(String pageStr) throws SQLException, ParseException {
		String noDealState = "2";
		int page = Integer.parseInt(pageStr);
		return this.newsDao.get5NewsOrderByState(noDealState,page);
	}
	
	public void deleteComment(Comment comment) throws SQLException{
		this.commentDao.deleteComment(comment);
	}
	
	
}
