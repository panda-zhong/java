package action.newMaker;

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

import pojo.ApplyMessage;
import pojo.News;
import pojo.NewsMaker;
import service.ApplyMessageService;
import service.NewsService;

@WebServlet(urlPatterns="/newsMaker/index/*")
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
		case "myNews":
			try {
				this.toMyNewsAction(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "toModifyNews":
			this.toModifyNewsAction(req, resp);
			break;
		default:
			break;
		}
	}

	private void toModifyNewsAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		List<News> newsList = (List<News>) session.getAttribute("MYNEWSINSESSION");
		for (News news : newsList) {
			if(news.getId().equals(id)){
				session.setAttribute("MODIFYNEWSINSESSON", news);
				req.getRequestDispatcher("/jsps/newsMaker/modifyNews.jsp").forward(req, resp);
				return;
			}
		}
		pw.print(false);
		
	}
	private void toMyNewsAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException, ServletException, IOException {
		// TODO Auto-generated method stub
		NewsMaker newsMaker = (NewsMaker) session.getAttribute("NEWSMAKERINSESSION");
		String newsMakerAccount = newsMaker.getAccount();
		List<News> newsList = this.newsService.getAllNews(newsMakerAccount);
		session.setAttribute("MYNEWSINSESSION", newsList);
		req.getRequestDispatcher("/jsps/newsMaker/myNews.jsp").forward(req, resp);
	}

}
