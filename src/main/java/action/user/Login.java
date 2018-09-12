package action.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Manage;
import pojo.NewsMaker;
import pojo.User;
import service.ManageService;
import service.NewsMakerService;
import service.UserService;

@WebServlet(urlPatterns="/user/login/*")
public class Login extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	PrintWriter pw = null;
	String path = null;
	UserService service = new UserService();
	
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
		case "check":
			try {
				this.checkAction(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "index":
			this.checkSessionAction(req,resp);
			break;
		case "logout":
			this.logoutAction(req,resp);
			break;
		default:
				break;
		
		}
		return;
	}

	private void logoutAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// TODO Auto-generated method stub
		this.session.removeAttribute("USERINSESSION");
		resp.sendRedirect(path+"/jsps/index.jsp");
	}

	private void checkSessionAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(session.getAttribute("USERINSESSION")!= null){
			req.getRequestDispatcher("/jsps/user/index.jsp").forward(req, resp);
		}else{
			resp.sendRedirect(path+"/jsps/index.jsp");
		}
	}

	private void checkAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String account = req.getParameter("account");
		String password = req.getParameter("password");
		User user  = this.service.checkLogin(account, password);

		// 如果User不是空，证明账号密码正确
		if (user != null) {
			session.setAttribute("USERINSESSION", user);
			pw.print(true);
		} else {
			pw.print(false);
		}
		return;
	}
	
}
