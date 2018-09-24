package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
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
import service.ApplyMessageService;
import service.ManageService;
import service.NewsMakerService;
import service.UserService;
import util.Encryption;

@WebServlet(urlPatterns = "/register/*")
public class RegisterAction extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	PrintWriter pw = null;
	String path = null;
	private ManageService manageService = new ManageService();
	private NewsMakerService newsMakerService = new NewsMakerService();
	private UserService userService = new UserService();
	private ApplyMessageService applyMessageService = new ApplyMessageService();

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
		System.out.println(uri);
		switch (action) {
		case "in":
			try {
				this.registerIn(req, resp);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "checkAccount":
			try {
				this.checkAccount(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "checkCode":
			this.checkCode(req,resp);
			break;
		default:
			break;
		}
	}


	private void checkCode(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		// TODO Auto-generated method stub
		String user_code = req.getParameter("code");
		String real_code = (String) session.getAttribute("CODEINSESSION");
		if(real_code.equals(user_code)){
			pw.print("1");
		}else{
			pw.print("0");
		}
	}

	private void checkAccount(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String account = req.getParameter("account");
		String kind = req.getParameter("kind");
		boolean flag = false;
		switch (kind) {
		case "1":
			flag = this.manageService.checkAccount(account);
			break;
		case "2":
			flag = this.userService.checkAccount(account);
			break;
		case "3":
			flag = this.newsMakerService.checkAccount(account);
			break;
		default:
			break;
		}
		if (flag) {
			pw.write("1");
		} else {
			pw.write("0");
		}
	}

	private void registerIn(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		// TODO Auto-generated method stub
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
		fileUpload.setHeaderEncoding("UTF-8");
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
		for (FileItem fileItem : list) {
			if (fileItem.isFormField()) {
				formFieldMap.put(fileItem.getFieldName(), new String (fileItem.getString("UTF-8").getBytes(),"UTF-8"));
			} else {
				String account = formFieldMap.get("account");
				if (fileItem.getName() == "") {
					fileName = "default.jpg";	
					continue;
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
		for (String keySet : formFieldMap.keySet()) {
			System.out.println(keySet + ":" + formFieldMap.get(keySet));
		}
		String kind = formFieldMap.get("kind");
		String account = formFieldMap.get("account");
		String password = formFieldMap.get("password");
		String name = formFieldMap.get("name");
		String logo = fileName;
		switch (kind) {
		case "1":
			Manage manage = new Manage(account, password, name, logo);
			manageService.register(manage);
			this.applyMessageService.addNewApply(account, kind);// 1是管理员 3是新闻发布员
			session.setAttribute("REGISTERMESSAGEINSESSION", "申请管理员成功！已提交申请,请等待其他管理员处理");
			break;
		case "2":
			User user = new User(account, password, name, logo);
			this.userService.register(user);
			session.setAttribute("REGISTERMESSAGEINSESSION","申请普通用户成功！可直接登录");
			break;
		case "3":
			NewsMaker newsMaker = new NewsMaker(account, password, name, logo);
			newsMakerService.register(newsMaker);
			this.applyMessageService.addNewApply(account, kind);// 1是管理员 3是新闻发布员
			session.setAttribute("REGISTERMESSAGEINSESSION", "申请新闻发布员成功！已提交申请,请等待其他管理员处理");
			break;
		default:
			break;
		}
		resp.sendRedirect(req.getContextPath() + "/jsps/registerSuccess.jsp");
	}

}
