package action.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Comment;
import pojo.News;
import pojo.User;
import service.NewsService;

@WebServlet(urlPatterns="/user/index/*")
public class Index extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	PrintWriter pw = null;
	String path = null;
	private NewsService newsService = new NewsService();
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String action = uri.substring(uri.lastIndexOf('/') + 1);
		session = req.getSession();
		path = req.getContextPath();
		pw = resp.getWriter();
		System.out.println(uri);
		switch (action) {
		case "comment":
			try {
				this.commentNewsAction(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "modifyComment":
			try {
				this.modifyComment(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		case "getMyComment":
			try {
				this.getMyComment(req,resp);
			} catch (SQLException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		default:
			break;
		}
	}

	private void getMyComment(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException {
		// TODO Auto-generated method stub
		User user = (User) session.getAttribute("USERINSESSION");
		String userAccount = user.getAccount();
		List<Comment> myCommentList = this.newsService.getCommentByUserId(userAccount);
		session.setAttribute("MYCOMMENTLISTINSESSION", myCommentList);
	}

	private void modifyComment(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		News news = (News) session.getAttribute("NEWSDETAILINSESSION");
		String newsId = news.getId();
		String userId = req.getParameter("userId");
		String newContext = req.getParameter("context");
		User user = new User();
		user.setAccount(userId);
		String time = req.getParameter("commentTime");
		Date date = new Date(Long.parseLong(time));
		Comment oldComment = new Comment(date, newsId, user);
		Comment newComment = new Comment(newContext, date, newsId, user);
		this.newsService.modifyComment(oldComment, newComment);
		pw.print(true);
	}

	private void commentNewsAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		// TODO Auto-generated method stub
		User user = (User) session.getAttribute("USERINSESSION");
		String context = req.getParameter("context");
		News news = (News) session.getAttribute("NEWSDETAILINSESSION");
		Date date = new Date();
		String newsId = news.getId();
		Comment comment = new Comment(context, date, newsId, user);
		this.newsService.addComment(comment);
		resp.sendRedirect(path+"/news/index/getById?newsId="+newsId);
	}
	
	

}
