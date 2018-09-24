package action.user;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
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
import service.ManageService;
import service.NewsMakerService;
import service.UserService;

@WebServlet(urlPatterns = "/user/modifyInfo/*")
public class ModifyInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	PrintWriter pw = null;
	String path = null;
	private NewsMakerService newsMakerService = new NewsMakerService();
	private UserService userService = new UserService();
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
		case "modifyName":
			try {
				this.modifyNameAction(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "modifyLogo":
			try {
				this.modifyLogoAction(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "modifyEmail":
			try {
				this.modifyEmail(req,resp);
			} catch (SQLException | MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		default:
			break;
		}
		return;
	}

	private void modifyEmail(HttpServletRequest req, HttpServletResponse resp) throws SQLException, MessagingException, IOException {
		// TODO Auto-generated method stub
		User user = (User) session.getAttribute("USERINSESSION");
		String email = req.getParameter("email");
		String account = user.getAccount();
		this.userService.setEmail(account,email);
		resp.sendRedirect(path+"/jsps/user/modifyInfo.jsp");
	}

	private void modifyLogoAction(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		// TODO Auto-generated method stub
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
		User currentUser = (User) session.getAttribute("NEWSMAKERINSESSION");
		String account = currentUser.getAccount();
		for (FileItem fileItem : list) {
			if (fileItem.isFormField()) {
				formFieldMap.put(fileItem.getFieldName(), fileItem.getString());
			} else {
				if (fileItem.getName() == "") {
					break;
				}
				fileName = fileItem.getName().substring(fileItem.getName().lastIndexOf('.'));
				// 获得图片格式类型
				fileName = account + fileName;
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
		String logo = fileName;
		currentUser.setLogo(logo);
		session.setAttribute("USERINSESSION", currentUser);
		this.newsMakerService.setLogo(account, logo);
		resp.sendRedirect(path+"/jsps/manage/modifyInfo.jsp");
	}

	private void modifyNameAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		User currentUser = (User) session.getAttribute("USERINSESSION");
		String account = currentUser.getAccount();
		currentUser.setName(name);
		this.newsMakerService.setName(account, name);
		session.setAttribute("USERINSESSION", currentUser);
		pw.print(true);
	}
}
