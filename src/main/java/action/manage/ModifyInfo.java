package action.manage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import service.ManageService;

@WebServlet(urlPatterns = "/manage/modifyInfo/*")
public class ModifyInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	PrintWriter pw = null;
	String path = null;
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
				this.modifyEmailAction(req,resp);
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

	private void modifyEmailAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		Manage currentManage = (Manage) session.getAttribute("MANAGEINSESSION");
		String account = currentManage.getAccount();
		currentManage.setEmail(email);
		this.manageService.setName(account, email);
		session.setAttribute("MANAGEINSESSION", currentManage);
		pw.print(true);
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
		Manage currentManage = (Manage) session.getAttribute("MANAGEINSESSION");
		String account = currentManage.getAccount();
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
		currentManage.setLogo(logo);
		session.setAttribute("MANAGEINSESSION", currentManage);
		this.manageService.setLogo(account, logo);
		resp.sendRedirect(path+"/jsps/manage/modifyInfo.jsp");
	}

	private void modifyNameAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		Manage currentManage = (Manage) session.getAttribute("MANAGEINSESSION");
		String account = currentManage.getAccount();
		currentManage.setName(name);
		this.manageService.setName(account, name);
		session.setAttribute("MANAGEINSESSION", currentManage);
		pw.print(true);
	}
}
