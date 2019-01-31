package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.ManageService;
import util.EmailUtil;

@WebServlet(urlPatterns="/checkEmail/*")
public class EmailCheckServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ManageService manageService  = new ManageService();
	HttpSession session = null;
	PrintWriter pw = null;
	String path = null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		session = req.getSession();
		path = req.getContextPath();
		pw = resp.getWriter();
		String uri = req.getRequestURI();
		String action = uri.substring(uri.lastIndexOf('/') + 1);
		switch (action) {
		case "getEmailCode":
			try {
				this.getEmailCodeAction(req, resp);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "modifyPassword":
			try {
				this.modifyPasswordAction(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
		System.out.println(uri);
	}
	
	private void modifyPasswordAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String password = req.getParameter("password");
		String email = (String) session.getAttribute("HISEMAIL");
		this.manageService.setPassowrd(email, password);
		resp.sendRedirect(path+"");
	}

	private void getEmailCodeAction(HttpServletRequest req, HttpServletResponse resp) throws MessagingException {
		// TODO Auto-generated method stub
//		String email = "287595523@qq.com";
		String email = req.getParameter("email");
		int code = (int) (Math.random()*899999+100000);//100000~999999
		EmailUtil.sendCodeEmail(email, code+"");
		session.setAttribute("HISEMAIL", email);
		pw.print(code);
	}
}
