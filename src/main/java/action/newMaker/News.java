package action.newMaker;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import pojo.Manage;
import pojo.NewsMaker;
import pojo.User;
import service.NewsService;

@WebServlet(urlPatterns = "/newsMaker/news/*") 
public class News extends HttpServlet {
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
		// TODO Auto-generated method stub
		String uri = req.getRequestURI();
		String action = uri.substring(uri.lastIndexOf('/') + 1);
		session = req.getSession();
		path = req.getContextPath();
		pw = resp.getWriter();
		System.out.println(uri);
		switch (action) {
		case "addToDraft":
			try {
				this.addNewsAction(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		case "modifyDraft":
			try {
				this.modifyNewsAction(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "toReviewNews":
			try {
				this.toManageReviewNewsAction(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "delete":
			try {
				this.deleteNewsAction(req,resp);
			} catch (SQLException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		default:
			break;

		}
		return;
	}

	/**
	 * @param req
	 * @param resp
	 * @see 此处做session判断是否删除的newsId在本人的newList里面
	 * @throws SQLException
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	private void deleteNewsAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException, ParseException {
		// TODO Auto-generated method stub
		List<pojo.News> myNewsList = (List<pojo.News>) session.getAttribute("MYNEWSINSESSION");
		String newsId = req.getParameter("newsId");
		for (pojo.News news : myNewsList) {
			if(news.getId().equals(newsId)){
				this.newsService.deleteNews(newsId);
				pw.print(true);
			}
		}
		pw.print(false);
		resp.sendRedirect(path+"/newsMaker/index/myNews");
	}

	private void toManageReviewNewsAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		int dealId = this.newsService.getNextNewsDealId();
		String newsId = req.getParameter("newsId");
		pojo.News reviewNews = new pojo.News();
		reviewNews.setDealId(dealId + "");
		reviewNews.setId(newsId);
		this.newsService.addNewsApply(reviewNews);
		pw.print(true);
	}

	private void modifyNewsAction(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		pojo.News modifyNew = (pojo.News) session.getAttribute("MODIFYNEWSINSESSON");
		pojo.News newNews = this.saveNews(req, modifyNew);
		this.newsService.modiyfyNewsDraft(modifyNew, newNews);
		req.getRequestDispatcher("/newsMaker/index/myNews").forward(req, resp);
	}

	/**
	 * @param req
	 * @return
	 * @see 通过请求获得新闻并保存在本地
	 * @throws SQLException
	 * @throws IOException
	 */
	private pojo.News saveNews(HttpServletRequest req, pojo.News modifyNews) throws SQLException, IOException {
		// TODO Auto-generated method stub
		NewsMaker newsMaker = (NewsMaker) session.getAttribute("NEWSMAKERINSESSION");
		if (newsMaker == null) {
			pw.print(false);
			return null;
		}
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
		List<FileItem> list = null;
		try {
			list = fileUpload.parseRequest(req);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<String, String> formFieldMap = new HashMap<String, String>();
		String filePath = null;
		String fileName = null;
		Date now = Calendar.getInstance().getTime();
		String newsId = modifyNews.getId();
		// String nowTimeToFile = new SimpleDateFormat("YYYY-MM-dd
		// HH-mm-ss").format(now);
		String account = newsMaker.getAccount();
		for (FileItem fileItem : list) {
			if (fileItem.isFormField()) {
				formFieldMap.put(fileItem.getFieldName(), new String(fileItem.getString("UTF-8").getBytes(), "UTF-8"));
			} else {
				if (fileItem.getName() == "") {
					if (modifyNews.getTitleImage() != null) {
						fileName = new String(modifyNews.getTitleImage());
					} else {
						fileName = "news.jpg";
					}
					continue;
				}
				fileName = fileItem.getName().substring(fileItem.getName().lastIndexOf('.'));
				// 获得图片格式类型
				fileName = account + newsId + fileName;
				// 图片存放为用户账号
				filePath = "D:/panda/data/TomcatPicture/" + fileName;
				File file = new File(filePath);
				if (!file.exists()) {
					file.createNewFile();
				}
				System.out.println(file.getAbsolutePath());
				try {
					fileItem.write(file);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		for (String keySet : formFieldMap.keySet()) {
			System.out.println(keySet + ":" + formFieldMap.get(keySet));
		}
		String newsText = formFieldMap.get("newsText");
		String newsTitle = formFieldMap.get("newsTitle");
		String newsAuthor = formFieldMap.get("newsAuthor");
		String kind = formFieldMap.get("newsKind");
		// 1 科技 2 军事 3 体育 4 娱乐 5 政治
		String titleImage = fileName;
		String pcPath = "D:/panda/data/TomcatText/";
		String accountPath = pcPath + account + "/";
		File file = new File(accountPath);
		if (!file.exists()) {
			file.mkdir();
		}
		String savePath = accountPath + "/" + newsId + ".html";
		this.saveAsFileWriter(newsText, savePath);
		String sqlSavePath = account + "/" + newsId + ".html";
		pojo.News news = new pojo.News(newsAuthor, newsTitle, account, sqlSavePath, now, kind, newsId, titleImage);
		return news;
	}

	/**
	 * @param req
	 * @param resp
	 * @author Berenice
	 * @see 添加新闻到数据库
	 * @throws IOException
	 * @throws SQLException
	 * @throws ServletException
	 */
	private void addNewsAction(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, SQLException, ServletException {
		// TODO Auto-generated method stub
		String newsId = this.newsService.getNextNewsId();
		pojo.News newNews = new pojo.News();
		newNews.setId(newsId);
		pojo.News news = this.saveNews(req, newNews);
		this.newsService.addNewsDraft(news);
		pw.print(true);
		resp.sendRedirect(path+"/newsMaker/index/myNews");
//		req.getRequestDispatcher("/newsMaker/index/myNews").forward(req, resp);
	}

	private void saveAsFileWriter(String content, String saveFile) throws IOException {
		FileWriter fwriter = null;
		File file = new File(saveFile);
		if (!file.exists()) {
			file.createNewFile();
		}
		fwriter = new FileWriter(file);
		fwriter.write(content);
		fwriter.flush();
		fwriter.close();
	}
}
