package action.manage;

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

import pojo.ApplyMessage;
import pojo.Comment;
import pojo.Manage;
import pojo.News;
import pojo.NewsMaker;
import pojo.User;
import service.ApplyMessageService;
import service.ManageService;
import service.NewsMakerService;
import service.NewsService;
import service.UserService;

/**
 * @author Berenice
 *
 */
@WebServlet(urlPatterns = "/manage/index/*") 
public class Index extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	PrintWriter pw = null;
	String path = null;
	private ApplyMessageService applyMessageService = new ApplyMessageService();
	private NewsMakerService newsMakerService = new NewsMakerService();
	private UserService userService = new UserService();
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
		case "getApplyMessage":
			try {
				this.getApplyMessageAction(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "getUserSize":
			try {
				this.getUserSize(req,resp);
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			break;
		case "getNewsMakerSize":
			try {
				this.getNewsMakerSize(req,resp);
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			break;
		case "toDealWithApplyMessage":
			try {
				this.toDealWithApplyMessage(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "toManageUser":
			try {
				this.toManageUser(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "toManageNewsMaker":
			try {
				this.toManageNewsMaker(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "getAllCommentSize":
			try {
				this.getAllCommentSize(req,resp);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "toDealNews":
			try {
				this.toDealNewsAction(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "toNewsApply":
			try {
				this.toNewsApply(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "toNewsDetail":
			try {
				this.toNewsDetail(req, resp);
			} catch (SQLException | ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "getNewsSize":
			try {
				this.getNewsSize(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "getNewsDealSize":
			try {
				this.getNewsDealSize(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "get5NewsOrderByPage":
			try {
				this.get5NewsOrderByTime(req,resp);
			} catch (SQLException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "get5NewsDealOrderByPage":
			try {
				this.get5NewsDealOrderByTime(req,resp);
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
	
	private void toNewsDetail(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException, ServletException, IOException {
		// TODO Auto-generated method stub
		List<News> newsList = this.newsService.getNewsOrderByTime();
		String newsId = req.getParameter("newsId");
		for (News news : newsList) {
			if (newsId.equals(news.getId())) {
				List<Comment> commentList = this.newsService.getCommentByNewsId(newsId);
				int commentSize = commentList.size();
				news.setCommentSize(commentSize);
				session.setAttribute("NEWSDETAILINSESSION", news);
				session.setAttribute("COMMENTINSESSION", commentList);
				req.getRequestDispatcher("/jsps/manage/newsDetailView.jsp").forward(req, resp);
				return;
			}
		}
	}

	private void toManageNewsMaker(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		List<NewsMaker> newsMakerList = this.newsMakerService.getAllNewsMakerInfo();
		session.setAttribute("ALLNEWSMAKERINFOINSESSION", newsMakerList);
		req.getRequestDispatcher("/jsps/manage/newsMakerManage.jsp").forward(req, resp);
	}

	private void toManageUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		List<User> userList = this.userService.getAllUserInfo();
		session.setAttribute("ALLUSERINFOINSESSION", userList);
//		resp.sendRedirect(path+"/jsps/manage/manageAccount.jsp");
		req.getRequestDispatcher("/jsps/manage/userManage.jsp").forward(req, resp);
	}

	private void toNewsApply(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException, ServletException, IOException {
		// TODO Auto-generated method stub
		List<News> newsApplyList = this.newsService.getAllNewsApply();
		session.setAttribute("NEWSAPPLTINSESSION", newsApplyList);
		req.getRequestDispatcher("/jsps/manage/newsApply.jsp").forward(req, resp);
	}

	private void get5NewsDealOrderByTime(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException {
		// TODO Auto-generated method stub
		String page = req.getParameter("page");
		List<News> newsDealList = this.newsService.get5NewsDealOrderByTime(page);
		String newsDealListJson = JSONObject.toJSONString(newsDealList);
		pw.print(newsDealListJson);
		return;
	}

	private void get5NewsOrderByTime(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException {
		// TODO Auto-generated method stub
		String page = req.getParameter("page");
		List<News> newsList = this.newsService.get5NewsOrderByTime(page);
		String newsListJson = JSONObject.toJSONString(newsList);
		pw.print(newsListJson);
		return;
	}

	private void getNewsDealSize(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String size = this.newsService.getNewsDealSize();
		System.out.println("NewsDealSize:"+size);
		pw.print(size);
		return;
	}

	private void getNewsMakerSize(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String size = this.newsMakerService.getNewsMakerSize();
		System.out.println("NewsMakerSize:"+size);
		pw.print(size);
		return;
	}

	private void getUserSize(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String size = this.userService.getUserSize();
		System.out.println("UserSize:"+size);
		pw.print(size);
		return;
	}

	private void getNewsSize(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String size = this.newsService.getNewsSize();
		System.out.println("NewsSize:"+size);
		pw.print(size);
		return;
	}

	
	private void getAllCommentSize(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String size = this.newsService.getCommentSize();
		System.out.println("CommentSize:"+size);
		pw.print(size);
		return;
	}

	private void toDealNewsAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ParseException, ServletException, IOException {
		// TODO Auto-generated method stub
		String page = "1";
		session.setAttribute("NEWSPAGEINSESSION", page);
		List<News> newsDealList = this.newsService.get5NewsOrderByTime(page);
		session.setAttribute("NEWSBYPAGEINSESSION", newsDealList);
		req.getRequestDispatcher("/jsps/manage/manageNews.jsp").forward(req, resp);
	}


	private void toDealWithApplyMessage(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		List<ApplyMessage> messages = this.applyMessageService.getAllApplyMessage();
		session.setAttribute("APPLYMESSAGEINSESSION", messages);
		req.getRequestDispatcher("/jsps/manage/accountApply.jsp").forward(req, resp);
	}

	private void getApplyMessageAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		int size = this.applyMessageService.getApplyMessageSize();
		pw.print(size);
	}
}
