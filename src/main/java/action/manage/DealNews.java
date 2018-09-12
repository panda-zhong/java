package action.manage;

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
import pojo.Manage;
import pojo.News;
import pojo.User;
import service.NewsService;

/**
 * @author Berenice
 *
 */
@WebServlet(urlPatterns = "/manage/dealNews/*") 
public class DealNews extends HttpServlet {

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
		case "accept":
			try {
				this.acceptNewAction(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "refuse":
			try {
				this.refuseNewAction(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "deleteComment":
			try {
				this.deleteCommentAction(req,resp);
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			break;
		case "delete":
			try {
				this.deleteNewsAction(req,resp);
			} catch (SQLException | ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "getNewsByPage":
			try {
				this.getNewsByPage(req,resp);
			} catch (SQLException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "getNextPageNews":
			try {
				this.getNextPageNews(req,resp);
			} catch (SQLException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "reflashPageNews":
			try {
				this.reflashPageNews(req,resp);
			} catch (SQLException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
		return;
	}

	private void deleteCommentAction(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		// TODO Auto-generated method stub
		String newsId  = req.getParameter("newsId");
		String userId = req.getParameter("userId");
		String time = req.getParameter("time");
		User user = new User();
		user.setAccount(userId);
		Date date = new Date(Long.parseLong(time));
		Comment comment = new Comment(date, newsId, user);
		this.newsService.deleteComment(comment);
		resp.sendRedirect(path+"/manage/index/toNewsDetail?newsId="+newsId+"#pn");
	}

	private void reflashPageNews(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException, ServletException, IOException {
		// TODO Auto-generated method stub
		String page = (String) session.getAttribute("NEWSPAGEINSESSION");
		List<News> newsDealList = this.newsService.get5NewsOrderByTime(page);
		session.setAttribute("NEWSBYPAGEINSESSION", newsDealList);
		req.getRequestDispatcher("/jsps/manage/manageNews.jsp").forward(req, resp);
	}


	private void getNextPageNews(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException, ServletException, IOException {
		// TODO Auto-generated method stub
		String page = (String) session.getAttribute("NEWSPAGEINSESSION");
		int nextPage = Integer.parseInt(page)+1;
		session.setAttribute("NEWSPAGEINSESSION", nextPage+"");
		List<News> newsDealList = this.newsService.get5NewsOrderByTime(nextPage+"");
		session.setAttribute("NEWSBYPAGEINSESSION", newsDealList);
		req.getRequestDispatcher("/jsps/manage/manageNews.jsp").forward(req, resp);
	}

	private void getNewsByPage(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException, ServletException, IOException {
		// TODO Auto-generated method stub
		String page = req.getParameter("page");
		session.setAttribute("NEWSPAGEINSESSION", page);
		List<News> newsDealList = this.newsService.get5NewsOrderByTime(page);
		session.setAttribute("NEWSBYPAGEINSESSION", newsDealList);
		req.getRequestDispatcher("/jsps/manage/manageNews.jsp").forward(req, resp);
	}

	private void deleteNewsAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ParseException, ServletException {
		// TODO Auto-generated method stub
		String newsId = req.getParameter("newsId");
		this.newsService.deleteNews(newsId);
		this.reflashPageNews(req, resp);
		
	}

	private void refuseNewAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		// TODO Auto-generated method stub
		Manage dealManage = (Manage) session.getAttribute("MANAGEINSESSION");
		String dealAccount = dealManage.getAccount();
		String dealId = req.getParameter("newDealId");
		if(dealAccount==""||dealId == ""){
			pw.print(false);
			return;
		}
		this.newsService.refuseNews(dealId, dealAccount);
		resp.sendRedirect(path+"/manage/index/toNewsApply");
	}

	private void acceptNewAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		// TODO Auto-generated method stub
		Manage dealManage = (Manage) session.getAttribute("MANAGEINSESSION");
		String dealAccount = dealManage.getAccount();
		String dealId = req.getParameter("newDealId");
		if(dealAccount==""||dealId == ""){
			pw.print(false);
			return;
		}
		this.newsService.acceptNews(dealId, dealAccount);
		resp.sendRedirect(path+"/manage/index/toNewsApply");
	}
}
