package action.manage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.ManageService;
import service.NewsMakerService;
import service.UserService;

/**
 * @author Berenice
 *
 */
@WebServlet(urlPatterns = "/manage/manageAccount/*")
public class ManageAccount extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	PrintWriter pw = null;
	String path = null;
	private UserService userService = new UserService(); 
	private NewsMakerService newsMakerservice = new NewsMakerService();
	private ManageService manageService = new ManageService();
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
		case "disableUserAccount":
			try {
				this.disableUserAccount(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "enableUserAccount":
			try {
				this.enableUserAccount(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "disableNewsMakerAccount":
			try {
				this.disableNewsMakerAccount(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "enableNewsMakerAccount":
			try {
				this.enableNewsMakerAccount(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "disableManageAccount":
			try {
				this.disableManageAccount(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "enableManageAccount":
			try {
				this.enableManageAccount(req,resp);
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

	private void enableManageAccount(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String account = req.getParameter("account");
		this.manageService.enableAccount(account);
		pw.print(true);
	}

	private void disableManageAccount(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String account = req.getParameter("account");
		this.manageService.disableAccount(account);
		pw.print(true);
	}

	private void enableNewsMakerAccount(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String account = req.getParameter("account");
		this.newsMakerservice.enableAccount(account);
		resp.sendRedirect(path+"/manage/index/toManageNewsMaker");
		pw.print(true);
	}

	private void disableNewsMakerAccount(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String account = req.getParameter("account");
		this.newsMakerservice.disableAccount(account);
		resp.sendRedirect(path+"/manage/index/toManageNewsMaker");
		pw.print(true);
	}

	private void enableUserAccount(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String account = req.getParameter("account");
		this.userService.enableAccount(account);
		resp.sendRedirect(path+"/manage/index/toManageUser");
		pw.print(true);
	}

	private void disableUserAccount(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String account = req.getParameter("account");
		this.userService.disableAccount(account);
		resp.sendRedirect(path+"/manage/index/toManageUser");
		pw.print(true);
	}
}
