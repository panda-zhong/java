package action.manage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

import service.StatisticService;
import service.UserService;


@WebServlet(urlPatterns = "/manage/statistics/*")
public class Statistics extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	PrintWriter pw = null;
	String path = null;
	private StatisticService statisticService = new StatisticService();
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String uri = req.getRequestURI();
		String action = uri.substring(uri.lastIndexOf('/') + 1);
		session = req.getSession();
		path = req.getContextPath();
		pw = resp.getWriter();
		System.out.println(uri);
		switch (action) {
		case "getCommentSizeByMonth":
			try {
				this.getCommentSizeByMonth(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "getNewsSizeByMonth":
			try {
				this.getNewsSizeByMonth(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "prepareFile":
			try {
				this.prepareFileAction(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
		return;
	}

	private void prepareFileAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		// TODO Auto-generated method stub
		this.statisticService.prepareStisticCommentFile();
	}

	private void getNewsSizeByMonth(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String year = req.getParameter("year");
		Map<String, String> news_month_size = this.statisticService.getNewsMonthSizeByYear(year);
		String sizeJson = JSONObject.toJSONString(news_month_size);
		pw.print(sizeJson);
		return;
	}

	private void getCommentSizeByMonth(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String year = req.getParameter("year");
		Map<String, String> comment_month_size = this.statisticService.getCommentMonthSizeByYear(year);
		String sizeJson = JSONObject.toJSONString(comment_month_size);
		pw.print(sizeJson);
		return;
	}

}
