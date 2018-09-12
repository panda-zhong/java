package action.news;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

import pojo.Comment;
import pojo.News;
import service.NewsService;

@WebServlet(urlPatterns="/news/index/*") 
public class Index extends HttpServlet{
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
		case "all":
			try {
				this.getAllNewsAction(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "getById":
			try {
				this.getNewsById(req,resp);
			} catch (SQLException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "getByKind":
			try {
				this.getNewsByKind(req,resp);
			} catch (SQLException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
	}

	private void getNewsByKind(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException, ServletException, IOException {
		// TODO Auto-generated method stub
		String kind = req.getParameter("kind");
		List<News> newsList = this.newsService.getNewsOrderByKind(kind);
		session.setAttribute("NEWORDERBYTIMEANDKINDINSESSION", newsList);
		req.getRequestDispatcher("/jsps/user/newsByKind.jsp").forward(req, resp);
	}

	private void getNewsById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ParseException {
		// TODO Auto-generated method stub
		String newsId = req.getParameter("newsId");
		List<News> newsList = (List<News>) session.getAttribute("NEWORDERBYTIMEINSESSION");
		for (News news : newsList) {
			if (newsId.equals(news.getId())) {
				List<Comment> commentList = this.newsService.getCommentByNewsId(newsId);
				int commentSize = commentList.size();
				news.setCommentSize(commentSize);
				session.setAttribute("NEWSDETAILINSESSION", news);
				session.setAttribute("COMMENTINSESSION", commentList);
				req.getRequestDispatcher("/jsps/user/newsDetail.jsp").forward(req, resp);
				return;
			}
		}
	}

	private void getAllNewsAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException, IOException {
		// TODO Auto-generated method stub
		List<News> newsList = this.newsService.getNewsOrderByTime();
		session.setAttribute("NEWORDERBYTIMEINSESSION", newsList);
		String newsListJson = JSONObject.toJSONString(newsList);
		pw.print(newsListJson);
	}
}
