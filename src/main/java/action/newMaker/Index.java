package action.newMaker;

import static org.junit.Assert.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;

import pojo.ApplyMessage;
import pojo.News;
import pojo.NewsMaker;
import service.ApplyMessageService;
import service.NewsService;
import util.EMailTool;
import util.EmailUtil;

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
		case "getEmailCode":
			try {
				this.getEmailCodeAction(req, resp);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
	}

	private void getEmailCodeAction(HttpServletRequest req, HttpServletResponse resp) throws MessagingException {
		// TODO Auto-generated method stub
		String email = "287595523@qq.com";
		int code = (int) (Math.random()*899999+100000);//100000~999999
		EmailUtil.sendCodeEmail(email, code+"");
		session.setAttribute("PASSWORDCODE", code);
		pw.print(code);
	}

	private void toModifyNewsAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		List<News> newsList = (List<News>) session.getAttribute("MYNEWSINSESSION");
		for (News news : newsList) {
			if(news.getId().equals(id)){
				session.setAttribute("MODIFYNEWSINSESSON", news);
				resp.sendRedirect(path+"/jsps/newsMaker/modifyNews.jsp");
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
		resp.sendRedirect(path+"/jsps/newsMaker/myNews.jsp");
	}

}
